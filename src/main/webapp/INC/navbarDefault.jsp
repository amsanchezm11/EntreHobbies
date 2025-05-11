<nav id="navbar" class="navbar navbar-expand-lg navbar-light bg-body-tertiary border-bottom sticky-top">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-refresh" name="accion" value="Refresh">EntreHobbies</button>
        </form>
        <div class="d-flex align-items-center gap-3">
            <form class="d-flex" role="search" action="${contexto}/FrontController" method="post">
                <button id="loginButton"
                        class="btn btn-main"
                        title="Hacer login"
                        type="submit"
                        name="accion"
                        value="Login">Login</button>
            </form>
        </div>
    </div>
</nav>
