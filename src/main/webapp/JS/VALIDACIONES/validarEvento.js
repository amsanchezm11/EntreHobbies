import {checkTitulo, checkNumParticipantes, checkDescripcion, checkDireccion, checkLocalidad, checkProvincia, checkSelect, checkFechaInicio,checkFechaFin, validarFormulario} from "../regex.js";


//-----------------------------------------
// Añadimos los eventos de comprobación de regex a los inputs del formulario
//-----------------------------------------
document.getElementById("titulo").addEventListener("input", e => {
    checkTitulo(e.target);
    validarFormulario('enviar');
});
document.getElementById("numParticipantes").addEventListener("input", e => {
    checkNumParticipantes(e.target);
    validarFormulario('enviar');
});
document.getElementById("descripcion").addEventListener("input", e => {
    checkDescripcion(e.target);
    validarFormulario('enviar');
});
document.getElementById("direccion").addEventListener("input", e => {
    checkDireccion(e.target);
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
document.getElementById("categoria").addEventListener("change",e=>{
    checkSelect(e.target);
    validarFormulario('enviar');
});
document.getElementById("subcategoria").addEventListener("change",e=>{
    checkSelect(e.target);
    validarFormulario('enviar');
});
document.getElementById("fechaInicio").addEventListener("change", e=> {
    checkFechaInicio(e.target);
    validarFormulario('enviar');
});
document.getElementById("fechaFin").addEventListener("change", e=> {
    checkFechaFin(e.target);
    validarFormulario('enviar');
});