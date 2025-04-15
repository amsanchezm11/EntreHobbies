/*
* En este documento se aplicarán las distintas regex al formulario de registro de nuevo usuario
* */

// Función comprobar regex
function comprobarRegex(element, regex) {

    if (regex.test(element.value)) {
        element.classList.remove("rojo");
        element.classList.add("verde");
        return true;
    } else {
        element.classList.remove("verde");
        element.classList.add("rojo");
        return false;
    }
}

/**
 *  Regex Nombre --> Genera la regex y llama a la función comprobarRegex.
 *  Nombre Admite --> Texto y números con un máximo de 30 caracteres (con espacios entre palabras).
 *  @param {string} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkNombre(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+(?: [A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+){0,29}$/;
    return comprobarRegex(element, regex);
}

/**
 *  Regex Apellidos --> Genera la regex y llama a la función comprobarRegex.
 *  Apellidos Admite --> Texto y números con un máximo de 40 caracteres (con espacios entre palabras).
 *  @param {string} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkApellidos(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+(?: [A-Za-zÁÉÍÓÚáéíóúÑñüÜ]+){0,39}$/;
    return comprobarRegex(element, regex);
}

/**
 *  Regex Username --> Genera la regex y llama a la función comprobarRegex.
 *  Apellidos Admite --> Texto y números con una longitud entre 3 y 20 caracteres.
 *  No admite --> Espacios en blanco y símbolos.
 *  @param {string} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkUsername(element) {
    let regex = /^[A-Za-zÁÉÍÓÚáéíóúÑñüÜ0-9]{3,20}$/;
    return comprobarRegex(element, regex);
}

/**
 *  Regex Email --> Genera la regex y llama a la función comprobarRegex.
 *  E-mail Admite --> Correos electrónicos válidos que contengan '@' terminen en '.com' o '.es'.
 *  @param {string} element El valor del input a comprobar.
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkEmail(element) {
    let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|es)$/;
    return element.length <=60 && comprobarRegex(element, regex);
}

/**
 *  Regex Contraseña --> Genera la regex y llama a la función comprobarRegex.
 *  Contraseña Admite --> Cualquier carácter excepto espacios, con una longitud entre 1 y 100 caracteres.
 *  @param {string} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkPassword(element) {
    let regex = /^[^\s]{1,100}$/;
    console.log("Pass1:",element.value);
    return comprobarRegex(element, regex);
}

/**
 *  Regex Confirmar Contraseña --> Comprueba que la contraseña que obtiene por parámetro(element) sea igual que la contraseña original.
 *  @param {*} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function confirmPassword(element) {
    let password = document.getElementById("password");

    if (element.value === password.value) {
        //element.classList.remove("rojo");
        //element.classList.add("verde");
        return true;
    } else {
        //element.classList.remove("verde");
        //element.classList.add("rojo");
        return false;
    }
}

/**
 *  Regex Teléfono --> Genera la regex y llama a la función comprobarRegex.
 *  Teléfono Admite --> Números que empiecen por 6, 7, 9 con una longitud 9 dígitos.
 *  @param {string} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkTelefono(element) {
    let regex = /^[679]\d{8}$/;
    return comprobarRegex(element, regex);
}

/**
 * Regex Localidad --> Genera la regex y llama a la función comprobarRegex.
 * Localidad admite:
 * - Solo letras (mayúsculas y minúsculas), incluyendo acentos y ñ.
 * - Espacios solo entre palabras (no al principio, no al final, no dobles).
 * - Longitud total máxima: 50 caracteres (contando letras y espacios).
 *
 * @param {string} element - El valor del input a comprobar.
 * @returns {boolean} True si cumple la regex, False si no la cumple.
 */
function checkLocalidad(element) {
    let regex = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+(?: [A-Za-záéíóúÁÉÍÓÚñÑ]+)*$/;
    return element.length <= 50 && comprobarRegex(element, regex);
}


/**
 *  Regex Provincia --> Genera la regex y llama a la función comprobarRegex.
 *  Provincia admite:
 * - Solo letras (mayúsculas y minúsculas), incluyendo acentos y ñ.
 * - Espacios solo entre palabras (no al principio, no al final, no dobles).
 * - Longitud total máxima: 50 caracteres (contando letras y espacios).
 *  @param {string} element El input a comprobar
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkProvincia(element) {
    let regex = /^[A-Za-záéíóúÁÉÍÓÚñÑ]+(?: [A-Za-záéíóúÁÉÍÓÚñÑ]+)*$/;
    return element.length <= 50 && comprobarRegex(element, regex);
}

function checkFechaNacimiento(element) {
    const fechaNacimiento = element.value;

    // Comprobamos que el si input está vacío
    if (!fechaNacimiento) {
        return false;
    }

    // Convertimos la fecha de nacimiento a un objeto Date
    const fechaNacimientoDate = new Date(fechaNacimiento);
    // Fecha actual
    const fechaActual = new Date();
    // Comprobamos la diferencia de años entre la fecha actual y la fecha de nacimiento
    const edad = fechaActual.getFullYear() - fechaNacimientoDate.getFullYear();
    const mesActual = fechaActual.getMonth();
    const diaActual = fechaActual.getDate();

    // Si la fecha de nacimiento aún no cumplió los 18 años en este año
    if (mesActual < fechaNacimientoDate.getMonth() ||
        (mesActual === fechaNacimientoDate.getMonth() && diaActual < fechaNacimientoDate.getDate())) {
        return edad - 1 >= 18;
    }

    return edad >= 18;
}


/**
 *  Regex Avatar --> Genera la regex y llama a la función comprobarRegex.
 *  Avatar Admite --> Texto, números, espacios, símbolos y hasta 30 caracteres en total(Extensión incluida).
 *  @param {string} element El input a comprobar.
 *  @returns {boolean} True si cumple la regex o False si no la cumple.
 */
function checkAvatar(element) {
    const avatar = element.files[0];
    const nombreFichero = avatar.name;
    const sizeImagen = avatar.size;

    // Expresión regular para validar el nombre del archivo (1-30 caracteres, incluyendo la extensión)
    let regexNombre = /^.{1,30}$/;

    // Expresión regular para validar la extensión de imagen (jpg, jpeg, png)
    let regexExtension = /\.(jpg|jpeg|png)$/;

    // Comprobamos que el nombre y la extensión sean correctos, y que el tamaño sea menor a 100 KB
    if (regexNombre.test(nombreFichero) && regexExtension.test(nombreFichero) && sizeImagen < 102400) {
        return true;
    } else {
        // Si hay algún error, devolvemos false
        return false;
    }
}
