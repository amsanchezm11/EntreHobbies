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
</head>
<body class="bg-body text-body position-relative overflow-hidden w-100">

<c:choose>
    <c:when test="${sessionScope.usuario != null}">
        <c:import url="/INC/navbarUsuario.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="/INC/navbarDefault.jsp"/>
    </c:otherwise>
</c:choose>

<img src="${contexto}/IMG/CATEGORIAS/videojuegos.jpg"
     class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover z-n1"
     alt="Fondo de videojuegos">

<div class="container py-5">
    <h1 class="text-center text-light">Entre Hobbies</h1>
</div>

<c:import url="/INC/pie.inc"/>
</body>
</html>
