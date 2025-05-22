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
<main>
    <c:import url="/INC/menuAdministrador.jsp"/>
    <div class="content">
        <h1 class="fw-bold">Estad&iacute;sticas Usuarios</h1>
        <p>Panel de control del administrador para consultar y supervisar datos del sistema.</p>

        <div class="card estadistica-card mx-auto my-4">
            <div class="card-body text-center rounded-4 shadow">
                <img src="${requestScope.usuariocreador[1]}"
                     alt="Avatar de ${requestScope.usuariocreador[0]}"
                     class="avatar-estadistica mb-3"
                     onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">

                <h4 class="card-title fw-bold color-pm mb-2">${requestScope.usuariocreador[0]}</h4>

                <p class="card-text text-muted">
                    Eventos creados: <span class="fw-semibold">${requestScope.usuariocreador[2]}</span>
                </p>
            </div>
        </div>

        <div class="card estadistica-card mx-auto my-4">
            <div class="card-body text-center rounded-4 shadow">
                <img src="${requestScope.usuarioparticipante[1]}"
                     alt="Avatar de ${requestScope.usuarioparticipante[0]}"
                     class="avatar-estadistica mb-3"
                     onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">

                <h4 class="card-title fw-bold color-pm mb-2">${requestScope.usuarioparticipante[0]}</h4>

                <p class="card-text text-muted">
                    Eventos participados: <span class="fw-semibold">${requestScope.usuarioparticipante[2]}</span>
                </p>
            </div>
        </div>


    </div>
</main>


</body>
</html>