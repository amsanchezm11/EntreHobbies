<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Dashboard"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="module" src="${contexto}/JS/ESTADISTICAS/estadisticasEventosMes.js" defer></script>
</head>
<body class="bg-body text-body min-vh-100">
<main>
    <c:import url="/INC/menuAdministrador.jsp"/>
    <div class="content">
        <h1 class="fw-bold">Estadísticas de Eventos</h1>
        <p>Panel permite al administrador revisar el rendimiento y la actividad de los eventos en la plataforma.</p>

        <div class="row justify-content-center">
            <div class="col-12 col-md-10 mx-auto mt-5 p-5">
                <div class="row justify-content-center ps-5">

                    <div class="col-12 col-md-4 my-3">
                        <div class="card estadistica-card card-btn sombra-morada text-center rounded-4 h-100">
                            <div class="card-body">
                                <img src="${contexto}/IMG/GENERAL/eventos.svg"
                                     alt="Eventos creados"
                                     class="avatar-estadistica mb-3"
                                     onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">

                                <h4 class="card-title fw-bold color-pm mb-2">Eventos Totales</h4>
                                <p class="card-text text-muted">
                                    Total: <span class="fw-semibold">${requestScope.totalEventos}</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-4 my-3">
                        <div class="card estadistica-card card-btn sombra-morada text-center rounded-4 h-100">
                            <div class="card-body">
                                <img src="${contexto}/IMG/CATEGORIAS/${requestScope.eventoPopular[1]}"
                                     alt="Evento más popular"
                                     class="avatar-estadistica mb-3"
                                     onerror="this.onerror=null; this.src='${contexto}/IMG/CATEGORIAS/default.png';">

                                <h4 class="card-title fw-bold color-pm mb-2">Evento m&aacute;s popular</h4>
                                <p class="card-text text-muted">
                                    Evento: <span class="fw-semibold">${requestScope.eventoPopular[0]}</span>
                                </p>
                                <p class="card-text text-muted">
                                    Participantes: <span class="fw-semibold">${requestScope.eventoPopular[2]}</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-4 my-3">
                        <div class="card estadistica-card card-btn sombra-morada text-center rounded-4 h-100">
                            <div class="card-body">
                                <img src="${contexto}/IMG/CATEGORIAS/${requestScope.eventoReciente[1]}"
                                     alt="Evento reciente"
                                     class="avatar-estadistica mb-3"
                                     onerror="this.onerror=null; this.src='${contexto}/IMG/CATEGORIAS/default.png';">
                                <h4 class="card-title fw-bold color-pm mb-2">Evento m&aacute;s reciente</h4>
                                <p class="card-text text-muted">
                                    Evento: <span class="fw-semibold">${requestScope.eventoReciente[0]}</span>
                                </p>
                                <p class="card-text text-muted">
                                    Creado el: <span class="fw-semibold">
                                <fmt:formatDate value="${requestScope.eventoReciente[2]}" pattern="dd/MM/yyyy"/>
                            </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4 py-5">
            <div class="col-12 col-md-10">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title text-center">Eventos por Mes</h5>
                        <canvas id="lineChartEventosMes" style="width: 100%; height: auto;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>