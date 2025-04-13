<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="estilo" value="/CSS/style.css" scope="application" />
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies" />
        <jsp:param name="estilo" value="${estilo}" />
    </jsp:include>
</head>
<body class="bg-body text-body">
<nav class="navbar bg-body-tertiary border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-custom" name="accion" value="Refresh">EntreHobbies</button>
        </form>
        <div class="d-flex align-items-center gap-3">
           <%-- <div class="form-check form-switch">
                <img id="themeIcon" src="${contexto}/IMG/TEMA/${theme == 'dark' ? 'Luna' : 'Sol'}.png" alt="Icono de tema" width="24" height="24" style="cursor: pointer;" title="Cambiar Tema">
            </div> --%>
            <c:choose>
                <c:when test="${sessionScope.usuario == null}">
                    <form class="d-flex" role="search" action="${contexto}/FrontController" method="post">
                        <button id="loginButton" class="btn btn-outline-success" type="submit" name="accion" value="Login">Login</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ${sessionScope.usuario.username}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#">Mi Perfil</a></li>
                            <li><a class="dropdown-item" href="#">Mis Eventos</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="Login" method="post">
                                    <button class="dropdown-item" name="accion" value="Logout">Logout</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<!-- Título y contenido principal -->
<h1>Entre Hobbies</h1>
<img src="${contexto}/IMG/TEMA/${theme == 'dark' ? 'Luna' : 'Sol'}.png" alt="Icono de tema" width="50" height="50">

<c:import url="/INC/pie.inc"/>
</body>
</html>
