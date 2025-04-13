<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script src="${contexto}/JS/comprobarCredencial.js" defer></script>
</head>
<body class="bg-body text-body min-vh-100">
<nav class="navbar bg-body-tertiary border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-custom" name="accion" value="Refresh">EntreHobbies</button>
        </form>
        <%--<div class="d-flex align-items-center gap-3">
            <div class="form-check form-switch">
                <img id="themeIcon" src="${contexto}/IMG/TEMA/Sol.png" alt="Icono de tema" width="24" height="24" style="cursor: pointer;" title="Cambiar Tema">
            </div> --%>
    </div>
    </div>
</nav>
<main class="position-relative bg-gradient-morado-blanco w-100 vh-100 d-flex justify-content-center align-items-center">
    <h1 class="position-absolute top-0 start-0 text-light m-4 text-login">Login</h1>

    <!-- Formulario centrado -->
    <form action="Login" method="post" class="w-50">
        <div class="form-floating mb-3 shadow">
            <input type="text" class="form-control" id="credencial" name="username" placeholder="name@example.com"
                   required>
            <label for="credencial">Email o Username</label>
        </div>

        <div class="form-floating mb-3 shadow d-none" id="passwordContainer">
            <input type="password" class="form-control animacion-aparicion" id="floatingPassword" name="password"
                   placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="text-center text-danger animacion-aparicion invisible" id="aviso">
            <p class="m-0">Mensaje</p>
        </div>

        <div class="text-center">
            <button type="submit" id="enviar" class="btn btn-outline-primary btn-lg d-none" name="accion" value="Login"
                    disabled>
                Acceder
            </button>
        </div>
    </form>
</main>

</body>
</html>
