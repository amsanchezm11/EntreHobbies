import {checkTelefono, validarFormulario} from "./regex.js";

document.getElementById("telefono").addEventListener("change", async () => {

    const inputTelefono = document.getElementById("telefono");

    if (!checkTelefono(inputTelefono)) {
        validarFormulario('enviar');
        return;
    }

    const URLtelefono = 'Ajax';
    const data = new URLSearchParams();
    const telefonoValor = document.getElementById("telefono").value;

    data.append("accion", "comprobar-telefono");
    data.append("telefono", telefonoValor);


    try {
        const response = await fetch(URLtelefono, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded", 'Accept-Charset': 'utf-8'
            },
            body: data.toString()
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const responseData = await response.json();

        // Comprobamos la disponibilidad del correo
        if (responseData.disponible) {
            inputTelefono.classList.remove("is-valid");
            inputTelefono.classList.add("is-invalid");
            validarFormulario('enviar');
        } else {
            inputTelefono.classList.remove("is-invalid");
            inputTelefono.classList.add("is-valid");
            validarFormulario('enviar');
        }


    } catch (error) {
        inputTelefono.classList.remove("is-valid");
        inputTelefono.classList.add("is-invalid");
        validarFormulario('enviar');
        return false;
    }
});


