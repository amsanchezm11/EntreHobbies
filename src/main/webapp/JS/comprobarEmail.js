import {checkEmail, validarFormulario} from "./regex.js";

document.getElementById("email").addEventListener("change", async () => {

    const inputEmail = document.getElementById("email");
    //checkEmail(inputEmail);

    if (!checkEmail(inputEmail)) {
        validarFormulario();
        return;
    }

    const URLemail = 'Ajax';
    const data = new URLSearchParams();
    const emailValor = document.getElementById("email").value;

    data.append("accion", "comprobar-email");
    data.append("email", emailValor);


    try {
        const response = await fetch(URLemail, {
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

            console.log("No valido");
            inputEmail.classList.remove("is-valid");
            inputEmail.classList.add("is-invalid");
            validarFormulario();
        } else {

            console.log("Valido");
            inputEmail.classList.remove("is-invalid");
            inputEmail.classList.add("is-valid");
            validarFormulario();
        }

        //return responseData.disponible;

    } catch (error) {
        console.log("Error catch");
        inputEmail.classList.remove("is-valid");
        inputEmail.classList.add("is-invalid");
        validarFormulario();
        return false;
    }
});


