<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="estilo" value="/CSS/style.css" scope="application"/>
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="EntreHobbies"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
    <script type="module" src="${contexto}/JS/alertas.js" defer></script>
    <script type="module" src="${contexto}/JS/index.js" defer></script>
</head>
<body class="landing-page position-relative w-100">

<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<section class="bloque">
    <div class="text-center">
        <h1 class="text-login text-light">EntreHobbies</h1>
        <h2 class="fw-normal mt-2 text-light">Haz amigos haciendo lo que te apasiona</h2>
    </div>
</section>

<section class="bloque d-flex flex-column gap-5">
    <h1 class="fw-bold text-titulo">Explora, comparte y vive tu hobby</h1>
    <div class="container">
        <div class="row text-center justify-content-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3">
                    <img src="${contexto}/IMG/GENERAL/conoce.svg" class="card-img-top img-fluid mx-auto" alt="Conoce a gente" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Conoce</h5>
                        <p>Descubre personas con tus mismos intereses.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3">
                    <img src="${contexto}/IMG/GENERAL/comparte.svg" class="card-img-top img-fluid mx-auto" alt="Comparte tu afici&oacute;n" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Comparte</h5>
                        <p>Haz que tus aficiones lleguen a m&aacute;s personas.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 rounded-3 p-3">
                    <img src="${contexto}/IMG/GENERAL/calendario.svg" class="card-img-top img-fluid mx-auto" alt="Crea tus planes" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Crea</h5>
                        <p>Organiza planes &uacute;nicos para disfrutar en grupo.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="bloque d-flex flex-column gap-5">
    <h1 class="fw-bold text-titulo">Nuevos usuarios</h1>
    <div class="container">
        <c:choose>
            <c:when test="${sessionScope.usuario == null}">
                <div class="card p-5 text-center">
                    <h5 class="fw-bold">¿Eres nuevo?</h5>
                    <p>¡Bienvenido! Reg&iacute;strate y empieza a disfrutar de la comunidad.</p>
                    <form action="${contexto}/FrontController" method="post">
                        <button type="submit" class="btn btn-main btn-lg" name="accion" value="Registro-usuario">Reg&iacute;strate</button>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <div class="card h-100 p-4">
                            <h5 class="fw-bold">¡Bienvenido de nuevo!</h5>
                            <p>Nos alegra verte nuevamente. Disfruta de todas las funcionalidades.</p>
                            <form action="${contexto}/FrontController" method="post">
                                <button type="submit" class="btn btn-main btn-lg" name="accion" value="Mi-Cuenta">Ir a mi perfil</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <div class="card h-100 p-4">
                            <h5 class="fw-bold">¡Organiza tu evento!</h5>
                            <p>¿Tienes un plan en mente? Comp&aacute;rtelo con la comunidad.</p>
                            <form action="${contexto}/FrontController" method="post">
                                <button type="submit" class="btn btn-main btn-lg" name="accion" value="Crear-Evento">Crear evento</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<section class="bloque">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <h1 class="fw-bold fs-1 text-center">Explora nuestras categor&iacute;as</h1>
                <p class="fs-4 text-center">Encuentra eventos seg&uacute;n tus intereses y &uacute;nete f&aacute;cilmente.</p>
                <form action="${contexto}/FrontController" method="post" class="d-flex justify-content-center align-items-center">
                    <button type="submit" class="btn btn-main mt-2 btn-lg" name="accion" value="Ver-Categorias">Categor&iacute;as</button>
                </form>
            </div>
            <div class="col-md-6 text-center">
                <img src="${contexto}/IMG/GENERAL/categorias.svg" class="img-fluid" style="max-width: 80%;">
            </div>
        </div>
    </div>
</section>

<section class="bloque d-flex flex-column gap-5">
    <h1 class="fw-bold text-titulo">Encuentra eventos, únete a la comunidad y disfruta</h1>
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="col-md-5 mb-4">
                <div class="card h-100 p-3">
                    <img src="${contexto}/IMG/GENERAL/buscar.svg" class="card-img-top img-fluid align-self-center m-2" alt="Busca eventos" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Busca eventos</h5>
                        <p>Filtra por subcategor&iacute;as, provincia y m&aacute;s para encontrar tu plan ideal.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-5 mb-4">
                <div class="card h-100 p-3">
                    <img src="${contexto}/IMG/GENERAL/unirse.svg" class="card-img-top img-fluid align-self-center m-2" alt="&uacute;nete a un evento" style="max-width: 65%; height: 200px;">
                    <div class="card-body">
                        <h5 class="fw-bold">Ap&uacute;ntate</h5>
                        <p>Haz clic y empieza a disfrutar con otros usuarios.</p>
                    </div>
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
                class="btn btn-main rounded-circle shadow-lg position-fixed"
                style="bottom: 2rem; right: 2rem; width: 60px; height: 60px;"
                title="Crear evento">
            <i class="bi bi-plus-lg fs-4"></i>
        </button>
    </form>
</c:if>

<c:if test="${requestScope.aviso != null}">
    <div class="notification alert alert-success" role="alert">
        <i class="bi bi-check-circle-fill me-2"></i>
        <span>${requestScope.aviso}</span>
    </div>
</c:if>

<c:if test="${requestScope.error != null}">
    <div class="notification-danger alert alert-danger" role="alert">
        <i class="bi bi-exclamation-triangle-fill me-2"></i>
        <span>${requestScope.error}</span>
    </div>
</c:if>

<section class="bloque-footer text-center d-flex justify-content-center align-items-center">
    <div>
        <h2 class="text-footer color-pm">Haz que cada momento cuente</h2>
        <p class="fs-4">Con EntreHobbies, tus hobbies se convierten en experiencias inolvidables.</p>
        <p class="fs-4">¡Crea, comparte y disfruta con otros apasionados!</p>
    </div>

</section>

<c:import url="/INC/pie.inc"/>
<div id="scroll-down" class="scroll-arrow" title="Desplazar hacia abajo" aria-label="Desplazar hacia abajo" role="button" tabindex="0">
    <svg height="30" width="30" viewBox="0 0 24 24" role="img" aria-hidden="true" fill="white">
        <path d="M23.7 8.7 12 20.42.3 8.71l1.4-1.42L12 17.6 22.3 7.3z"></path>
    </svg>
</div>
</body>
</html>
