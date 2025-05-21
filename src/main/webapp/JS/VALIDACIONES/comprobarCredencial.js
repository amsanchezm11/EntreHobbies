document.addEventListener("DOMContentLoaded", () => {
    const input = document.getElementById("credencial");
    const aviso = document.getElementById("aviso");
    const passwordContainer = document.getElementById("passwordContainer");
    const passwordInput = document.getElementById("floatingPassword");
    const btnEnviar = document.getElementById("enviar");

    let credencialValida = false;

    async function comprobarCredencial() {
        const valor = input.value.trim();
        if (valor === "") return;

        const esEmail = valor.includes("@");
        const data = new URLSearchParams();
        data.append("accion", "comprobar-credencial");
        data.append("credencial", valor);

        try {
            const response = await fetch("Ajax", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                    "Accept-Charset": "utf-8"
                },
                body: data.toString()
            });

            if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);

            const res = await response.json();

            if (res.disponible) {
                aviso.classList.add("invisible");
                passwordContainer.classList.remove("d-none");
                btnEnviar.classList.remove("d-none");
                credencialValida = true;
            } else {
                const mensajeEmail = "<i class='bi bi-exclamation-triangle-fill text-light'></i> El email no existe en nuestra base de datos";
                const mensajeUsername = "<i class='bi bi-exclamation-triangle-fill text-light'></i> El username no existe en nuestra base de datos";

                aviso.innerHTML = esEmail
                    ? mensajeEmail
                    : mensajeUsername;
                aviso.classList.remove("invisible");
                passwordContainer.classList.add("d-none");
                btnEnviar.classList.add("d-none");
                credencialValida = false;
                passwordInput.value = "";
            }

            validarCampos();
        } catch (err) {
            console.error("Error al comprobar la credencial:", err);
            aviso.textContent = "Error al comprobar la credencial.";
            aviso.classList.remove("invisible");
            passwordContainer.classList.add("d-none");
            btnEnviar.classList.add("d-none");
            credencialValida = false;
        }
    }

    function validarCampos() {
        btnEnviar.disabled = !(credencialValida && passwordInput.value.trim() !== "");
    }

    input.addEventListener("change", comprobarCredencial);
    passwordInput.addEventListener("input", validarCampos);
});
