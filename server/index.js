import fs from 'fs';
import path from 'path';
import csv from 'csv-parser';
import cors from "cors";
import express from "express";
import { pool } from "./conexion_DB.js";

const app = express();
app.use(cors());
app.use(express.json());

// Función para cargar los datos desde el CSV
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
                    const transaction_id = fila['ID de la Transacción']?.trim();
                    const dateString = fila['Fecha y Hora de la Transacción']?.trim();
                    const transaction_date_time = dateString ? new Date(dateString).getTime() / 1000 : null;
                    const transaction_amount = parseFloat(fila['Monto de la Transacción']?.trim());
                    const transaction_status = fila['Estado de la Transacción']?.trim();
                    const transaction_type = fila['Tipo de Transacción']?.trim() || 'Pago de Factura';
                    const platform_used = fila['Plataforma Utilizada']?.trim();
                    const paid_amount = transaction_amount; 
                    const identification_number = parseInt(fila['Número de Identificación']?.trim());
                    const invoice_number = fila['Número de Factura']?.trim();

                    const isValidStatus = transaction_status && ['Pendiente', 'Fallida', 'Completada'].includes(transaction_status);
                    const isValidPlatform = platform_used && ['Nequi', 'Daviplata'].includes(platform_used);

                    if (
                        transaction_id && transaction_id.length > 0 &&
                        transaction_date_time !== null && !isNaN(transaction_date_time) &&
                        !isNaN(transaction_amount) &&
                        isValidStatus &&
                        isValidPlatform &&
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

// ✨ ENDPOINT CORREGIDO: CRUD - READ
app.get('/transactions', async (req, res) => {
    try {
        const [rows] = await pool.query(`
        SELECT 
            t.Transaction_ID,
            t.Transaction_Date_Time,
            t.Transaction_Amount,
            t.Transaction_Status,
            t.Paid_Amount,
            t.Platform_Used,
            c.Customer_Name AS customer_name,
            i.Invoice_Number, 
            i.Billed_Amount AS billed_amount
        FROM Transactions t
        LEFT JOIN Customers c ON t.Identification_Number = c.Identification_Number
        LEFT JOIN Invoices i ON t.Invoice_Number = i.Invoice_Number
        `);
        res.json(rows);
    } catch (error) {
        res.status(500).json({
            status: 'error',
            endpoint: req.originalUrl,
            method: req.method,
            message: error.message
        });
    }
});

app.get('/transactions/:transaction_id', async (req, res) => {
    try {
        const { transaction_id } = req.params;
        const [rows] = await pool.query(`
        SELECT 
            t.Transaction_ID,
            t.Transaction_Date_Time,
            t.Transaction_Amount,
            t.Transaction_Status,
            t.Paid_Amount,
            c.Customer_Name AS customer,
            i.Invoice_Number, 
            i.Billed_Amount AS billed_amount
        FROM Transactions t
        LEFT JOIN Customers c ON t.Identification_Number = c.Identification_Number
        LEFT JOIN Invoices i ON t.Invoice_Number = i.Invoice_Number
        WHERE t.Transaction_ID = ?
        `, [transaction_id]);
        res.json(rows[0] || {});
    } catch (error) {
        res.status(500).json({
            status: 'error',
            endpoint: req.originalUrl,
            method: req.method,
            message: error.message
        });
    }
});

// Endpoint para obtener todos los clientes
app.get('/customers', async (req, res) => {
    try {
        const query = 'SELECT * FROM Customers';
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error) {
        res.status(500).json({
            status: 'error',
            endpoint: req.originalUrl,
            method: req.method,
            message: error.message
        });
    }
});

// Leer todas las facturas
app.get('/invoices', async (req, res) => {
    try {
        const query = 'SELECT * FROM Invoices';
        const [rows] = await pool.query(query);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


// ✨ ENDPOINT CORREGIDO CON VALIDACIÓN: CRUD - CREATE
app.post('/transactions', async (req, res) => {
    try {
        const { identification_number, invoice_number, transaction_date_time, transaction_amount, transaction_status, platform_used, paid_amount, transaction_type } = req.body;
        
        if (!identification_number) {
            return res.status(400).json({ mensaje: "El número de identificación es obligatorio." });
        }
        
        const query = `
        INSERT INTO Transactions 
        (Identification_Number, Invoice_Number, Transaction_Date_Time, Transaction_Amount, Transaction_Status, Platform_Used, Paid_Amount, Transaction_Type)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `;
        const values = [identification_number, invoice_number, transaction_date_time, transaction_amount, transaction_status, platform_used, paid_amount, transaction_type || 'Invoice Payment'];
        const [result] = await pool.query(query, values);
        res.status(201).json({ mensaje: "Transaction created successfully" });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            endpoint: req.originalUrl,
            method: req.method,
            message: error.message
        });
    }
});

// CRUD - UPDATE
app.put('/transactions/:transaction_id', async (req, res) => {
    try {
        const { transaction_id } = req.params;
        const { identification_number, invoice_number, transaction_date_time, transaction_amount, transaction_status, platform_used, paid_amount, transaction_type } = req.body;
        const query = `
        UPDATE Transactions SET 
            Identification_Number = ?,
            Invoice_Number = ?,
            Transaction_Date_Time = ?,
            Transaction_Amount = ?,
            Transaction_Status = ?,
            Platform_Used = ?,
            Paid_Amount = ?,
            Transaction_Type = ?
        WHERE Transaction_ID = ?
        `;
        const values = [identification_number, invoice_number, transaction_date_time, transaction_amount, transaction_status, platform_used, paid_amount, transaction_type || 'Invoice Payment', transaction_id];
        const [result] = await pool.query(query, values);
        if (result.affectedRows > 0) {
            return res.json({ mensaje: "Transaction updated" });
        }
        res.status(404).json({ mensaje: "Transaction not found" });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            endpoint: req.originalUrl,
            method: req.method,
            message: error.message
        });
    }
});

