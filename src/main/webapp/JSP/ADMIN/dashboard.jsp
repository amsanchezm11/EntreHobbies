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
        <h1 class="fw-bold">Dashboard</h1>
        <p>Panel de control del administrador para consultar y supervisar datos del sistema.</p>
        <div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
            <div class="col">
                <div class="card shadow h-100">
                    <div class="card-body d-flex flex-column text-center justify-content-between">
                        <img src="${contexto}/IMG/GENERAL/usuarios.svg" alt="Consulta de Usuarios" class="img-fluid mb-3" style="max-height: 150px; margin: 0 auto;">
                        <h5 class="card-title">Consulta de Usuarios</h5>
                        <p class="card-text flex-grow-1">Visualiza la información y el estado de los usuarios registrados sin posibilidad de edición.</p>
                        <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center gap-3 mt-3">
                            <button type="submit" name="accion" value="Ver-AllUsuarios" class="btn btn-main">Ver todos los usuarios</button>
                            <button type="submit" name="accion" value="Estadisticas-Usuario" class="btn btn-main">Estad&iacute;sticas Usuarios</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card shadow h-100">
                    <div class="card-body d-flex flex-column text-center justify-content-between">
                        <img src="${contexto}/IMG/GENERAL/eventos.svg" alt="Consulta de Eventos" class="img-fluid mb-3" style="max-height: 150px; margin: 0 auto;">
                        <h5 class="card-title">Consulta de Eventos</h5>
                        <p class="card-text flex-grow-1">Revisa los eventos registrados y su estado actual, sin capacidad para modificarlos.</p>
                        <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center gap-3 mt-3">
                            <button type="submit" name="accion" value="Ver-AllEventos" class="btn btn-main">Ver todos los eventos</button>
                            <button type="submit" name="accion" value="Estadisticas-Eventos" class="btn btn-main">Estad&iacute;sticas Eventos</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card shadow h-100">
                    <div class="card-body d-flex flex-column text-center justify-content-between">
                        <img src="${contexto}/IMG/GENERAL/categorias.svg" alt="Consulta de Categorías" class="img-fluid mb-3" style="max-height: 150px; margin: 0 auto;">
                        <h5 class="card-title">Consulta de Categorías</h5>
                        <p class="card-text flex-grow-1">Visualiza las categorías existentes para una mejor comprensión de la organización del sistema.</p>
                        <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center gap-3 mt-3">
                            <button type="submit" name="accion" value="Ver-AllCategorias" class="btn btn-main">Ver todas las categor&iacute;as</button>
                            <button type="submit" name="accion" value="Estadisticas-Categorias" class="btn btn-main">Estad&iacute;sticas Categor&iacute;as</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card shadow h-100">
                    <div class="card-body d-flex flex-column text-center justify-content-between">
                        <img src="${contexto}/IMG/GENERAL/estadisticas.svg" alt="Consulta de Estadísticas Generales" class="img-fluid mb-3" style="max-height: 150px; margin: 0 auto;">
                        <h5 class="card-title">Consulta de Estadísticas Generales</h5>
                        <p class="card-text flex-grow-1">
                            Visualiza informes consolidados y datos estadísticos globales que reflejan el desempeño y uso general de toda la aplicación.
                        </p>
                        <form action="${contexto}/FrontController" method="post" class="mt-3">
                            <button type="submit" name="accion" value="Ver-Estadisticas" class="btn btn-main">Ver Estad&iacute;sticas</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
