import dotenv from "dotenv";
import { cargarCustomersAlaBaseDeDatos } from "./load_customers.js";
import { cargarInvoicesAlaBaseDeDatos } from "./load_invoices.js";
import { cargarTransactionsAlaBaseDeDatos } from "./load_transactions.js";
import mysql from "mysql2/promise";

dotenv.config();

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    connectionLimit: 10,
    waitForConnections: true,
    queueLimit: 0
});

async function limpiarTablas(connection) {
    try {
        await connection.query('SET FOREIGN_KEY_CHECKS = 0');
        await connection.query('TRUNCATE TABLE Transactions');
        await connection.query('TRUNCATE TABLE Invoices');
        await connection.query('TRUNCATE TABLE Customers');
        await connection.query('SET FOREIGN_KEY_CHECKS = 1');
        console.log('✅ Tablas limpiadas.');
    } catch (error) {
        console.error('❌ Error al limpiar tablas:', error.message);
        throw error;
    }
}

(async () => {
    const connection = await pool.getConnection();
    try {
        console.log('🚀 Iniciando carga de datos...');
        await connection.beginTransaction();
        
        await limpiarTablas(connection);
        await cargarCustomersAlaBaseDeDatos();
        console.log('✅ Carga de customers completada.');
        
        try {
            await cargarInvoicesAlaBaseDeDatos();
            console.log('✅ Carga de invoices completada.');
        } catch (error) {
            console.warn('⚠️ Continuando a pesar del error en invoices:', error.message);
        }
        
        try {
            await cargarTransactionsAlaBaseDeDatos();
            console.log('✅ Carga de transactions completada.');
        } catch (error) {
            console.warn('⚠️ Error en transactions, pero continuando:', error.message);
        }
        
        await connection.commit();
        console.log('✅ Transacción global confirmada.');
    } catch (error) {
        await connection.rollback();
        console.error('❌ Error crítico al cargar datos, transacción revertida:', error.message);
        console.error('Detalles:', error);
    } finally {
        connection.release();
        await pool.end();
        console.log('🔌 Conexión a la base de datos cerrada.');
        process.exit();
    }
})();