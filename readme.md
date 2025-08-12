# Transaction Management System

## Description
This is a full-stack web application for managing customer transactions related to invoice payments. The system allows users to perform CRUD operations on transactions, load bulk data from CSV files for customers, invoices, and transactions, and includes user authentication (login and registration). It supports payment platforms like Nequi and Daviplata, tracks transaction statuses (Pending, Failed, Completed), and provides advanced querying endpoints for insights such as most-billed invoices, customers with failed transactions, pending transactions, and transaction history per invoice or customer.

The backend is built with Node.js and Express, connected to a MySQL database. The frontend includes simple HTML forms for login, registration, and transaction management, styled with Bootstrap.

## Instructions to Run the Project
1. **Prerequisites**:
   - Node.js (v18 or higher) installed.
   - MySQL server running (e.g., via XAMPP, or use the provided freeSQLdatabase credentials).
   - Clone the repository: `git clone <repo-url>`.

2. **Setup**:
   - Navigate to the project directory: `cd <project-dir>`.
   - Install dependencies: `npm install`.
   - Create a `.env` file in the root with the following (use provided credentials or your own):
     ```
     DB_HOST=sql5.freesqldatabase.com
     DB_NAME=sql5794719
     DB_PORT=3306
     DB_USER=sql5794719
     DB_PASSWORD=v72e6KHc5P
     ```
   - Ensure the database has the following tables (run these SQL queries manually if needed):
     ```sql
     CREATE TABLE Customers (
         Identification_Number INT PRIMARY KEY,
         Customer_Name VARCHAR(255),
         Address VARCHAR(255),
         Phone VARCHAR(50),
         Email VARCHAR(255)
     );

     CREATE TABLE Invoices (
         Invoice_Number VARCHAR(50) PRIMARY KEY,
         Billing_Period VARCHAR(50),
         Billed_Amount DECIMAL(10,2)
     );

     CREATE TABLE Transactions (
         Transaction_ID VARCHAR(50) PRIMARY KEY,
         Transaction_Date_Time INT,  -- Unix timestamp
         Transaction_Amount DECIMAL(10,2),
         Transaction_Status ENUM('Pendiente', 'Fallida', 'Completada'),
         Transaction_Type VARCHAR(255),
         Platform_Used ENUM('Nequi', 'Daviplata'),
         Paid_Amount DECIMAL(10,2),
         Identification_Number INT,
         Invoice_Number VARCHAR(50),
         FOREIGN KEY (Identification_Number) REFERENCES Customers(Identification_Number),
         FOREIGN KEY (Invoice_Number) REFERENCES Invoices(Invoice_Number)
     );

     CREATE TABLE usuario (
         id INT AUTO_INCREMENT PRIMARY KEY,
         username VARCHAR(255) UNIQUE,
         password VARCHAR(255)
     );
     ```

3. **Run the Application**:
   - Start the backend server: `node server.js` (or the main server file).
   - Start the login server: `node login.js` (runs on port 3005).
   - Open the frontend: Navigate to `index.html` for login/register, or `gestor.html` for transaction management (after login).
   - Access APIs at `http://localhost:3000` (transactions) and `http://localhost:3005` (auth).

4. **Load Data**:
   - Run the data loading script: `node load_data.js` (cleans tables and loads CSVs).

5. **Test**:
   - Register a user via the registration page.
   - Login and manage transactions via the dashboard.

## Technologies Used
- **Backend**: Node.js, Express.js, MySQL (mysql2/promise), bcrypt (for password hashing), csv-parser (for CSV handling), dotenv (for environment variables).
- **Frontend**: HTML, CSS, JavaScript, Bootstrap 5.
- **Others**: Fetch API for client-server communication.

## Explanation of Normalization
The database is normalized to the Third Normal Form (3NF) to reduce redundancy and ensure data integrity:

- **1NF (First Normal Form)**: All columns have atomic values (e.g., no multi-value fields). Each table has a primary key.
- **2NF (Second Normal Form)**: All non-key attributes are fully dependent on the primary key. For example, in Transactions, attributes like Transaction_Amount depend on Transaction_ID.
- **3NF (Third Normal Form)**: No transitive dependencies. Customer details are separated into the Customers table, invoice details into Invoices, and transactions reference them via foreign keys (Identification_Number and Invoice_Number). This avoids duplication (e.g., customer name isn't repeated in every transaction).

This structure ensures efficient querying, prevents anomalies during inserts/updates/deletes, and supports referential integrity via foreign keys.

## Instructions for Bulk Loading from CSV
The system includes scripts to load data from CSV files (`01_cliente.csv`, `02_factura.csv`, `03_transacciones.csv`) into the database:

1. Ensure CSV files are in `server/data/`.
2. Run the loading script: `node load_data.js`.
   - This script:
     - Cleans existing tables (TRUNCATE).
     - Loads customers from `01_cliente.csv`.
     - Loads invoices from `02_factura.csv`.
     - Loads transactions from `03_transacciones.csv`, validating foreign keys (skips invalid rows).
3. Check console logs for success/warnings/errors.
4. Transactions are validated for status ('Pendiente', 'Fallida', 'Completada'), platform ('Nequi', 'Daviplata'), and existence of related customer/invoice.

Note: Dates in transactions CSV are converted to Unix timestamps. Paid_Amount defaults to Transaction_Amount if missing.

## Explanation of Advanced Queries
The backend provides several advanced API endpoints for insights:

- **/invoices/most_billed**: Returns the top 5 invoices with the most transactions, including billed amount and transaction count. Uses GROUP BY, COUNT, ORDER BY, LIMIT.
- **/customers/with_failed**: Lists unique customers with at least one failed transaction ('Fallida'). Uses DISTINCT, JOIN, WHERE.
- **/transactions/pending**: Retrieves all pending transactions ('Pendiente'), with customer name and billed amount. Uses JOIN, WHERE.
- **/transactions/history/:invoice_number**: Shows transaction history for a specific invoice, ordered by date descending. Includes customer name. Uses JOIN, WHERE, ORDER BY.
- **/transactions/customer/:id**: Lists transactions for a specific customer, including invoice details. Uses JOIN, WHERE.

These queries leverage JOINs for relational data, aggregations (COUNT, GROUP BY), filters (WHERE), and sorting/limiting for efficient data retrieval.

## Screenshot of the Relational Model
Below is a textual representation of the ER diagram (use a tool like Draw.io for visual):

```
Customers                  Invoices                   Transactions
-----------------          -----------------          -----------------
Identification_Number (PK) Invoice_Number (PK)        Transaction_ID (PK)
Customer_Name              Billing_Period             Transaction_Date_Time
Address                    Billed_Amount              Transaction_Amount
Phone                                                 Transaction_Status
Email                                                 Transaction_Type
                                                      Platform_Used
                                                      Paid_Amount
                                                      Identification_Number (FK -> Customers)
                                                      Invoice_Number (FK -> Invoices)
```

For a visual screenshot, refer to `relational_model.png` in the repository (imagined; create one showing tables with keys and relationships).

## Colección de Postman


    Endpoints CRUD:

        GET http://localhost:3000/transactions (Obtener todas las transacciones)

        GET http://localhost:3000/invoices (Obtener todas las facturas)

        GET http://localhost:3000/customers (Obtener todos los clientes)

        


## Developer Data
- **Name**: Fabian Enrique Beleño Robles
- **Clan**:  Development Clan Tayrona
- **Email**: fabianrobles321@outlook.com