<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Quienes somos"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>

</head>
<body class="bg-body text-body position-relative w-100 bg-gradient-morado-blanco">
<nav id="navbar" class="navbar navbar-expand-lg navbar-light bg-body-tertiary border-bottom sticky-top">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-refresh" name="accion" value="Refresh">EntreHobbies</button>
        </form>
<%--        <div class="d-flex align-items-center gap-3 invisible">--%>
<%--            <form class="d-flex" role="search" action="${contexto}/FrontController" method="post">--%>
<%--                <button id="loginButton"--%>
<%--                        class="btn btn-main"--%>
<%--                        title="Hacer login"--%>
<%--                        type="submit"--%>
<%--                        name="accion"--%>
<%--                        value="Login">Login</button>--%>
<%--            </form>--%>
<%--        </div>--%>
    </div>
</nav>


<div class="container py-5">
    <h1 class="text-center text-light fw-bold">Sobre nosotros</h1>
</div>

<div class="card mt-5 mx-auto shadow-lg rounded-4 overflow-hidden" style="max-width: 960px;">
    <div class="row g-0">
        <div class="col-md-5">
            <img src="${contexto}/IMG/GENERAL/quienesomos.svg" class="img-fluid h-100 w-100 object-fit-cover" alt="Descripci&oacute;n de la imagen">
        </div>
        <div class="col-md-7 d-flex align-items-center">
            <div class="card-body">
                <h2 class="card-title fw-bold color-pm">Qui&eacute;nes somos</h2>
                <p class="card-text text-body">
                    Soy Alberto S&aacute;nchez Mac&iacute;as, estudiante de Desarrollo de Aplicaciones Web en el instituto I.E.S. Albarregas de M&eacute;rida.
                    Este proyecto nace con el objetivo de facilitar la conexi&oacute;n entre personas con intereses comunes, fomentando la creaci&oacute;n de comunidad a trav&eacute;s de actividades compartidas.
                </p>

                <h3 class="card-title fw-bold color-pm mt-4">Nuestro prop&oacute;sito</h3>
                <p class="card-text text-body">
                    En EntreHobbies creemos en conectar personas con intereses comunes. Esta plataforma est&aacute; hecha para ti: para que compartas tus aficiones, conozcas nuevas amistades y vivas experiencias únicas.
                </p>
            </div>
        </div>
    </div>
</div>

<c:import url="/INC/pie.inc"/>
</body>
</html>
