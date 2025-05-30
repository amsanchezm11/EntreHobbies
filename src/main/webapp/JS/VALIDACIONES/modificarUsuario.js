import {
    checkNombre,
    checkApellidos,
    checkFechaNacimiento,
    checkLocalidad,
    checkAvatar,
    validarBoton,
    validarFormularioPassword,
    checkSelect,
    checkNuevaPassword,
    confirmPasswordNueva
} from "./regex.js";

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
document.getElementById("provincia").addEventListener("change", e => {
    checkSelect(e.target);
    validarBoton('provincia','boton-datos');
});

//-----------------------------------------
// Validación formulario de modificar avatar de usuario
//-----------------------------------------
document.getElementById("avatar").addEventListener("change", e => {
    checkAvatar(e.target);
    validarBoton('avatar','boton-avatar');
});

//-----------------------------------------
// Validación formulario de modificar password de usuario
//-----------------------------------------
document.getElementById("nuevaPass").addEventListener("input", e => {
    const confirmPass = document.getElementById("confirmPass");
    checkNuevaPassword(e.target);
    confirmPasswordNueva(confirmPass);
    validarFormularioPassword('formPassword','boton-password');
});
document.getElementById("confirmPass").addEventListener("input", e => {
    confirmPasswordNueva(e.target)
    validarFormularioPassword('formPassword','boton-password');
});