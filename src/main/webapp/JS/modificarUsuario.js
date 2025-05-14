import {checkNombre, checkApellidos, checkFechaNacimiento, checkLocalidad, checkProvincia, checkAvatar, validarBoton, validarFormularioPassword} from "./regex.js";

//-----------------------------------------
// Validación formulario de modificar datos de usuario
//-----------------------------------------
document.getElementById("nombre").addEventListener("input", e => {
    checkNombre(e.target);
    validarBoton('nombre','boton-datos');
});
document.getElementById("apellidos").addEventListener("input", e => {
    checkApellidos(e.target);
    validarBoton('apellidos','boton-datos');
});
document.getElementById("fechaNacimiento").addEventListener("input", e => {
    checkFechaNacimiento(e.target);
    validarBoton('fechaNacimiento','boton-datos');
});
document.getElementById("localidad").addEventListener("input", e => {
    checkLocalidad(e.target);
    validarBoton('localidad','boton-datos');
});
document.getElementById("provincia").addEventListener("input", e => {
    checkProvincia(e.target);
    validarBoton('provincia','boton-datos');
});

//-----------------------------------------
// Validación formulario de modificar avatar de usuario
//-----------------------------------------
document.getElementById("avatar").addEventListener("change", e => {
    checkAvatar(e.target);
    validarBoton('avatar','boton-avatar');
});


document.getElementById("nuevaPass").addEventListener("input", e => {
    validarFormularioPassword('boton-password');
});
document.getElementById("confirmPass").addEventListener("input", e => {
    validarFormularioPassword('boton-password');
});