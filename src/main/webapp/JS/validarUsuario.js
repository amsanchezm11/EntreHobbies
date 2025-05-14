import {checkNombre, checkApellidos, checkFechaNacimiento, checkLocalidad, checkProvincia, checkPassword, confirmPassword, checkAvatar, checkSexo, validarFormulario} from "./regex.js";

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