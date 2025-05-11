<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="estilo" value="/CSS/style.css" scope="application" />
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies" />
        <jsp:param name="estilo" value="${estilo}" />
    </jsp:include>
    <script type="module" src="${contexto}/JS/alertas.js" defer></script>
    <script type="module" src="${contexto}/JS/index.js" defer></script>
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

<div class="container py-5">
    <h1 class="text-center text-light fw-bold">Explora, comparte y vive tu hobby</h1>
</div>


<div class="container my-4">
    <h2 class="text-center mb-4 text-light fw-bold">Haz amigos haciendo lo que te apasiona</h2>
    <section class="row justify-content-center">

        <div class="col-md-4 mb-4">
            <div class="card h-100 rounded-3 p-3">
                <img src="${contexto}/IMG/GENERAL/conoce.svg" class="card-img-top img-fluid mx-auto d-block" alt="Conoce a gente" style="max-width: 65%; object-fit: contain; height: 200px;">
                <div class="card-body">
                    <h5 class="card-title text-center fw-bold">Conoce</h5>
                    <p class="card-text">Descubre personas con tus mismos intereses.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100 rounded-3 p-3">
                <img src="${contexto}/IMG/GENERAL/comparte.svg" class="card-img-top img-fluid mx-auto d-block" alt="Comparte tu afición" style="max-width: 65%; object-fit: contain; height: 200px;">
                <div class="card-body">
                    <h5 class="card-title text-center fw-bold">Comparte</h5>
                    <p class="card-text">Haz que tus aficiones lleguen a m&aacute;s personas.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100 rounded-3 p-3">
                <img src="${contexto}/IMG/GENERAL/calendario.svg" class="card-img-top img-fluid mx-auto d-block" alt="Crea tus planes" style="max-width: 65%; object-fit: contain; height: 200px;">
                <div class="card-body">
                    <h5 class="card-title text-center fw-bold">Crea</h5>
                    <p class="card-text">Organiza planes &uacute;nicos para disfrutar en grupo.</p>
                </div>
            </div>
        </div>
    </section>
</div>

<c:choose>
    <c:when test="${sessionScope.usuario == null}">
        <section class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-12 mb-4 mt-5">
                    <div class="card h-100 rounded-3 p-3">
                        <div class="card-body text-center">
                            <h5 class="card-title fw-bold">¿Eres nuevo?</h5>
                            <p class="card-text">¡Bienvenido! Reg&iacute;strate y empieza a disfrutar de la comunidad.</p>
                            <form action="${contexto}/FrontController" method="post">
                                <button type="submit" class="btn btn-main btn-lg" name="accion" value="Registro-usuario">Reg&iacute;strate</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:otherwise>
        <section class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-6 mx-auto my-5">
                    <div class="card h-100 rounded-3 p-4">
                        <div class="row align-items-center">
                            <div class="col-md-6 text-center text-md-start">
                                <img src="${contexto}/IMG/GENERAL/perfil.svg"
                                     class="img-fluid mx-auto d-block p-2"
                                     alt="Imagen de perfil"
                                     style="max-width: 80%; object-fit: contain;">
                            </div>
                            <div class="col-md-6">
                                <h5 class="card-title fw-bold">¡Bienvenido de nuevo!</h5>
                                <p class="card-text">Nos alegra verte nuevamente. Aprovecha tu cuenta para disfrutar de todas las funcionalidades.</p>
                                <form action="${contexto}/FrontController" method="post">
                                    <button type="submit" class="btn btn-main btn-lg" name="accion" value="Mi-Cuenta">Ir a mi perfil</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </c:otherwise>
</c:choose>


<section class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6 mx-auto my-5">
            <div class="card h-100 rounded-3 p-4">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start">
                        <h5 class="card-title fw-bold fs-5">Explora nuestras categor&iacute;as</h5>
                        <p class="card-text fs-6">Encuentra eventos seg&uacute;n tus intereses y &uacute;nete a ellos f&aacute;cilmente.</p>
                        <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-main mt-2 btn-lg" name="accion" value="Ver-Categorias">Categor&iacute;as</button>
                        </form>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="${contexto}/IMG/GENERAL/categorias.svg"
                             class="img-fluid mx-auto d-block p-2"
                             alt="Categor&iacute;as"
                             style="max-width: 80%; object-fit: contain;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-5 mb-4">
            <div class="card h-100 rounded-3 p-3">
                <img src="${contexto}/IMG/GENERAL/buscar.svg" class="card-img-top img-fluid mx-auto d-block" alt="Buscar eventos" style="max-width: 65%; object-fit: contain; height: 200px;">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">Busca eventos</h5>
                    <p class="card-text">Filtra por subcategor&iacute;as, provincia y descripci&oacute;n para encontrar tu plan ideal.</p>
                </div>
            </div>
        </div>

        <div class="col-md-5 mb-4">
            <div class="card h-100 rounded-3 p-3">
                <img src="${contexto}/IMG/GENERAL/unirse.svg" class="card-img-top img-fluid mx-auto d-block" alt="Ap&uacute;ntate" style="max-width: 65%; object-fit: contain; height: 200px;">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">Ap&uacute;ntate</h5>
                    <p class="card-text">Haz clic y empieza a disfrutar con otros usuarios de tus mismos hobbies.</p>
                </div>
            </div>
        </div>
    </div>
</section>


<c:if test="${sessionScope.usuario != null}">
    <form action="${contexto}/FrontController" method="post">
        <button type="submit"
                name="accion"
                value="Crear-Evento"
                class="btn btn-main rounded-circle shadow-lg d-flex justify-content-center align-items-center btn-shadow"
                id="botonCrearEvento" title="Crear evento">
            <i class="bi bi-plus-lg fs-3"></i>
        </button>
    </form>
</c:if>

<%--<c:if test="${requestScope.aviso != null}">--%>
<%--    <div id="aviso"--%>
<%--         class="alert alert-success fade show position-fixed bottom-0 start-50 translate-middle-x mb-4 z-3 px-4 py-2"--%>
<%--         role="alert"--%>
<%--         style="width: auto; pointer-events: none;">--%>
<%--        <i class="bi bi-check-circle-fill me-2"></i>--%>
<%--            ${requestScope.aviso}--%>
<%--    </div>--%>
<%--</c:if>--%>

<c:if test="${requestScope.aviso != null}">
    <div id="aviso"
         class="notification"
         role="alert"
         style="pointer-events: none;">
        <div class="notification-body">
            <i class="bi bi-check-circle-fill me-2"></i>
            <span>${requestScope.aviso}</span>
            <div class="notification-progress"></div>
        </div>
    </div>
</c:if>

<c:if test="${requestScope.error != null}">
    <div id="aviso"
         class="notification-danger"
         role="alert"
         style="pointer-events: none;">
        <div class="notification-body">
            <i class="bi bi-check-circle-fill me-2"></i>
            <span>${requestScope.error}</span>
            <div class="notification-danger-progress"></div>
        </div>
    </div>
</c:if>


<c:import url="/INC/pie.inc"/>
</body>
</html>
