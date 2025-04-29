<nav class="navbar bg-body-tertiary border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post">
            <button class="navbar-brand btn btn-custom" name="accion" value="Refresh">EntreHobbies</button>
        </form>
        <div class="d-flex align-items-center gap-3">
            <%-- <div class="form-check form-switch">
                 <img id="themeIcon" src="${contexto}/IMG/TEMA/${theme == 'dark' ? 'Luna' : 'Sol'}.png" alt="Icono de tema" width="24" height="24" style="cursor: pointer;" title="Cambiar Tema">
             </div> --%>

            <form class="d-flex" role="search" action="${contexto}/FrontController" method="post">
                <button id="loginButton" class="btn btn-main" type="submit" name="accion" value="Login">Login</button>
            </form>


        </div>
    </div>
</nav>