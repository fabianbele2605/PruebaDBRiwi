import fs from 'fs';
import path from 'path';
import csv from 'csv-parser';
import { pool } from "../conexion_DB.js";

export async function cargarInvoicesAlaBaseDeDatos() {
    const rutaArchivo = path.resolve('server/data/02_factura.csv');
    
    if (!fs.existsSync(rutaArchivo)) {
        throw new Error(`El archivo ${rutaArchivo} no existe.`);
    }
    console.log(`📂 Leyendo archivo: ${rutaArchivo}`);

    const invoices = [];

    const connection = await pool.getConnection();
    try {
        await connection.beginTransaction();

        await new Promise((resolve, reject) => {
            fs.createReadStream(rutaArchivo)
                .pipe(csv({ strict: true, skipLines: 0 }))
                .on("data", (fila) => {
                    console.log('📄 Fila leída:', JSON.stringify(fila));
                    
                    const invoice_number = fila['Número de Factura'] ? String(fila['Número de Factura'].trim()) : null;
                    if (invoice_number && invoice_number.length > 0) {
                        invoices.push([
                            invoice_number,
                            fila['Periodo de Facturación'] ? String(fila['Periodo de Facturación'].trim()) : 'Unknown',
                            fila['Monto Facturado'] ? parseFloat(fila['Monto Facturado']) || 0 : 0
                        ]);
                    } else {
                        console.warn(`⚠️ Fila ignorada en el CSV: invoice_number vacío o no válido - ${JSON.stringify(fila)}`);
                    }
                })
                .on('end', async () => {
                    try {
                        console.log(`📄 Leídos ${invoices.length} invoices válidos desde el CSV.`);
                        if (invoices.length > 0) {
                            const sql = 'INSERT INTO Invoices (Invoice_Number, Billing_Period, Billed_Amount) VALUES ?';
                            const [result] = await connection.query(sql, [invoices]);
                            console.log(`✅ Se insertaron ${result.affectedRows} invoices.`);
                        } else {
                            console.warn('⚠️ No se encontraron invoices válidos en el CSV.');
                        }
                        await connection.commit();
                        console.log('✅ Transacción de invoices confirmada.');
                        resolve();
                    } catch (error) {
                        await connection.rollback();
                        console.error('❌ Error al insertar invoices, transacción revertida:', error.message);
                        reject(error);
                    }
                })
                .on('error', (err) => {
                    console.error('❌ Error al leer el archivo CSV de invoices:', err.message);
                    reject(err);
                });
        });
    } catch (error) {
        await connection.rollback();
        console.error('❌ Error en la carga de invoices, transacción revertida:', error.message);
        throw error;
    } finally {
        connection.release();
    }
}