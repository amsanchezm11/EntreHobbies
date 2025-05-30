<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Dashboard"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="module" src="${contexto}/JS/ESTADISTICAS/estadisticasUsuariosMes.js" defer></script>
</head>
<body class="bg-body text-body min-vh-100">
<main>
    <c:import url="/INC/menuAdministrador.jsp"/>
    <div class="content">
        <h1 class="fw-bold">Estad&iacute;sticas Usuarios</h1>
        <p>Panel permite al administrador revisar el rendimiento y la actividad de los usuarios en la plataforma.</p>

        <div class="row justify-content-center">
            <div class="col-12 col-md-10 mx-auto mt-5 p-5">
                <div class="row justify-content-center ps-5">

                    <div class="col-12 col-md-4 my-3">
                        <div class="card estadistica-card card-btn sombra-morada text-center rounded-4 h-100">
                            <div class="card-body">
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
                    </div>

                    <div class="col-12 col-md-4 my-3">
                        <div class="card estadistica-card card-btn sombra-morada text-center rounded-4 h-100">
                            <div class="card-body">
                                <img src="${contexto}/IMG/AVATARES/${requestScope.usuarioparticipante[1]}"
                                     alt="Avatar de ${requestScope.usuarioparticipante[0]}"
                                     class="avatar-estadistica mb-3"
                                     onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">

                                <h4 class="card-title fw-bold color-pm mb-2">${requestScope.usuarioparticipante[0]}</h4>
                                <p class="card-text text-muted">
                                    Eventos participados: <span class="fw-semibold">
                                    ${requestScope.usuarioparticipante[2] != null ? requestScope.usuarioparticipante[2] : 'Aun no hay datos'}</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-4 my-3">
                        <div class="card estadistica-card card-btn sombra-morada text-center rounded-4 h-100">
                            <div class="card-body">
                                <img src="${contexto}/IMG/GENERAL/usuariosapp.svg"
                                     alt="Total usuarios registrados"
                                     class="avatar-estadistica mb-3"
                                     onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">

                                <h4 class="card-title fw-bold color-pm mb-2">Usuarios Registrados</h4>
                                <p class="card-text text-muted">
                                    Total: <span class="fw-semibold">${requestScope.totalRegistrados}</span>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4 py-5">
            <div class="col-12 col-md-10">
                <div class="card card-btn sombra-morada shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title text-center">Usuarios Registrados por Mes</h5>
                        <canvas id="lineChartUsuariosMes" style="width: 100%; height: auto;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>