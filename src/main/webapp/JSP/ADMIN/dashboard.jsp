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
<%--    <aside class="sidebar bg-gradient-morado-blanco">--%>
<%--        <div class="d-flex flex-column align-items-center justify-content-center gap-2 mb-5">--%>
<%--            <img src="${contexto}/IMG/AVATARES/${sessionScope.usuario.avatar}" class="rounded-circle mb-2" alt="Foto de perfil" width="100" height="100">--%>
<%--            <h5 class="text-white">Administrador</h5>--%>
<%--        </div>--%>
<%--        <form action="${contexto}/FrontController" method="post">--%>
<%--            <button type="submit" name="accion" value="Dashboard" class="btn text-white text-start w-100">Dashboard</button>--%>
<%--        </form>--%>
<%--        <form action="${contexto}/FrontController" method="post">--%>
<%--            <button type="submit" name="accion" value="usuarios" class="btn text-white text-start w-100">Gesti&oacute;n de Usuarios</button>--%>
<%--        </form>--%>
<%--        <form action="${contexto}/FrontController" method="post">--%>
<%--            <button type="submit" name="accion" value="eventos" class="btn text-white text-start w-100">Eventos</button>--%>
<%--        </form>--%>
<%--        <form action="${contexto}/FrontController" method="post">--%>
<%--            <button type="submit" name="accion" value="configuracion" class="btn text-white text-start w-100">Categor&iacute;as</button>--%>
<%--        </form>--%>
<%--        <form action="${contexto}/FrontController" method="post">--%>
<%--            <button type="submit" name="accion" value="Ver-Estadisticas" class="btn text-white text-start w-100">Estad&iacute;sticas</button>--%>
<%--        </form>--%>
<%--        <form action="${contexto}/Login" method="post">--%>
<%--            <button type="submit" name="accion" value="Logout" class="btn text-white text-start w-100">Cerrar sesi&oacute;n</button>--%>
<%--        </form>--%>
<%--    </aside>--%>

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
                            <button type="submit" name="accion" value="Logout" class="btn btn-main">Ir a Eventos</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
