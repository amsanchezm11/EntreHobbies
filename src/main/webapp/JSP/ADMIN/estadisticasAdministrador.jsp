<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Estad&iacute;sticas"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script type="module" src="${contexto}/JS/estadisticasEventos.js" defer></script>
    <script type="module" src="${contexto}/JS/estadisticasEventosMes.js" defer></script>
    <script type="module" src="${contexto}/JS/estadisticasUsuarios.js" defer></script>
    <script type="module" src="${contexto}/JS/estadisticasTopProvincias.js" defer></script>
    <script type="module" src="${contexto}/JS/estadisticasTopUsuarios.js" defer></script>
    <script type="module" src="${contexto}/JS/estadisticasTopCategorias.js" defer></script>
    <script type="module" src="${contexto}/JS/estadisticasTopSubcategorias.js" defer></script>
</head>
<body class="bg-body text-body min-vh-100">

<main class="estadisticas-layout d-flex">
    <c:import url="/INC/menuAdministrador.jsp"/>

    <div class="content container-fluid ms-250 py-4">

        <div class="row justify-content-center mb-4 g-4">
            <div class="col-12 col-md-5">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-center">Eventos por Categor&iacute;a</h5>
                        <canvas id="myChart" style="width: 100%; height: auto;"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-5">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-center">Usuarios por Sexo</h5>
                        <canvas id="usuariosSexoChart" style="width: 100%; height: auto;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4">
            <div class="col-12 col-md-8">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title text-center">Eventos por Mes</h5>
                        <canvas id="lineChartEventosMes" style="width: 100%; height: auto;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4">
            <div class="col-12 col-md-6 col-lg-5">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-center">Provincias con M&aacute;s Eventos</h5>
                        <canvas id="barChartProvincias" style="width: 100%; height: 250px;"></canvas>
                    </div>
                </div>
            </div>

            <!-- Alineación de ambos canvas -->
            <div class="col-12 col-md-6 col-lg-5">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-center">Usuarios con M&aacute;s Eventos</h5>
                        <canvas id="usuariosEventosChart" style="width: 100%; height: 250px;"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center mb-4 g-4">
            <div class="col-12 col-md-6 col-lg-5">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-center">Categor&iacute;as con M&aacute;s Eventos</h5>
                        <canvas id="barChartCategorias" style="width: 100%; height: 250px;"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-5">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-center">Subcategor&iacute;as con M&aacute;s Eventos</h5>
                        <canvas id="barChartSubcategorias" style="width: 100%; height: 250px;"></canvas>
                    </div>
                </div>
            </div>
        </div>

    </div>
</main>
</body>
</html>
