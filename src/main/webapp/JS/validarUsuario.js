import {checkNombre, checkApellidos, checkFechaNacimiento, checkLocalidad, checkProvincia, checkPassword, confirmPassword, checkAvatar, checkSexo,checkCondiciones, validarFormulario} from "./regex.js";

//-----------------------------------------
// Añadimos los eventos de comprobación de regex a los inputs del formulario
//-----------------------------------------
document.getElementById("nombre").addEventListener("input", e => {
    checkNombre(e.target);
    validarFormulario('enviar'); // Comprobar si el formulario está completo
});
document.getElementById("apellidos").addEventListener("input", e => {
    checkApellidos(e.target);
    validarFormulario('enviar');
});
document.getElementById("fechaNacimiento").addEventListener("input", e => {
    checkFechaNacimiento(e.target);
    validarFormulario('enviar');
});
document.getElementById("localidad").addEventListener("input", e => {
    checkLocalidad(e.target);
    validarFormulario('enviar');
});
document.getElementById("provincia").addEventListener("input", e => {
    checkProvincia(e.target);
    validarFormulario('enviar');
});
document.getElementById("password").addEventListener("input", e => {
    checkPassword(e.target);
    validarFormulario('enviar');
});
document.getElementById("passwordRepe").addEventListener("input", e => {
    confirmPassword(e.target);
    validarFormulario('enviar');
});
document.getElementById("avatar").addEventListener("change", e => {
    checkAvatar(e.target);
    validarFormulario('enviar');
});
document.getElementById("sexo").addEventListener("change",e=>{
    checkSexo(e.target);
    validarFormulario('enviar');
});
document.getElementById("aceptoCondiciones").addEventListener("change", e=> {
    checkCondiciones(e.target);
    validarFormulario('enviar');
});


/*-------LOGICA PARA FORMULARIO DE 2 PASOS-------*/

document.addEventListener("DOMContentLoaded", function () {
    function mostrarPaso(numero) {
        // Oculta todos los pasos
        document.querySelectorAll('.paso').forEach(paso => paso.classList.remove('activo'));
        // Muestra el paso actual
        const pasoActual = document.getElementById('paso' + numero);
        if (pasoActual) {
            pasoActual.classList.add('activo');
        }
    }

    // Botones "Siguiente"
    document.querySelectorAll(".btn-siguiente").forEach(boton => {
        boton.addEventListener("click", function () {
            const paso = this.getAttribute("data-paso");
            mostrarPaso(paso);
        });
    });

    // Botones "Anterior"
    document.querySelectorAll(".btn-anterior").forEach(boton => {
        boton.addEventListener("click", function () {
            const paso = this.getAttribute("data-paso");
            mostrarPaso(paso);
        });
    });
});
