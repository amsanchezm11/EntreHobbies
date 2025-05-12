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
        <p>Panel de control de administrador.</p>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gesti&oacute;n de Usuarios</h5>
                        <p class="card-text">Administra y gestiona los usuarios del sistema.</p>
                        <form action="${contexto}/FrontController" method="post">
                            <button type="submit" name="accion" value="Usuarios" class="btn btn-main">Ir a Usuarios</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gesti&oacute;n de Eventos</h5>
                        <p class="card-text">Administra y gestiona los eventos en el sistema.</p>
                        <form action="${contexto}/FrontController" method="post">
                            <button type="submit" name="accion" value="Eventos" class="btn btn-main">Ir a Eventos</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Gesti&oacute;n de Categor&iacute;as</h5>
                        <p class="card-text">Administra las categor&iacute;as disponibles para los eventos.</p>
                        <form action="${contexto}/FrontController" method="post">
                            <button type="submit" name="accion" value="Categorias" class="btn btn-main">Ir a Categor&iacute;as</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-6 mt-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Estad&iacute;sticas</h5>
                        <p class="card-text">Consulta informes y datos estad&iacute;sticos del sistema.</p>
                        <form action="${contexto}/FrontController" method="post">
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
