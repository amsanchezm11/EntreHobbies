import {checkNombre, checkApellidos, checkFechaNacimiento, checkLocalidad, checkProvincia, checkPassword, confirmPassword, checkAvatar, validarFormulario} from "./regex.js";


// Añadir el evento 'input' a cada campo para verificar la validez en tiempo real
document.getElementById("nombre").addEventListener("input", e => {
    checkNombre(e.target);
    validarFormulario(); // Comprobar si el formulario está completo
});
document.getElementById("apellidos").addEventListener("input", e => {
    checkApellidos(e.target);
    validarFormulario();
});
/*document.getElementById("username").addEventListener("change", e => {
    checkUsername(e.target);
    validarFormulario();
});*/
/*document.getElementById("email").addEventListener("input", e => {
    checkEmail(e.target);
    validarFormulario();
});*/
document.getElementById("fechaNacimiento").addEventListener("input", e => {
    checkFechaNacimiento(e.target);
    validarFormulario();
});
/*document.getElementById("telefono").addEventListener("input", e => {
    checkTelefono(e.target);
    validarFormulario();
});*/
document.getElementById("localidad").addEventListener("input", e => {
    checkLocalidad(e.target);
    validarFormulario();
});
document.getElementById("provincia").addEventListener("input", e => {
    checkProvincia(e.target);
    validarFormulario();
});
document.getElementById("password").addEventListener("input", e => {
    checkPassword(e.target);
    validarFormulario();
});
document.getElementById("passwordRepe").addEventListener("input", e => {
    confirmPassword(e.target);
    validarFormulario();
});
document.getElementById("avatar").addEventListener("change", e => {
    checkAvatar(e.target);
    validarFormulario();
});


//-----------------------------------------
// Añadimos los eventos de comprobación de regex a los inputs del formulario
//-----------------------------------------
// document.getElementById("nombre").addEventListener("input", e => checkNombre(e.target));
// document.getElementById("apellidos").addEventListener("input", e => checkApellidos(e.target));
// document.getElementById("username").addEventListener("input", e => checkUsername(e.target));
// document.getElementById("email").addEventListener("input", e => checkEmail(e.target));
// document.getElementById("fechaNacimiento").addEventListener("input", e => checkFechaNacimiento(e.target));
// document.getElementById("telefono").addEventListener("input", e => checkTelefono(e.target));
// document.getElementById("localidad").addEventListener("input", e => checkLocalidad(e.target));
// document.getElementById("provincia").addEventListener("input", e => checkProvincia(e.target));
// document.getElementById("password").addEventListener("input", e => checkPassword(e.target));
// document.getElementById("passwordRepe").addEventListener("input", e => confirmPassword(e.target));
// document.getElementById("avatar").addEventListener("change", e => checkAvatar(e.target));