import {
    checkDescripcion,
    checkDireccion,
    checkFechaFin,
    checkFechaInicio,
    checkLocalidad,
    checkNumParticipantes,
    checkSelect,
    checkTitulo,
    validarFormulario
} from "./regex.js";

//-----------------------------------------
// Añadimos los eventos de comprobación de regex a los inputs del formulario
//-----------------------------------------
document.getElementById("titulo").addEventListener("change", e => {
    checkTitulo(e.target);
    validarFormulario('enviar');
});
document.getElementById("numParticipantes").addEventListener("change", e => {
    checkNumParticipantes(e.target);
    validarFormulario('enviar');
});
document.getElementById("descripcion").addEventListener("change", e => {
    checkDescripcion(e.target);
    validarFormulario('enviar');
});
document.getElementById("direccion").addEventListener("change", e => {
    checkDireccion(e.target);
    validarFormulario('enviar');
});
document.getElementById("localidad").addEventListener("change", e => {
    checkLocalidad(e.target);
    validarFormulario('enviar');
});
// document.getElementById("provincia").addEventListener("change", e => {
//     checkProvincia(e.target);
//     validarFormulario('enviar');
// });
document.getElementById("provincia").addEventListener("change", e => {
    checkSelect(e.target);
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