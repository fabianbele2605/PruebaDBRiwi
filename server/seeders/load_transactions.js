import fs from 'fs';
import path from 'path';
import csv from 'csv-parser';
import { pool } from "../conexion_DB.js";

export async function cargarTransactionsAlaBaseDeDatos() {
    const rutaArchivo = path.resolve('server/data/03_transacciones.csv');
    
    if (!fs.existsSync(rutaArchivo)) {
        throw new Error(`El archivo ${rutaArchivo} no existe.`);
    }
    console.log(`📂 Leyendo archivo: ${rutaArchivo}`);

    const transactions = [];

    const connection = await pool.getConnection();
    try {
        await connection.beginTransaction();

        await new Promise((resolve, reject) => {
            fs.createReadStream(rutaArchivo)
                .pipe(csv({
                    separator: ',',
                    strict: true,
                    skipLines: 0,
                    mapHeaders: ({ header }) => header.trim().replace(/"/g, ''),
                }))
                .on("data", (fila) => {
                    // console.log('📄 Fila parseada:', JSON.stringify(fila)); // Opcional: Descomentar para depurar
                    
                    const transaction_id = fila['ID de la Transacción']?.trim();
                    
                    // --- CORRECCIÓN 1: Convertir la fecha a un timestamp de Unix ---
                    const dateString = fila['Fecha y Hora de la Transacción']?.trim();
                    const transaction_date_time = dateString ? new Date(dateString).getTime() / 1000 : null;
                    
                    const transaction_amount = parseFloat(fila['Monto de la Transacción']?.trim());
                    const transaction_status = fila['Estado de la Transacción']?.trim();
                    const transaction_type = fila['Tipo de Transacción']?.trim() || 'Pago de Factura';
                    const platform_used = fila['Plataforma Utilizada']?.trim();
                    
                    // --- CORRECCIÓN 2: Usar Monto de la Transacción en lugar de la columna que falta ---
                    const paid_amount = transaction_amount; 

                    const identification_number = parseInt(fila['Número de Identificación']?.trim());
                    const invoice_number = fila['Número de Factura']?.trim();

                    // --- Mover la validación de `platform_used` y `transaction_status` ---
                    const isValidStatus = transaction_status && ['Pendiente', 'Fallida', 'Completada'].includes(transaction_status);
                    const isValidPlatform = platform_used && ['Nequi', 'Daviplata'].includes(platform_used);

                    if (
                        transaction_id && transaction_id.length > 0 &&
                        transaction_date_time !== null && !isNaN(transaction_date_time) &&
                        !isNaN(transaction_amount) &&
                        isValidStatus &&
                        isValidPlatform && // Nueva validación de plataforma
                        !isNaN(paid_amount) &&
                        !isNaN(identification_number) &&
                        invoice_number && invoice_number.length > 0
                    ) {
                        transactions.push([transaction_id, transaction_date_time, transaction_amount, transaction_status, transaction_type, platform_used, paid_amount, identification_number, invoice_number]);
                    } else {
                        console.warn(`⚠️ Fila ignorada en el CSV: datos incompletos o no válidos - ${JSON.stringify(fila)}`);
                    }
                })
                .on('end', async () => {
                    // ... (El resto del código para la inserción es correcto y no necesita cambios)
                    try {
                        if (transactions.length > 0) {
                            const validTransactions = [];
                            for (const transaction of transactions) {
                                const [,,, , , , , identification_number, invoice_number] = transaction;
                                const [customers] = await connection.query('SELECT Identification_Number FROM Customers WHERE Identification_Number = ?', [identification_number]);
                                if (customers.length === 0) {
                                    console.warn(`⚠️ Identification_Number = ${identification_number} no existe. Fila ignorada.`);
                                    continue;
                                }
                                const [invoices] = await connection.query('SELECT Invoice_Number FROM Invoices WHERE Invoice_Number = ?', [invoice_number]);
                                if (invoices.length === 0) {
                                    console.warn(`⚠️ Invoice_Number = ${invoice_number} no existe. Fila ignorada.`);
                                    continue;
                                }
                                validTransactions.push(transaction);
                            }

                            if (validTransactions.length > 0) {
                                const sql = 'INSERT INTO Transactions (Transaction_ID, Transaction_Date_Time, Transaction_Amount, Transaction_Status, Transaction_Type, Platform_Used, Paid_Amount, Identification_Number, Invoice_Number) VALUES ?';
                                const [result] = await connection.query(sql, [validTransactions]);
                                console.log(`✅ Se insertaron ${result.affectedRows} transactions desde CSV.`);
                            } else {
                                console.log('⚠️ No se encontraron transactions válidas después de la validación.');
                            }
                        } else {
                            console.log('⚠️ No se encontraron transactions válidas en el CSV.');
                        }
                        await connection.commit();
                        console.log('✅ Transacción de transactions confirmada.');
                        resolve();
                    } catch (error) {
                        await connection.rollback();
                        console.error('❌ Error al insertar transactions desde CSV:', error.message);
                        reject(error);
                    }
                })
                .on('error', (err) => {
                    console.error('❌ Error al leer el archivo CSV de transactions:', err.message);
                    reject(err);
                });
        });
    } catch (error) {
        await connection.rollback();
        console.error('❌ Error en la carga de transactions, transacción revertida:', error.message);
        throw error;
    } finally {
        connection.release();
    }
}