// CRUD - DELETE
app.delete('/transactions/:transaction_id', async (req, res) => {
    try {
        const { transaction_id } = req.params;
        const query = `DELETE FROM Transactions WHERE Transaction_ID = ?`;
        const [result] = await pool.query(query, [transaction_id]);
        if (result.affectedRows > 0) {
            return res.json({ mensaje: "Transaction deleted" });
        }
        res.status(404).json({ mensaje: "Transaction not found" });
    } catch (error) {
        res.status(500).json({
            status: 'error',
            endpoint: req.originalUrl,
            method: req.method,
            message: error.message
        });
    }
});

// DASHBOARD - Consulta avanzada 1
app.get('/transactions/total_paid_by_customer', async (req, res) => {
    try {
        const [rows] = await pool.query(`
            SELECT
                c.Customer_Name AS customer_name,
                c.Identification_Number AS identification_number,
                SUM(t.Paid_Amount) AS total_paid
            FROM Transactions t
            JOIN Customers c ON t.Identification_Number = c.Identification_Number
            GROUP BY c.Identification_Number
            ORDER BY total_paid DESC
        `);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// DASHBOARD - Consulta avanzada 2
app.get('/invoices/pending', async (req, res) => {
    try {
        const [rows] = await pool.query(`
            SELECT
                i.Invoice_Number,
                c.Customer_Name,
                i.Billed_Amount,
                SUM(t.Paid_Amount) AS total_paid,
                (i.Billed_Amount - SUM(t.Paid_Amount)) AS amount_due
            FROM Invoices i
            JOIN Customers c ON i.Identification_Number = c.Identification_Number
            LEFT JOIN Transactions t ON i.Invoice_Number = t.Invoice_Number
            GROUP BY i.Invoice_Number
            HAVING amount_due > 0
            ORDER BY i.Invoice_Number
        `);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// DASHBOARD - Consulta avanzada 3
app.get('/transactions/by_platform/:platform_used', async (req, res) => {
    try {
        const { platform_used } = req.params;
        const [rows] = await pool.query(`
            SELECT
                t.Transaction_ID,
                t.Transaction_Date_Time,
                t.Transaction_Amount,
                t.Transaction_Status,
                t.Platform_Used,
                c.Customer_Name AS customer_name,
                t.Invoice_Number
            FROM Transactions t
            JOIN Customers c ON t.Identification_Number = c.Identification_Number
            WHERE t.Platform_Used = ?
            ORDER BY t.Transaction_Date_Time DESC
        `, [platform_used]);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});


app.listen(3000, () => {
    console.log("Servidor preparado correctamente en http://localhost:3000");
});