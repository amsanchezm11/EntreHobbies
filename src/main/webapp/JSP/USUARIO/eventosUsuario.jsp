<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Mis Eventos"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>

</head>
<body class="bg-body text-body position-relative w-100 bg-gradient-morado-blanco">
<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<div class="mb-5 ps-3 my-3">
    <h1 class="text-light text-login">Mis Eventos</h1>
</div>

<main class="container d-flex justify-content-center align-items-center">
    <div class="accordion w-100" id="accordionEventos">
        <c:forEach var="evento" items="${requestScope.eventos}">
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading${evento[1]}">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapse${evento[0]}" aria-expanded="true"
                            aria-controls="collapse${evento[0]}">
                            ${evento[1]} - <strong>${evento[3]}</strong>
                    </button>
                </h2>
                <div id="collapse${evento[0]}" class="accordion-collapse collapse" aria-labelledby="heading${evento[0]}"
                     data-bs-parent="#accordionEventos">
                    <div class="accordion-body">
                        <h5>${evento[1]}</h5>
                        <p><i class="bi bi-card-text me-2"></i><strong>Descripción:</strong> ${evento[2]}</p>
                        <p><i class="bi bi-calendar-plus me-2"></i><strong>Fecha de inicio:</strong> ${evento[4]}</p>
                        <p><i class="bi bi-calendar-minus me-2"></i><strong>Fecha de fin:</strong> ${evento[5]}</p>
                        <p><i class="bi bi-bookmark me-2"></i><strong>Categoría:</strong> ${evento[6]}</p>
                        <p><i class="bi bi-tags me-2"></i><strong>Subcategoría:</strong> ${evento[7]}</p>
                        <p><i class="bi bi-geo-alt me-2"></i><strong>Dirección:</strong> ${evento[8]}</p>
                        <p><i class="bi bi-geo me-2"></i><strong>Localidad:</strong> ${evento[9]}</p>
                        <p><i class="bi bi-globe me-2"></i><strong>Provincia:</strong> ${evento[10]}</p>
                        <p><strong>Número de participantes:</strong>
                                ${evento[12]} / ${evento[11]}
                            <i class="bi bi-person-plus-fill"></i>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

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
