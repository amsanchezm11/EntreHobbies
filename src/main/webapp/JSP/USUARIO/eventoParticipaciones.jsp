<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Ver Participaciones"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>

</head>
<body class="d-flex flex-column min-vh-100 bg-body text-body position-relative w-100 h-100 bg-gradient-morado-blanco">
<c:import url="/INC/navbarUsuario.jsp"/>

<main class="flex-grow-1">
    <div class="container py-5">
        <h1 class="text-center text-light text-footer">Mis Participaciones</h1>
    </div>
</main>

<c:import url="/INC/pie.inc"/>
</body>
</html>