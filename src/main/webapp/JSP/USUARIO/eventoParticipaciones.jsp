<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Mis Participaciones"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/BOOTSTRAPTABLE/cargarParticipantes.js" defer></script>
</head>
<body class="body-custom position-relative bg-gradient-morado-blanco">

<c:import url="/INC/navbarUsuario.jsp"/>

<div class="mb-5 ps-3 my-3">
    <h1 class="text-light text-footer text-center">Mis Participaciones</h1>
    <p class="mb-4 text-light fs-4 text-center">Consulta tus participaciones a eventos actuales</p>
</div>

<main class="container pb-5">
    <div class="row">
        <c:forEach var="evento" items="${requestScope.eventos}">
            <div class="col-12 col-md-6 col-lg-4 mb-4">
                <div class="card card-eventos shadow-sm d-flex flex-column carta p-3 h-100">
                    <div class="card-body-eventos flex-grow-1 d-flex flex-column">
                        <h5 class="card-title fw-bold mb-4 ms-2">${evento[1]}</h5>
                        <p class="card-text ms-2"><strong>Fecha de inicio:</strong> <fmt:formatDate value="${evento[4]}" pattern="dd/MM/yyyy"/></p>
                        <p class="card-text ms-2"><strong>Categor&iacute;a:</strong> ${evento[6]}</p>
                        <p class="card-text ms-2"><strong>Localidad:</strong> ${evento[9]}</p>
                        <p class="card-text ms-2">
                            <c:choose>
                                <c:when test="${evento[11] == 'Por_Empezar'}">
                                    <strong>Estado:</strong> <span class="text-success fw-bold fst-italic">Por Empezar</span>
                                </c:when>
                                <c:when test="${evento[11] == 'Cancelado'}">
                                    <strong>Estado:</strong> <span class="text-danger fw-bold fst-italic">${evento[11]}</span>
                                </c:when>
                                <c:when test="${evento[11] == 'Finalizado'}">
                                    <strong>Estado:</strong> <span class="text-secondary fw-bold fst-italic">${evento[11]}</span>
                                </c:when>
                                <c:otherwise>
                                    <strong>Estado:</strong> <span class="text-info fw-bold fst-italic">En Curso</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <div class="mt-auto text-center">
                            <button type="button" class="btn btn-main w-100" data-bs-toggle="modal" data-bs-target="#eventoModal${evento[0]}">
                                Detalles
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="eventoModal${evento[0]}" tabindex="-1" aria-labelledby="eventoModalLabel${evento[0]}" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-header">
                            <h5 class="modal-title" id="eventoModalLabel${evento[0]}">${evento[1]}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <p><strong>Descripci&oacute;n:</strong> ${evento[2]}</p>
                            <p><i class="bi bi-calendar-plus me-2"></i><strong>Fecha de inicio:</strong> <fmt:formatDate value="${evento[4]}" pattern="dd/MM/yyyy"/></p>
                            <p><i class="bi bi-calendar-minus me-2"></i><strong>Fecha de fin:</strong> <fmt:formatDate value="${evento[5]}" pattern="dd/MM/yyyy"/></p>
                            <p><i class="bi bi-person me-2"></i><strong>Organizador:</strong> ${evento[14]}</p>
                            <p><i class="bi bi-bookmark me-2"></i><strong>Categor&iacute;a:</strong> ${evento[6]}</p>
                            <p><i class="bi bi-tags me-2"></i><strong>Subcategor&iacute;a:</strong> ${evento[7]}</p>
                            <p><i class="bi bi-geo-alt me-2"></i><strong>Direcci&oacute;n:</strong> ${evento[8]}</p>
                            <p><i class="bi bi-geo me-2"></i><strong>Localidad:</strong> ${evento[9]}</p>
                            <p><i class="bi bi-globe me-2"></i><strong>Provincia:</strong> ${evento[10]}</p>
                            <p>
                                <c:choose>
                                    <c:when test="${evento[11] == 'Por_Empezar'}">
                                        <i class="bi bi-hourglass-split me-2"></i><strong>Estado:</strong> <span class="text-success">Por Empezar</span>
                                    </c:when>
                                    <c:when test="${evento[11] == 'Cancelado'}">
                                        <i class="bi bi-x-circle-fill me-2"></i><strong>Estado:</strong> <span class="text-danger">${evento[11]}</span>
                                    </c:when>
                                    <c:when test="${evento[11] == 'Finalizado'}">
                                        <i class="bi bi-flag-fill me-2"></i><strong>Estado:</strong> <span class="text-secondary">${evento[11]}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="bi bi-arrow-repeat me-2"></i><strong>Estado:</strong> <span class="text-info">En Curso</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p><strong>N&uacute;mero de participantes:</strong> ${evento[13]} / ${evento[12]}
                                <i class="bi bi-person-plus-fill"></i>
                            </p>
                        </div>
                        <div class="modal-footer d-flex flex-column">
                            <c:choose>
                                <c:when test="${evento[11] == 'Por_Empezar'}">
                                    <button
                                            type="button"
                                            class="btn btn-outline-teal btn-sm rounded-pill w-100 mb-2"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalParticipantes"
                                            data-id-evento="${evento[0]}">
                                        <i class="bi bi-people me-2"></i>Ver participantes
                                    </button>
                                    <button
                                            type="button"
                                            class="btn btn-outline-danger btn-sm rounded-pill w-100"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalDesapuntarse${evento[0]}">
                                        <i class="bi bi-x-circle me-2"></i>Desapuntarme
                                    </button>
                                </c:when>

                                <c:when test="${evento[11] == 'En_Curso'}">
                                    <button
                                            type="button"
                                            class="btn btn-outline-teal btn-sm rounded-pill w-100"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalParticipantes"
                                            data-id-evento="${evento[0]}">
                                        <i class="bi bi-people me-2"></i>Ver participantes
                                    </button>
                                    <div class="alert alert-creador text-center p-2 rounded-pill mb-0 mt-2">
                                        <span>No puedes desapuntarte</span>
                                    </div>
                                </c:when>

                                <c:when test="${evento[11] == 'Cancelado'}">
                                    <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                        <span>El evento fue cancelado</span>
                                    </div>
                                </c:when>

                                <c:when test="${evento[11] == 'Finalizado'}">
                                    <div class="alert alert-creador text-center p-2 rounded-pill mb-0">
                                        <span>El evento ya finalizó</span>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <button
                                            type="button"
                                            class="btn btn-outline-teal btn-sm rounded-pill w-100"
                                            data-bs-toggle="modal"
                                            data-bs-target="#modalParticipantes"
                                            data-id-evento="${evento[0]}">
                                        <i class="bi bi-people me-2"></i>Ver participantes
                                    </button>
                                </c:otherwise>
                            </c:choose>

                            <button type="button" class="btn btn-secondary mt-3" data-bs-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modalDesapuntarse${evento[0]}" tabindex="-1" aria-labelledby="modalDesapuntarseLabel${evento[0]}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content rounded-4 shadow">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalDesapuntarseLabel${evento[0]}">Confirmar desapuntarse</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <p>¿Estás seguro de que deseas desapuntarte del evento <strong>${evento[1]}</strong>?</p>
                        </div>
                        <div class="modal-footer">
                            <form method="post" action="${contexto}/UsuarioEventoController" class="w-100">
                                <input type="hidden" name="idEvento" value="${evento[0]}"/>
                                <button type="submit" class="btn btn-outline-danger w-100" name="accion" value="Desapuntarse-evento">Sí, desapuntarme</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
</main>

<div class="modal fade" id="modalParticipantes" tabindex="-1" aria-labelledby="modalParticipantesLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header">
                <h5 class="modal-title" id="modalParticipantesLabel">Participantes</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <div class="modal-body">
                <table id="tablaParticipantes" data-bs-toggle="table" data-search="false" data-pagination="false"
                       class="table table-bordered table-hover"></table>
            </div>
        </div>
    </div>
</div>

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
