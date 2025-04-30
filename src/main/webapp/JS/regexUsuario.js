/*
 * En este documento se aplicarán las distintas regex al formulario de registro de nuevo usuario
 */

// Función comprobar regex
export function comprobarRegex(element, regex, length) {
    if (regex.test(element.value) && element.value.length <= length) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Regex para nombre (letras y espacios, máx. 30 caracteres)
function checkNombre(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+(?: [A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+){0,29}$/;
    return comprobarRegex(element, regex, 30);
}

// Regex para apellidos (letras y espacios, máx. 40 caracteres)
function checkApellidos(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+(?: [A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+){0,39}$/;
    return comprobarRegex(element, regex, 40);
}

// Regex para username (letras/números, sin espacios, entre 3 y 20 caracteres)
export function checkUsername(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ0-9]{3,20}$/;
    return comprobarRegex(element, regex, 20);
}

// Regex para email (formato válido + .com o .es, sin dominios duplicados)
export function checkEmail(element) {
    let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|es)$/;
    let valor = element.value;
    if (regex.test(valor)) {
        // Comprobamos que no haya más de un ".com" o ".es" en la dirección
        if (valor.indexOf(".com.com") !== -1 || valor.indexOf(".es.es") !== -1) {
            element.classList.remove("is-valid");
            element.classList.add("is-invalid");
            return false;
        }
        return comprobarRegex(element, regex, 60);
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}


// Regex para contraseña (cualquier carácter sin espacios, entre 6 y 100 caracteres)
function checkPassword(element) {
    let regex = /^[^\s]{6,100}$/;
    return comprobarRegex(element, regex, 100);
}

// Confirmar que las contraseñas coincidan
function confirmPassword(element) {
    let password = document.getElementById("password");

    if (element.value === password.value && element.value.length > 0) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Teléfono válido (empieza por 6, 7 o 9, 9 dígitos)
export function checkTelefono(element) {
    let regex = /^[679]\d{8}$/;
    if (regex.test(element.value)) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Regex para localidad
function checkLocalidad(element) {
    let regex = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+(?: [A-Za-záéíóúÁÉÍÓÚñÑ]+)*$/;
    return comprobarRegex(element, regex, 50);
}

// Regex para provincia
function checkProvincia(element) {
    let regex = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+(?: [A-Za-záéíóúÁÉÍÓÚñÑ]+)*$/;
    return comprobarRegex(element, regex, 50);
}

// Validación de fecha de nacimiento (mayores de edad y no en futuro)
function checkFechaNacimiento(element) {
    const fechaNacimiento = element.value;
    if (!fechaNacimiento) {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }

    const fechaNacimientoDate = new Date(fechaNacimiento);
    const fechaActual = new Date();
    fechaActual.setHours(0, 0, 0, 0);

    if (fechaNacimientoDate > fechaActual) {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }

    let edad = fechaActual.getFullYear() - fechaNacimientoDate.getFullYear();
    const mesActual = fechaActual.getMonth();
    const diaActual = fechaActual.getDate();

    if (mesActual < fechaNacimientoDate.getMonth() ||
        (mesActual === fechaNacimientoDate.getMonth() && diaActual < fechaNacimientoDate.getDate())) {
        edad--;
    }

    if (edad >= 18) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Validación del archivo de avatar
function checkAvatar(element) {
    const avatar = element.files[0];
    if (!avatar) {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }

    const nombreFichero = avatar.name;
    const sizeImagen = avatar.size;
    let regexNombre = /^.{1,30}$/;
    let regexExtension = /\.(jpg|jpeg|png)$/;

    if (regexNombre.test(nombreFichero) && regexExtension.test(nombreFichero) && sizeImagen < 102400) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}



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

// Método para comprobar si todos los inputs son válidos
export function validarFormulario() {
    const inputs = document.querySelectorAll('input');
    const boton = document.getElementById('enviar');

    // Recorremos todos los inputs para verificamos si tienen la clase "is-valid"
    for (let input of inputs) {
        if (!input.classList.contains('is-valid')) {
            boton.disabled = true;
            return;
        }
    }

    // Si todos los inputs son válidos, habilitamos el botón
    boton.disabled = false;
}

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
