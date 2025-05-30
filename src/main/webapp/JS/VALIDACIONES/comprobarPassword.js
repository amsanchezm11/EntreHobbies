import {checkPassword, validarFormulario, validarFormularioPassword} from "./regex.js";

document.getElementById("password").addEventListener("input", async () => {
    const inputPassword = document.getElementById("password");
    const idUsuario = document.querySelector("input[name='idUsuario']").value;
    const passwordValor = inputPassword.value;

    if (!checkPassword(inputPassword)){
        validarFormularioPassword('formPassword','boton-password');
        return;
    }

    const data = new URLSearchParams();
    data.append("accion", "comprobar-password");
    data.append("idUsuario", idUsuario);
    data.append("password", passwordValor);

    try {
        const response = await fetch("Ajax", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
                "Accept-Charset": "UTF-8"
            },
            body: data.toString()
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const result = await response.json();

        if (result.correcta) {
            inputPassword.classList.remove("is-invalid");
            inputPassword.classList.add("is-valid");
        } else {
            inputPassword.classList.remove("is-valid");
            inputPassword.classList.add("is-invalid");
        }

        validarFormularioPassword('formPassword','boton-password');

    } catch (error) {
        console.error("Error al comprobar la contraseña actual:", error);
        inputPassword.classList.remove("is-valid");
        inputPassword.classList.add("is-invalid");
        validarFormulario('boton-password');
    }
});
