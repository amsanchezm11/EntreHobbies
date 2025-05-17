<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Resumen de Usuarios"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/BOOTSTRAPTABLE/cargarAllUsuarios.js" defer></script>
</head>
<body class="d-flex flex-column body-custom position-relative w-100 bg-gradient-morado-blanco">
<c:import url="/INC/navbarAdmin.jsp"/>
<div class="container mt-4">
    <div class="w-100">
        <h2 class="text-light text-left text-footer">Resumen de Usuarios</h2>
    </div>

    <table
            id="tablaUsuarios"
            class="table table-striped"
    >
        <thead>
        <tr>
            <th data-field="idUsuario">ID</th>
            <th data-field="nombre">Nombre</th>
            <th data-field="apellidos">Apellidos</th>
            <th data-field="username">Usuario</th>
            <th data-field="email">Email</th>
        </tr>
        </thead>
    </table>
</div>

</body>
</html>
