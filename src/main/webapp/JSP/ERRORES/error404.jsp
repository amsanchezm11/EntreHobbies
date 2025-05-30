<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Error 404"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
</head>
<body class="d-flex flex-column body-custom position-relative w-100 bg-gradient-morado-blanco min-vh-100">

<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<main class="flex-grow-1 py-5 d-flex align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-sm-10 col-md-8 col-lg-6">
                <div class="card text-center shadow-lg p-4">
                    <img src="${contexto}/IMG/ERRORES/error404.svg"
                         class="card-img-top error-img mx-auto mb-3"
                         alt="Error 404">
                    <div class="card-body">
                        <h2 class="card-title fw-bold color-pm">404 - P&aacute;gina no encontrada</h2>
                        <p class="card-text">Lo sentimos, la p&aacute;gina que buscas no existe o ha sido movida.</p>
                        <form action="${contexto}/FrontController" method="post">
                            <button type="submit" class="btn btn-main btn-lg" name="accion" value="Refresh">
                                Men&uacute; Principal
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

</body>
</html>
