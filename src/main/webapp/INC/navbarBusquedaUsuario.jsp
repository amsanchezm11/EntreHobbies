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
            <form id="formBuscador" class="d-flex" role="search" action="${contexto}/Ajax" method="post">
                <div class="position-relative w-100">
                    <input type="hidden" id="categoriaId" name="categoria" value="${requestScope.categoriaId}">
                    <input id="buscador" name="filtro" class="form-control pe-5"
                           type="search"
                           title="Buscar eventos"
                           placeholder="Buscar"
                           aria-label="Buscar" autocomplete="off">
                    <i class="bi bi-search position-absolute top-50 end-0 translate-middle-y me-3 text-secondary"></i>
                </div>
            </form>
        </div>
        <div class="dropdown">
            <a class="nav-link perfil-colaborador dropdown-toggle d-flex align-items-center gap-2 color-pm pe-2" href="#" role="button" data-bs-toggle="dropdown"
               aria-expanded="false">
                <img src="${contexto}/IMG/AVATARES/${empty sessionScope.usuario.avatar ? 'avatar.svg' : sessionScope.usuario.avatar}"
                     alt="Avatar"
                     class="rounded-circle ${sessionScope.usuario.avatar eq 'avatar.svg' ? '' : 'border-img'}"
                     style="width: 30px; height: 30px; object-fit: cover;"
                     onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">
                ${sessionScope.usuario.username}
            </a>
            <ul class="dropdown-menu dropdown-menu-end" style="z-index: 1050;">
                <li>
                    <form action="${contexto}/FrontController" method="post">
                        <button class="dropdown-item" name="accion" value="Mi-Cuenta">Mi Cuenta</button>
                    </form>
                </li>
                <li>
                    <form action="${contexto}/FrontController" method="post">
                        <button class="dropdown-item" name="accion" value="Mis-Eventos">Mis Eventos</button>
                    </form>
                </li>
                <li>
                    <form action="${contexto}/FrontController" method="post">
                        <button class="dropdown-item" name="accion" value="Mis-Participaciones">Mis Participaciones</button>
                    </form>
                </li>
                <li>
                    <form action="${contexto}/Login" method="post">
                        <button class="dropdown-item" name="accion" value="Logout">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>