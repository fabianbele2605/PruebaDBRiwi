const API_URL = "http://localhost:3000/transactions";
const tablaTransacciones = document.getElementById("tablaTransacciones");
const transaccionForm = document.getElementById("transaccionForm");

// Cargar lista
async function cargarTransacciones() {
    try {
        const res = await fetch(API_URL);
        const data = await res.json();

        tablaTransacciones.innerHTML = "";
        data.forEach(t => {
            const fechaLegible = new Date(t.Transaction_Date_Time * 1000).toLocaleString();

            tablaTransacciones.innerHTML += `
                <tr>
                    <td>${t.Transaction_ID}</td>
                    <td>${t.customer_name}</td>
                    <td>${t.Invoice_Number}</td>
                    <td>${fechaLegible}</td>
                    <td>${t.Transaction_Amount}</td>
                    <td>${t.Transaction_Status}</td>
                    <td>${t.Paid_Amount}</td>
                    <td>${t.Platform_Used}</td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editarTransaccion('${t.Transaction_ID}')">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="eliminarTransaccion('${t.Transaction_ID}')">Eliminar</button>
                    </td>
                </tr>
            `;
        });
    } catch (error) {
        console.error('Error al cargar transacciones:', error);
        tablaTransacciones.innerHTML = `<tr><td colspan="9">Error al cargar datos: ${error.message}</td></tr>`;
    }
}

// Guardar / Actualizar
transaccionForm.addEventListener("submit", async (e) => {
    e.preventDefault();

    const transaccion = {
        Identification_Number: document.getElementById("identification_number").value,
        Invoice_Number: document.getElementById("invoice_number").value,
        Transaction_Date_Time: document.getElementById("transaction_date_time").value,
        Transaction_Amount: parseFloat(document.getElementById("transaction_amount").value),
        Transaction_Status: document.getElementById("transaction_status").value,
        Platform_Used: document.getElementById("platform_used").value,
        Paid_Amount: parseFloat(document.getElementById("paid_amount").value),
        Transaction_Type: document.getElementById("transaction_type").value || "Invoice Payment"
    };

    const transaction_id = document.getElementById("transaction_id").value;

    try {
        if (transaction_id) {
            // UPDATE
            await fetch(`${API_URL}/${transaction_id}`, {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(transaccion)
            });
        } else {
            // CREATE
            await fetch(API_URL, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(transaccion)
            });
        }

        transaccionForm.reset();
        cargarTransacciones();
    } catch (error) {
        console.error('Error al guardar transacción:', error);
        alert(`Error: ${error.message}`);
    }
});

// Editar
window.editarTransaccion = async (id) => {
    try {
        const res = await fetch(`${API_URL}/${id}`);
        const t = await res.json();

        document.getElementById("transaction_id").value = t.Transaction_ID;
        document.getElementById("identification_number").value = t.Identification_Number;
        document.getElementById("invoice_number").value = t.Invoice_Number;
        document.getElementById("transaction_date_time").value = t.Transaction_Date_Time;
        document.getElementById("transaction_amount").value = t.Transaction_Amount;
        document.getElementById("transaction_status").value = t.Transaction_Status;
        document.getElementById("platform_used").value = t.Platform_Used;
        document.getElementById("paid_amount").value = t.Paid_Amount;
        document.getElementById("transaction_type").value = t.Transaction_Type;
    } catch (error) {
        console.error('Error al cargar transacción para editar:', error);
        alert(`Error: ${error.message}`);
    }
};

// Eliminar
window.eliminarTransaccion = async (id) => {
    if (confirm("¿Seguro que quieres eliminar esta transacción?")) {
        try {
            await fetch(`${API_URL}/${id}`, { method: "DELETE" });
            cargarTransacciones();
        } catch (error) {
            console.error('Error al eliminar transacción:', error);
            alert(`Error: ${error.message}`);
        }
    }
};



// Inicializar
cargarTransacciones();