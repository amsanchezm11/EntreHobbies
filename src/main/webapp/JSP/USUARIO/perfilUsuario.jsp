<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Mi cuenta"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/COMPONENTES/inicializarPopovers.js" defer></script>
    <script type="module" src="${contexto}/JS/VISTAS/perfilUsuario.js" defer></script>
    <script type="module" src="${contexto}/JS/VALIDACIONES/comprobarPassword.js" defer></script>
    <script type="module" src="${contexto}/JS/VALIDACIONES/modificarUsuario.js" defer></script>
    <script type="module" src="${contexto}/JS/COMPONENTES/alertas.js" defer></script>
    <script type="module" src="${contexto}/JS/COMPONENTES/vistaPreviaIMG.js" defer></script>
</head>
<body class="bg-light h-100">
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 d-flex align-items-center vh-100 bg-white border-end">
            <div class="w-100 px-3">
                <h5 class="text-center mt-4 mb-4 fw-semibold">Mi cuenta</h5>
                <nav class="nav flex-column fs-5">
                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Refresh">
                            <i class="bi bi-house-fill me-2"></i>Home
                        </button>
                    </form>

                    <button type="button"
                            class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                            data-target="info">
                        <i class="bi bi-person-circle me-2"></i>Informaci&oacute;n de cuenta
                    </button>

                    <button type="button"
                            class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                            data-target="password">
                        <i class="bi bi-eye me-2"></i>Cambiar contrase&ntilde;a
                    </button>

                    <button type="button"
                            class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                            data-target="avatar">
                        <i class="bi bi-image me-2"></i>Cambiar avatar
                    </button>

                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Gestor-Eventos">
                            <i class="bi bi-calendar-event me-2"></i>Todos mis eventos
                        </button>
                    </form>

                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Gestor-Participaciones">
                            <i class="bi bi-person-check me-2"></i>Todas mis Participaciones
                        </button>
                    </form>

                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Crear-Evento">
                            <i class="bi bi-calendar-event me-2"></i>Crear evento
                        </button>
                    </form>

                    <form action="${contexto}/Login" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-danger fw-semibold bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Logout">
                            <i class="bi bi-box-arrow-right me-2"></i>Cerrar sesi&oacute;n
                        </button>
                    </form>
                </nav>
            </div>
        </div>

        <div class="col-md-9 py-5 align-self-center">
            <div id="card-info" class="card align-self-center shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-center mb-4">
                        <div class="text-center d-flex gap-3">
                            <img src="${contexto}/IMG/AVATARES/${empty sessionScope.usuario.avatar ? 'avatar.svg' : sessionScope.usuario.avatar}"
                                 alt="Avatar"
                                 class="rounded-circle ${sessionScope.usuario.avatar eq 'avatar.svg' ? '' : 'border-img'}"
                                 style="width: 150px; height: 150px; object-fit: contain;"
                                 onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">
                            <h3 class="mt-3 align-self-center color-pm">${sessionScope.usuario.username}</h3>
                        </div>
                    </div>

                    <form action="${contexto}/UsuarioController" method="post">
                        <input type="hidden" name="idUsuario" value="${sessionScope.usuario.idUsuario}"/>

                        <div class="row">
                            <div class="col-md-6">

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="text" name="nombre" class="form-control" id="nombre"
                                               value="${sessionScope.usuario.nombre}" required>
                                        <label for="nombre">Nombre</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
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
                          <li>Ej: Jos&eacute; Manuel</li>
                  </ul>">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="text" class="form-control" id="username" name="username"
                                               value="${sessionScope.usuario.username}" readonly>
                                        <label for="username">Username</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
                                          title="Username"
                                          data-bs-toggle="popover"
                                          data-bs-placement="bottom"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="No editable. El nombre de usuario no puede cambiarse.">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="date" class="form-control" id="fechaNacimiento"
                                               name="fechaNacimiento"
                                               value="${sessionScope.usuario.fechaNacimiento}">
                                        <label for="fechaNacimiento">Fecha de nacimiento</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
                                          title="Fecha de nacimiento"
                                          data-bs-toggle="popover"
                                          data-bs-placement="bottom"
                                          data-bs-html="true"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                          <li>El usuario debe ser mayor de <strong>18</strong> a&ntilde;os.</li>
                          <li>No se permiten fechas futuras.</li>
                      </ul>">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="text" name="localidad" class="form-control" id="localidad"
                                               value="${sessionScope.usuario.localidad}">
                                        <label for="localidad">Localidad</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
                                          title="Formato de localidad"
                                          data-bs-toggle="popover"
                                          data-bs-placement="bottom"
                                          data-bs-html="true"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                          <li>Solo letras (may&uacute;sculas y min&uacute;sculas), incluyendo acentos y &ntilde;.</li>
                          <li>Espacios solo entre palabras (no al principio, no al final, no dobles).</li>
                          <li>Longitud m&aacute;xima: 50 caracteres.</li>
                          <li>Ej: M&eacute;rida</li>
                      </ul>">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>
                            </div>

                            <div class="col-md-6">

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="text" name="apellidos" class="form-control" id="apellidos"
                                               value="${sessionScope.usuario.apellidos}" required>
                                        <label for="apellidos">Apellidos</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
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
                          <li>Ej: P&eacute;rez P&eacute;rez</li>
                  </ul>">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="email" name="email" class="form-control" id="email"
                                               value="${sessionScope.usuario.email}" readonly>
                                        <label for="email">Email</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
                                          title="Email"
                                          data-bs-toggle="popover"
                                          data-bs-placement="bottom"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="No editable. Este es el correo con el que te registraste.">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <input type="text" name="telefono" class="form-control" id="telefono"
                                               value="${sessionScope.usuario.telefono}">
                                        <label for="telefono">Tel&eacute;fono</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
                                          title="Formato del tel&eacute;fono"
                                          data-bs-toggle="popover"
                                          data-bs-placement="bottom"
                                          data-bs-html="true"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                          <li>El n&uacute;mero compuesto por <strong>9</strong> d&iacute;gitos, sin espacios ni guiones.</li>
                          <li>Debe empezar por 6, 7 o 9.</li>
                          <li>El n&uacute;mero no debe estar ya registrado en nuestra base de datos</li>
                      </ul>">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="form-floating flex-grow-1">
                                        <select name="idProvincia" class="form-select" id="provincia">
                                            <c:forEach var="provincia" items="${requestScope.provincias}">
                                                <option value="${provincia[0]}"
                                                        <c:if test="${provincia[0] == sessionScope.usuario.provincia.idProvincia}">selected</c:if>>
                                                        ${provincia[1]}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <label for="provincia">Provincia</label>
                                    </div>
                                    <span class="input-group-text bg-light" role="button"
                                          title="Provincia"
                                          data-bs-toggle="popover"
                                          data-bs-placement="bottom"
                                          data-bs-trigger="hover focus"
                                          data-bs-content="Selecciona la provincia donde resides.">
                <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
            </span>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit"
                                    id="boton-datos"
                                    class="btn btn-main"
                                    name="accion"
                                    value="Actualizar-datos" disabled>Actualizar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            
            <div id="card-password" class="card align-self-center shadow-sm seccion-perfil d-none">
                <div class="card-body">
                    <h5 class="text-center mb-4">Cambiar contrase&ntilde;a</h5>
                    <form action="${contexto}/UsuarioController" method="post" id="formPassword">
                        <input type="hidden" name="idUsuario" class="is-valid" value="${sessionScope.usuario.idUsuario}"/>
                        <div class="input-group mb-3">
                            <div class="form-floating flex-grow-1">
                                <input type="password" name="passwordActual" class="form-control" id="password"
                                       required>
                                <label for="password">Contrase&ntilde;a actual</label>
                            </div>
                            <span class="input-group-text bg-light" role="button"
                                  title="Contrase&ntilde;a actual"
                                  data-bs-toggle="popover"
                                  data-bs-placement="bottom"
                                  data-bs-trigger="hover focus"
                                  data-bs-content="Introduce tu contrase&ntilde;a actual para verificar tu identidad.">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
                        </div>
                        <div class="input-group mb-3">
                            <div class="form-floating flex-grow-1">
                                <input type="password" name="nuevaPassword" class="form-control" id="nuevaPass"
                                       required>
                                <label for="nuevaPass">Nueva contrase&ntilde;a</label>
                            </div>
                            <span class="input-group-text bg-light" role="button"
                                  title="Nueva contrase&ntilde;a"
                                  data-bs-toggle="popover"
                                  data-bs-placement="bottom"
                                  data-bs-html="true"
                                  data-bs-trigger="hover focus"
                                  data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                  <li>M&iacute;nimo 6 caracteres.</li>
                  <li>Cualquier carácter.</li>
                  <li>No se permiten espacios en blanco.</li>
                  <li>Se recomienda incluir un s&iacute;mbolo (!@#$%).</li>
              </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
                        </div>
                        <div class="input-group mb-3">
                            <div class="form-floating flex-grow-1">
                                <input type="password" name="confirmPassword" class="form-control" id="confirmPass"
                                       required>
                                <label for="confirmPass">Nueva contrase&ntilde;a</label>
                            </div>
                            <span class="input-group-text bg-light" role="button"
                                  title="Confirmar contrase&ntilde;a"
                                  data-bs-toggle="popover"
                                  data-bs-placement="bottom"
                                  data-bs-trigger="hover focus"
                                  data-bs-content="Debe coincidir con la nueva contrase&ntilde;a ingresada.">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
                        </div>

                        <div class="text-center">
                            <button type="submit"
                                    id="boton-password"
                                    class="btn btn-main"
                                    name="accion"
                                    value="Actualizar-password"
                                    disabled>
                                Actualizar contrase&ntilde;a
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="card-avatar" class="card align-self-center shadow-sm seccion-perfil d-none">
                <div class="card-body">
                    <h5 class="text-center mb-4">Cambiar avatar</h5>
                    <form action="${contexto}/UsuarioController" method="post" enctype="multipart/form-data"
                          class="d-flex flex-column justify-content-center align-items-center">
                        <input type="hidden" name="idUsuario" value="${sessionScope.usuario.idUsuario}"/>

                        <div class="mb-3 text-center">
                            <img src="${contexto}/IMG/AVATARES/${empty sessionScope.usuario.avatar ? 'avatar.svg' : sessionScope.usuario.avatar}"
                                 id="vista-previa-avatar"
                                 alt="Avatar actual"
                                 class="rounded-circle ${sessionScope.usuario.avatar eq 'avatar.svg' ? '' : 'border-img'}"
                                 style="width: 150px; height: 150px; object-fit: contain;"
                                 onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">
                        </div>
                        <div class="input-group mb-3 d-flex justify-content-center w-50">
                            <input type="file" id="avatar" name="avatar" class="form-control" required>
                            <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                                  title="Formato de Avatar"
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
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
                        </div>

                        <div class="text-center">
                            <button type="submit"
                                    id="boton-avatar"
                                    class="btn btn-main"
                                    name="accion"
                                    value="Actualizar-avatar"
                                    disabled>
                                Actualizar avatar
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<form action="${contexto}/FrontController" method="post">
    <button type="submit"
            name="accion"
            value="Crear-Evento"
            class="btn btn-main rounded-circle shadow-lg d-flex justify-content-center align-items-center"
            id="botonCrearEvento" title="Crear evento">
        <i class="bi bi-plus-lg fs-3"></i>
    </button>
</form>

<c:if test="${requestScope.aviso != null}">
    <div id="aviso"
         class="notification"
         role="alert"
         style="pointer-events: none;">
        <div class="notification-body">
            <i class="bi bi-check-circle-fill me-2"></i>
            <span>${requestScope.aviso}</span>
            <div class="notification-progress"></div>
        </div>
    </div>
</c:if>

<c:if test="${requestScope.error != null}">
    <div id="aviso"
         class="notification-danger"
         role="alert"
         style="pointer-events: none;">
        <div class="notification-body">
            <i class="bi bi-check-circle-fill me-2"></i>
            <span>${requestScope.error}</span>
            <div class="notification-danger-progress"></div>
        </div>
    </div>
</c:if>
</body>
</html>

