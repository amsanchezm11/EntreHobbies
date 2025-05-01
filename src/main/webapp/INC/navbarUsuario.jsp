<nav class="navbar bg-body-tertiary border-bottom">
    <div class="container-fluid d-flex justify-content-between align-items-center">
        <form action="${contexto}/FrontController" method="post" class="mb-0">
            <button class="navbar-brand btn btn-custom" name="accion" value="Refresh">EntreHobbies</button>
        </form>
        <c:if test="${sessionScope.usuario != null}">
            <div class="dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center gap-2 color-pm pe-2" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false">
                    <img src="${contexto}/IMG/AVATARES/${empty sessionScope.usuario.avatar ? 'avatar.svg' : sessionScope.usuario.avatar}"
                         alt="Avatar"
                         class="rounded-circle"
                         style="width: 30px; height: 30px; object-fit: cover;"
                         onerror="this.onerror=null; this.src='${contexto}/IMG/AVATARES/avatar.svg';">
                        ${sessionScope.usuario.username}
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <form action="${contexto}/FrontController" method="post">
                            <button class="dropdown-item" name="accion" value="MiCuenta">Mi Cuenta</button>
                        </form>
                    </li>
                    <li>
                        <form action="${contexto}/FrontController" method="post">
                            <button class="dropdown-item" name="accion" value="MisEventos">Mis Eventos</button>
                        </form>
                    </li>
                    <li>
                        <form action="${contexto}/Login" method="post">
                            <button class="dropdown-item" name="accion" value="Logout">Logout</button>
                        </form>
                    </li>
                </ul>
            </div>
        </c:if>
    </div>
</nav>

