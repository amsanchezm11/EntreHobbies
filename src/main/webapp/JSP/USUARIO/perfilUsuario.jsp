<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Mi cuenta"/>
        <jsp:param name="estilo" value="perfil.css"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/perfilUsuario.js" defer></script>
    <script type="module" src="${contexto}/JS/vistaPreviaIMG.js" defer></script>
</head>
<body class="bg-light h-100">
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 d-flex align-items-center vh-100 bg-white border-end">
            <div class="w-100 px-3">
                <h5 class="text-center mt-4 mb-4 fw-semibold">Mi cuenta</h5>
                <nav class="nav flex-column fs-5">
                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit" class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Refresh">
                            <i class="bi bi-house-fill me-2"></i>Home
                        </button>
                    </form>

                    <button type="button" class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                            data-target="info">
                        <i class="bi bi-person-circle me-2"></i>Información de cuenta
                    </button>

                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Mis-Eventos">
                            <i class="bi bi-calendar-event me-2"></i>Mis eventos
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

                    <button type="button" class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                            data-target="password">
                        <i class="bi bi-eye me-2"></i>Cambiar contraseña
                    </button>

                    <button type="button" class="nav-link py-2 text-dark border-bottom bg-transparent border-0 text-start w-100"
                            data-target="avatar">
                        <i class="bi bi-image me-2"></i>Cambiar avatar
                    </button>

                    <form action="${contexto}/Login" method="post">
                        <button type="submit"
                                class="nav-link py-2 text-danger fw-semibold bg-transparent border-0 text-start w-100"
                                name="accion"
                                value="Logout">
                            <i class="bi bi-box-arrow-right me-2"></i>Cerrar sesión
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
                                 style="width: 150px; height: 150px; object-fit: cover;"
                                 onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">
                            <h3 class="mt-3 align-self-center color-pm">${sessionScope.usuario.username}</h3>
                        </div>
                    </div>

                    <form action="${contexto}/UsuarioController" method="post">
                        <input type="hidden" name="idUsuario" value="${sessionScope.usuario.idUsuario}"/>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="text" name="nombre" class="form-control" id="floatingNombre"
                                           value="${sessionScope.usuario.nombre}" required>
                                    <label for="floatingNombre">Nombre</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="text"
                                           class="form-control"
                                           id="username"
                                           name="username"
                                           placeholder="Username"
                                           value="${sessionScope.usuario.username}"
                                           readonly>
                                    <label for="username">Username</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="date" class="form-control" id="fechaNacimiento"
                                           name="fechaNacimiento" placeholder="Fecha de nacimiento"
                                           value="${sessionScope.usuario.fechaNacimiento}">
                                    <label for="fechaNacimiento">Fecha de nacimiento</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="text" name="localidad" class="form-control" id="floatingLocalidad"
                                           value="${sessionScope.usuario.localidad}">
                                    <label for="floatingLocalidad">Localidad</label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="text" name="apellidos" class="form-control" id="floatingApellidos"
                                           value="${sessionScope.usuario.apellidos}" required>
                                    <label for="floatingApellidos">Apellidos</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="email" name="email" class="form-control" id="floatingEmail"
                                           value="${sessionScope.usuario.email}" readonly>
                                    <label for="floatingEmail">Email</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="text" name="telefono" class="form-control" id="floatingTelefono"
                                           value="${sessionScope.usuario.telefono}">
                                    <label for="floatingTelefono">Tel&eacute;fono</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="text" name="provincia" class="form-control" id="floatingProvincia"
                                           value="${sessionScope.usuario.provincia}">
                                    <label for="floatingProvincia">Provincia</label>
                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-main" name="accion" value="Actualizar-datos">Actualizar</button>
                        </div>
                    </form>
                </div>
            </div>
            <div id="card-password" class="card align-self-center shadow-sm seccion-perfil d-none">
                <div class="card-body">
                    <h5 class="text-center mb-4">Cambiar contraseña</h5>
                    <form action="${contexto}/UsuarioController" method="post">
                        <input type="hidden" name="idUsuario" value="${sessionScope.usuario.idUsuario}" />
                        <div class="form-floating mb-3">
                            <input type="password" name="passwordActual" class="form-control" id="password" required>
                            <label for="password">Contraseña actual</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="nuevaPassword" class="form-control" id="nuevaPass" required>
                            <label for="nuevaPass">Nueva contraseña</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="confirmPassword" class="form-control" id="confirmPass" required>
                            <label for="confirmPass">Nueva contraseña</label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-main" name="accion" value="Actualizar-password">Actualizar contraseña</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="card-avatar" class="card align-self-center shadow-sm seccion-perfil d-none">
                <div class="card-body">
                    <h5 class="text-center mb-4">Cambiar avatar</h5>
                    <form action="${contexto}/UsuarioController" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="idUsuario" value="${sessionScope.usuario.idUsuario}" />
                        <div class="mb-3 text-center">
                            <img src="${contexto}/IMG/AVATARES/${empty sessionScope.usuario.avatar ? 'avatar.svg' : sessionScope.usuario.avatar}"
                                 id="vista-previa-avatar"
                                 alt="Avatar actual"
                                 class="rounded-circle ${sessionScope.usuario.avatar eq 'avatar.svg' ? '' : 'border-img'}"
                                 style="width: 150px; height: 150px; object-fit: cover;"
                                 onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">
                        </div>
                        <div class="mb-3 d-flex justify-content-center">
                            <input type="file" id="avatar" name="avatar" class="form-control w-50" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-main" name="accion" value="Actualizar-avatar">Actualizar avatar</button>
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

</body>
</html>

