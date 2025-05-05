<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Login Usuario"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script src="${contexto}/JS/comprobarCredencial.js" defer></script>
    <script src="${contexto}/JS/inicializarPopovers.js" defer></script>
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
    <h1 class="position-absolute top-0 start-0 text-light m-4 text-login">Login</h1>

    <form action="Login" method="post" class="w-50 mb-4">

        <div class="input-group mb-4 shadow">
            <div class="form-floating flex-grow-1">
                <input type="text"
                       class="form-control"
                       id="credencial"
                       name="credencial"
                       placeholder="name@example.com"
                       required>
                <label for="credencial">Email o Username</label>
            </div>
            <span class="input-group-text bg-light" style="cursor: pointer;" role="button"
                  title="Login"
                  data-bs-toggle="popover"
                  data-bs-placement="bottom"
                  data-bs-html="true"
                  data-bs-trigger="hover focus"
                  data-bs-content="<ul style='padding-left: 1.2rem; margin: 0;'>
                                  <li>Introduce un username o email correcto.</li>
                                  <li>El proceso de validaci&oacute;n puede tardar unos segundos.</li>
                                  <li>En caso de ser una credencial v&aacute;lida se te mostrar&aacute; el campo de password.</li>
                                  <li>Para habilitar el bot&oacute;n deben estar todos los campos completos.</li>
                               </ul>">
            <i class="bi bi-info-circle" style="font-size: 1.3rem;"></i>
        </span>
        </div>

        <div class="form-floating mb-3 shadow d-none" id="passwordContainer">
            <input type="password" class="form-control animacion-aparicion" id="floatingPassword" name="password" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <c:if test="${requestScope.error != null}">
            <p class="m-0 text-center text-danger">${requestScope.error}</p>
        </c:if>

        <div class="text-center text-danger invisible" id="aviso">
            <p class="m-0">Mensaje</p>
        </div>

        <div class="text-center">
            <button type="submit" id="enviar" class="btn btn-login btn-lg d-none" name="accion" value="Login" disabled>
                Acceder
            </button>
        </div>
    </form>


    <form action="FrontController" method="post"  class="text-center card-link bg-opacity-50 position-relative">
        <div class="text-center card-body-link">
            <button name="accion" class="btn-link" value="Registro-usuario">Si a&uacute;n no tienes cuenta. Reg&iacute;strate</button>
        </div>
    </form>
</main>
</body>
</html>
