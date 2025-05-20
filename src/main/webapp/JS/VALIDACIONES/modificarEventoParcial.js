import {
    checkDireccion,
    checkFechaFin,
    checkFechaInicio,
    validarFormulario
} from "../regex.js";

//-----------------------------------------
// Añadimos los eventos de comprobación de regex a los inputs del formulario
//-----------------------------------------

document.getElementById("direccion").addEventListener("change", e => {
    checkDireccion(e.target);
    validarFormulario('enviar');
});
document.getElementById("fechaInicio").addEventListener("change", e => {
    const fechaFin = document.getElementById("fechaFin");
    checkFechaInicio(e.target);
    checkFechaFin(fechaFin);
    validarFormulario('enviar');
});
document.getElementById("fechaFin").addEventListener("change", e => {
    checkFechaFin(e.target);
    validarFormulario('enviar');
});