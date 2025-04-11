<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand">EntreHobbies</a>
                <form class="d-flex" role="search" action="${contexto}/FrontController" method="post">
                    <button class="btn btn-outline-light" type="submit" name="accion" value="Login">Login</button>
                </form>
            </div>
        </nav>
        <h1>Hello World!</h1>
    </body>
    <c:import url="/INC/pie.inc"/>
</html>
