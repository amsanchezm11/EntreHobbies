<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/INC/cabecera.jsp">
        <jsp:param name="titulo" value="Login"/>
        <jsp:param name="estilo" value="${estilo}"/>
    </jsp:include>
</head>
<body>

<main class="d-flex flex-column justify-content-center align-items-center w-100 h-100">
    <h1>Formulario de logueo</h1>

    <form action="Login" method="post" class="w-75">
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" name="email" placeholder="name@example.com"
                   required>
            <label for="floatingInput">Email o Username</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password"
                   required>
            <label for="floatingPassword">Password</label>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-outline-light btn-lg" name="action" value="Login">Acceder</button>
        </div>
    </form>
</main>

</body>
</html>
