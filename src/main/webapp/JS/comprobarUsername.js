import {checkUsername, validarFormulario} from "./regex.js";

document.getElementById("username").addEventListener("change", async () => {

    const inputUsername = document.getElementById("username");

    // Primero validamos el username con regex
    if (!checkUsername(inputUsername)) {
        validarFormulario();
        console.log("No es valido el formato no se hace la sincronia");
        return;
    }

    const URLusername = 'Ajax';
    const data = new URLSearchParams();
    const usernameValor = document.getElementById("username").value;

    data.append("accion", "comprobar-username");
    data.append("username", usernameValor);

    try {
        const response = await fetch(URLusername, {
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

        // Comprobamos la disponibilidad del username
        if (responseData.disponible) {

            // Indicamos al usuario que no es válido el username
            inputUsername.classList.remove("is-valid");
            inputUsername.classList.add("is-invalid");
            validarFormulario();
        } else {

            // Indicamos al usuario que si es válido el username
            inputUsername.classList.remove("is-invalid");
            inputUsername.classList.add("is-valid");
            validarFormulario();
        }

    } catch (error) {
        inputUsername.classList.remove("is-valid");
        inputUsername.classList.add("is-invalid");
        validarFormulario();
        return false;
    }
});

// Regex para username (letras/números, sin espacios, entre 3 y 20 caracteres)
// function checkUsername(element) {
//     let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ0-9]{3,20}$/;
//     return comprobarRegex(element, regex, 20);
// }



