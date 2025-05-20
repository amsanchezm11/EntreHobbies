<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Categorías" />
        <jsp:param name="estilo" value="${estilo}" />
    </jsp:include>
</head>
<body class="position-relative body-custom bg-gradient-morado-blanco">
<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<div class="mb-5 ps-3 my-3">
    <h1 class="text-light text-login">Categor&iacute;as</h1>
</div>

<div class="row justify-content-center m-5 py-5">
    <c:forEach var="categoria" items="${requestScope.categorias}">
        <div class="col-md-4 mb-5">
            <form action="${contexto}/FrontController" method="post" class="h-100">
                <input type="hidden" name="idCategoria" value="${categoria[0]}">
                <button type="submit"
                        name="accion"
                        class="card h-100 rounded-5 p-3 border-0 text-decoration-none bg-white text-dark w-100 carta"
                        style="cursor: pointer;"
                        value="${usuario != null ? 'Ver-Eventos-Logueado' : 'Ver-Eventos'}">
                    <c:choose>
                        <c:when test="${not empty categoria[2]}">
                            <img src="${contexto}/IMG/CATEGORIAS/${categoria[2]}"
                                 class="card-img-top img-fluid mx-auto d-block"
                                 alt="${categoria[1]}"
                                 style="max-width: 65%; object-fit: contain; height: 200px;">
                        </c:when>
                        <c:otherwise>
                            <img src="${contexto}/IMG/CATEGORIAS/default.jpg"
                                 class="card-img-top img-fluid mx-auto d-block"
                                 alt="${categoria[1]}"
                                 style="max-width: 65%; object-fit: contain; height: 200px;">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title text-center fw-bold">${categoria[1]}</h5>
                    </div>
                </button>
            </form>
        </div>
    </c:forEach>
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
