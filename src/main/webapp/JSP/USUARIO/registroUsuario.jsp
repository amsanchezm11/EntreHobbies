<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Registro de Usuario"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/inicializarPopovers.js" defer></script>
    <script type="module" src="${contexto}/JS/regexUsuario.js" defer></script>
    <script type="module" src="${contexto}/JS/comprobarEmail.js" defer></script>
    <script type="module" src="${contexto}/JS/comprobarUsername.js" defer></script>
    <script type="module" src="${contexto}/JS/comprobarTelefono.js" defer></script>
</head>
<body class="bg-body text-body min-vh-100">
<nav class="navbar bg-body-tertiary border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-custom" name="accion" value="Refresh">EntreHobbies</button>
        </form>
    </div>
</nav>
<main class="position-relative bg-gradient-morado-blanco w-100 vh-100 d-flex justify-content-center align-items-center flex-column">
    <h1 class="position-absolute top-0 start-0 text-light m-4 text-login">Registro</h1>

    <form id="formRegistro" action="${contexto}/UsuarioController" method="post" class="container w-75 mb-4" enctype="multipart/form-data">
        <div class="row g-3">
            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="nombre"
                               name="nombre"
                               placeholder="Nombre"
                               required>
                        <label for="nombre">Nombre</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato del nombre"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>No puede tener n&uacute;meros.</li>
                                            <li>Debe empezar con may&uacute;scula.</li>
                                            <li>Solo letras y espacios.</li>
                                            <li>Est&aacute; permitido los acentos.</li>
                                            <li>Longitud m&aacute;xima 30 caracteres.</li>
                                        </ul>">
                    </i>

                </div>
            </div>

            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between"></div>
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="apellidos"
                               name="apellidos"
                               placeholder="Apellidos"
                               required>
                        <label for="apellidos">Apellidos</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de apellidos"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>No puede tener n&uacute;meros.</li>
                                            <li>Debe empezar con may&uacute;scula.</li>
                                            <li>Solo letras y espacios.</li>
                                            <li>Est&aacute; permitido los acentos.</li>
                                            <li>Longitud m&aacute;xima 40 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>

            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="username"
                               name="username"
                               placeholder="Username"
                               required>
                        <label for="username">Username</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de username"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Solo letras y n&uacute;meros.</li>
                                            <li>No puede tener caracteres especiales.</li>
                                            <li>Est&aacute; permitido los acentos.</li>
                                            <li>Longitud entre 3-20 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="email"
                               name="email"
                               placeholder="name@example.com"
                               required>
                        <label for="email">Email</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de email"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Debe contener '@'.</li>
                                            <li>Solo se permiten correos terminados en '.com' o '.es'.</li>
                                            <li>Longitud m&aacute;xima 60 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>

            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="date"
                               class="form-control"
                               id="fechaNacimiento"
                               name="fechaNacimiento"
                               placeholder="Fecha de nacimiento">
                        <label for="fechaNacimiento">Fecha de nacimiento</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de fecha de nacimiento"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>El usuario debe ser mayor de <strong>18</strong> a&ntilde;os.</li>
                                            <li>No se permiten fechas futuras.</li>
                                        </ul>">
                    </i>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="telefono"
                               name="telefono"
                               placeholder="Teléfono"
                               required>
                        <label for="telefono">Tel&eacute;fono</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de tel&eacute;fono"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>El n&uacute;mero compuesto por <strong>9</strong> d&iacute;gitos.</li>
                                            <li>Debe empezar por 6, 7 o 9.</li>
                                        </ul>">
                    </i>
                </div>
            </div>

            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="localidad"
                               name="localidad"
                               placeholder="Localidad"
                               required>
                        <label for="localidad">Localidad</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de localidad"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Solo letras (mayúsculas y minúsculas), incluyendo acentos y ñ.</li>
                                            <li>Espacios solo entre palabras (no al principio, no al final, no dobles).</li>
                                            <li>Longitud m&aacute;xima: 50 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="text"
                               class="form-control"
                               id="provincia"
                               name="provincia"
                               placeholder="Provincia"
                               required>
                        <label for="provincia">Provincia</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de provincia"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Solo letras (mayúsculas y minúsculas), incluyendo acentos y ñ.</li>
                                            <li>Espacios solo entre palabras (no al principio, no al final, no dobles).</li>
                                            <li>Longitud m&aacute;xima: 50 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>

            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="password"
                               class="form-control"
                               id="password"
                               name="password"
                               placeholder="Contrase&ntilde;a"
                               required>
                        <label for="password">Contrase&ntilde;a</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de contrase&ntilde;a"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Cualquier carácter.</li>
                                            <li>No se permite <strong>espacios</strong></li>
                                            <li>Longitud entre 6 y 100 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="password"
                               class="form-control"
                               id="passwordRepe"
                               name="passwordRepe"
                               placeholder="Repetir contraseña"
                               required>
                        <label for="passwordRepe">Repetir Contrase&ntilde;a</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de repetir contrase&ntilde;a"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Debe ser <strong>igual</strong> a la contrase&ntilde;a anterior.</li>
                                        </ul>">
                    </i>
                </div>
            </div>

            <div class="col-md-12">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div class="form-floating flex-grow-1 shadow">
                        <input type="file"
                               class="form-control"
                               id="avatar"
                               name="avatar"
                               placeholder="Avatar"
                               required>
                        <label for="avatar">Avatar</label>
                    </div>
                    <i class="bi bi-info-circle text-light align-self-center"
                       role="button"
                       style="font-size: 1.3rem; cursor: pointer;"
                       title="Formato de repetir contrase&ntilde;a"
                       data-bs-toggle="popover"
                       data-bs-placement="bottom"
                       data-bs-html="true"
                       data-bs-trigger="hover focus"
                       data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                            <li>Texto, n&uacute;meros, espacios, s&iacute;mbolos.</li>
                                            <li>Extensi&oacute;n de imagen (jpg, jpeg, png).</li>
                                            <li>Tama&ntilde;o m&aacute;ximo 100KB.</li>
                                            <li>Longitud m&aacute;xima 30 caracteres.</li>
                                        </ul>">
                    </i>
                </div>
            </div>

            <div class="col-12 text-center">
                <button type="submit" id="enviar" class="btn btn-login btn-lg" name="accion" value="Registrar" disabled>
                    Registrarse
                </button>
            </div>

            <div class="col-12">
                <p class="text-center text-danger m-0 invisible" id="aviso">Mensaje</p>
            </div>
        </div>
    </form>

</main>
</body>
</html>
