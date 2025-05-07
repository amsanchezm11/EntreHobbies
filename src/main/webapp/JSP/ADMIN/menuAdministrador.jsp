<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Dashboard"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
</head>
<body class="bg-body text-body min-vh-100">
<nav class="navbar bg-body-tertiary border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post" class="mb-0">
            <button class="navbar-brand btn btn-refresh" name="accion" value="Refresh">EntreHobbies</button>
        </form>
        <c:if test="${sessionScope.usuario != null}">
            <div class="dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center gap-2 text-warning" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false">
                    <img src="${contexto}/IMG/AVATARES/${sessionScope.usuario.avatar}" alt="Avatar" class="rounded-circle" style="width: 30px; height: 30px; object-fit: cover;">
                        ${sessionScope.usuario.username}
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <form action="Login" method="post">
                            <button class="dropdown-item" name="accion" value="Logout">Logout</button>
                        </form>
                    </li>
                </ul>
            </div>
        </c:if>

    </div>
</nav>
<main>
    <h1>Bienvenido Administrador!</h1>
</main>
</body>
</html>
