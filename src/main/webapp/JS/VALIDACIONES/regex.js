/*
 * En este documento se aplicarán las distintas regex que se van a utilizar en la aplicación junto
 * con la función de comprobar regex y validar formulario
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

// Función para comprobar si todos los inputs son válidos
export function validarFormulario(idBoton) {
    const campos = document.querySelectorAll('input, select, textarea');
    const boton = document.getElementById(idBoton);

    //console.log(campos);

    for (let campo of campos) {
        if (!campo.classList.contains('is-valid')) {
            boton.disabled = true;
            return;
        }
    }

    boton.disabled = false;
}

// Función validar botón del formulario modificar(datos y avatar)
export function validarBoton(idInput, idBoton) {

    const input = document.getElementById(idInput);
    const boton = document.getElementById(idBoton);

    if (!input.classList.contains('is-valid')) {
        boton.disabled = true;
        return;
    }

    boton.disabled = false;
}

export function validarFormularioPassword(idFormulario, idBoton) {

    const formulario = document.getElementById(idFormulario);
    const campos = formulario.querySelectorAll('input');
    const boton = document.getElementById(idBoton);

    console.log(campos);

    for (let campo of campos) {
        if (!campo.classList.contains('is-valid')) {
            boton.disabled = true;
            return;
        }
    }

    boton.disabled = false;

}

//-------------------------------------------------------------------------------------------
//-----------------------------------[ USUARIO ]---------------------------------------------
//-------------------------------------------------------------------------------------------

// Regex para nombre (letras y espacios, máx. 30 caracteres)
export function checkNombre(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+(?: [A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+){0,29}$/;
    return comprobarRegex(element, regex, 30);
}

// Regex para apellidos (letras y espacios, máx. 40 caracteres)
export function checkApellidos(element) {
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
    const regex = /^[a-zA-Z0-9ñÑ._%+-]+@[a-zA-Z0-9ñÑ.-]+\.(com|es)$/;
    const valor = element.value;

    if (regex.test(valor)) {
        const dominio = valor.split('@')[1];
        // Aseguramos que termine estrictamente en ".com" o ".es" y que no haya nada más después
        if (dominio.endsWith('.com') || dominio.endsWith('.es')) {
            const partes = dominio.split('.');
            const ultimaParte = partes[partes.length - 1];
            if (ultimaParte === 'com' || ultimaParte === 'es') {
                return comprobarRegex(element, regex, 60);
            }
        }

        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}


// Regex para contraseña (cualquier carácter sin espacios, entre 6 y 100 caracteres)
export function checkPassword(element) {
    let regex = /^[^\s]{6,100}$/;
    return comprobarRegex(element, regex, 100);
}

// Confirmar que las contraseñas coincidan
export function confirmPassword(element) {
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

// Regex para localidad (letras y espacios, máx. 50 caracteres)
export function checkLocalidad(element) {
    let regex = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+(?: [A-Za-záéíóúÁÉÍÓÚñÑ]+)*$/;
    return comprobarRegex(element, regex, 50);
}

// Regex para provincia (letras y espacios, máx. 50 caracteres)
export function checkProvincia(element) {
    let regex = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+(?: [A-Za-záéíóúÁÉÍÓÚñÑ]+)*$/;
    return comprobarRegex(element, regex, 50);
}

// Validación de fecha de nacimiento (mayores de edad y no fechas futuras)
export function checkFechaNacimiento(element) {
    const fechaNacimiento = element.value;
    if (!fechaNacimiento) {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }

    const fechaNacimientoDate = new Date(fechaNacimiento);
    const fechaActual = new Date();
    fechaActual.setHours(0, 0, 0, 0);

    const fechaMinima = new Date("1900-01-01");

    // Comprobamos que no sea fecha futura o anterior a 1900
    if (fechaNacimientoDate > fechaActual || fechaNacimientoDate < fechaMinima) {
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
export function checkAvatar(element) {
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

// Validación nueva contraseña (debe ser distinta a la contraseña actual)
export function checkNuevaPassword(element) {
    let password = document.getElementById("password");

    if (element.value !== password.value && element.value.length >= 6) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Confirmar que las contraseñas coincidan
export function confirmPasswordNueva(element) {
    let passwordNueva = document.getElementById("nuevaPass");

    if (element.value === passwordNueva.value && element.value.length >= 6) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Función genérica para comprobar los selects de los formularios (sexo, categorias, subcategorias)
export function checkSelect(element) {

    if (element.value !== null) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

// Función para comprobar si el usuario ha seleccionado que acepta las condiciones
export function checkCondiciones(element) {

    let aviso = document.getElementById('aviso');

    if (element.checked) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        aviso.textContent = 'Debe aceptar los términos y condiciones del servicio para poder registrarse.';
        return false;
    }
}

//-------------------------------------------------------------------------------------------
//------------------------------------[ EVENTO ]---------------------------------------------
//-------------------------------------------------------------------------------------------

// Función para validar el titulo del evento
export function checkTitulo(element) {
    // const regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s,]{1,40}$/;
    const regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s,.\-:]{1,40}$/;
    return comprobarRegex(element, regex, 40);
}

// Función para validar el número de participantes del evento
export function checkNumParticipantes(element) {
    const numero = parseInt(element.value, 10);

    if (!Number.isInteger(numero) || numero < 1 || numero > 5000) {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    } else {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    }
}

// Función para validar la descripción de un evento
export function checkDescripcion(element) {
    // let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s.,ºª°/#\-]+$/;
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s.,ºª°/#:\-()¡!]+$/;
    return comprobarRegex(element, regex, 255);
}

// Regex para dirección de un evento
export function checkDireccion(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñ0-9\s.,ºª°/#\-]+$/;
    return comprobarRegex(element, regex, 50);
}

// Función para validar la fecha de inicio de un evento
export function checkFechaInicio(element) {

    const fechaInicio = new Date(element.value);
    const fechaActual = new Date();
    // Le reseteamos el tiempo a las fechas para que la validación sea más optima
    fechaInicio.setHours(0, 0, 0, 0);
    fechaActual.setHours(0, 0, 0, 0);

    if (fechaInicio >= fechaActual) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}

export function checkFechaFin(element) {
    const fechaInicioInput = document.getElementById('fechaInicio').value;

    const fechaInicio = new Date(fechaInicioInput);
    const fechaFin = new Date(element.value)
    // Le reseteamos el tiempo a las fechas para que la validación sea más optima
    fechaInicio.setHours(0, 0, 0, 0);
    fechaFin.setHours(0, 0, 0, 0);

    if (fechaFin > fechaInicio) {
        element.classList.remove("is-invalid");
        element.classList.add("is-valid");
        return true;
    } else {
        element.classList.remove("is-valid");
        element.classList.add("is-invalid");
        return false;
    }
}