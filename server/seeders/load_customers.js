import fs from 'fs';
import path from 'path';
import csv from 'csv-parser';
import { pool } from '../conexion_DB.js';

export async function cargarCustomersAlaBaseDeDatos() {
    const rutaArchivo = path.resolve('server/data/01_cliente.csv');
    
    if (!fs.existsSync(rutaArchivo)) {
        throw new Error(`El archivo ${rutaArchivo} no existe.`);
    }
    console.log(`📂 Leyendo archivo: ${rutaArchivo}`);

    const connection = await pool.getConnection();
    try {
        await connection.beginTransaction();

        const customers = [];

        await new Promise((resolve, reject) => {
            fs.createReadStream(rutaArchivo)
                .pipe(csv({ strict: true, skipLines: 0 }))
                .on("data", (fila) => {
                    console.log('📄 Fila leída:', JSON.stringify(fila));
                    customers.push([
                        fila['Número de Identificación'] ? parseInt(fila['Número de Identificación'].trim()) : null,
                        fila['Nombre del Cliente'] ? fila['Nombre del Cliente'].trim() : 'Unknown',
                        fila.Dirección ? fila.Dirección.trim() : 'Unknown',
                        fila.Teléfono ? fila.Teléfono.trim() : null,
                        fila['Correo Electrónico'] ? fila['Correo Electrónico'].trim() : null
                    ]);
                })
                .on('end', async () => {
                    try {
                        if (customers.length > 0) {
                            const sql = 'INSERT INTO Customers (Identification_Number, Customer_Name, Address, Phone, Email) VALUES ?';
                            const [result] = await connection.query(sql, [customers]);
                            console.log(`✅ Se insertaron ${result.affectedRows} customers desde CSV.`);
                        } else {
                            console.log('⚠️ No se encontraron customers válidos en el CSV.');
                        }
                        resolve();
                    } catch (error) {
                        console.error('❌ Error al insertar customers desde CSV:', error.message);
                        reject(error);
                    }
                })
                .on('error', (err) => {
                    console.error('❌ Error al leer el archivo CSV de customers:', err.message);
                    reject(err);
                });
        });

        await connection.commit();
        console.log('✅ Transacción de customers confirmada.');
    } catch (error) {
        await connection.rollback();
        console.error('❌ Error en la carga de customers, transacción revertida:', error.message);
        throw error;
    } finally {
        connection.release();
    }
}