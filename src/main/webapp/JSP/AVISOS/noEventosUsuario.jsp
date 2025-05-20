<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Eventos"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
</head>
<body class="bg-body text-body position-relative w-100 bg-gradient-morado-blanco">

<c:import url="/INC/navbarUsuario.jsp"/>

<div class="mb-5 ps-3 my-3">
    <h1 class="text-light text-login">Mis Eventos</h1>
</div>

<div class="container d-flex justify-content-center align-items-center"
     style="min-height: 60vh;">

    <div class="container d-flex justify-content-center align-items-start mt-5 pt-5" style="min-height: 60vh;">
        <div class="text-center">

            <h1 class="mb-3 text-light fw-bold fs-2 text-titulo">¡Aun no tienes eventos!</h1>
            <p class="mb-4 text-light fs-4">Toma la iniciativa y crea tu primer evento.</p>

            <form action="${contexto}/FrontController" method="post">
                <button type="submit" name="accion" value="Crear-Evento" class="btn btn-main btn-lg px-4">
                    Crear Evento
                </button>
            </form>
        </div>
    </div>

    <c:if test="${sessionScope.usuario != null}">
    <form action="${contexto}/FrontController" method="post">
        <button type="submit"
                name="accion"
                value="Crear-Evento"
                class="btn btn-main rounded-circle shadow-lg d-flex justify-content-center align-items-center"
                id="botonCrearEvento" title="Crear evento">
            <i class="bi bi-plus-lg fs-3"></i>
        </button>
    </form>
    </c:if>

    <c:if test="${requestScope.aviso != null}">
    <div id="aviso"
         class="alert alert-success fade show position-fixed bottom-0 start-50 translate-middle-x mb-4 z-3 px-4 py-2"
         role="alert"
         style="width: auto; pointer-events: none;">
        <i class="bi bi-check-circle-fill me-2"></i>
            ${requestScope.aviso}
    </div>
    </c:if>

</body>
</html>