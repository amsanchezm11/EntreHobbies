<nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary border-bottom sticky-top">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post" class="mb-0">
            <button class="navbar-brand btn btn-refresh" name="accion" value="Refresh">EntreHobbies</button>
        </form>
                <div class="container-fluid w-25 d-flex gap-2">
                    <button class="btn btn-main"
                            type="button"
                            title="Ver filtros"
                            data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasScrolling"
                            aria-controls="offcanvasScrolling">Filtros
                    </button>
                    <form class="d-flex" role="search" action="${contexto}/Ajax" method="post">
                        <input type="hidden" id="categoriaId" name="categoria" value="${requestScope.categoriaId}">
                        <div class="position-relative w-100">
                            <input id="buscador"
                                   class="form-control pe-5"
                                   type="search"
                                   title="Buscar eventos"
                                   placeholder="Buscar"
                                   aria-label="Buscar">
                            <i class="bi bi-search position-absolute top-50 end-0 translate-middle-y me-3 text-secondary"></i>
                        </div>
                    </form>
                </div>
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