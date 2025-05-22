<aside class="sidebar bg-gradient-morado-blanco">
    <div class="d-flex flex-column align-items-center justify-content-center gap-2 mb-5">
        <img src="${contexto}/IMG/AVATARES/${sessionScope.usuario.avatar}" class="rounded-circle mb-2" alt="Foto de perfil" width="100" height="100">
        <h5 class="text-white">Administrador</h5>
    </div>
    <form action="${contexto}/FrontController" method="post">
        <button type="submit" name="accion" value="Dashboard" class="btn text-white text-start w-100">Dashboard</button>
    </form>
    <form action="${contexto}/FrontController" method="post">
        <button type="submit" name="accion" value="Ver-AllUsuarios" class="btn text-white text-start w-100">Gesti&oacute;n de Usuarios</button>
    </form>
    <form action="${contexto}/FrontController" method="post">
        <button type="submit" name="accion" value="Ver-AllEventos" class="btn text-white text-start w-100">Gesti&oacute;n de Eventos</button>
    </form>
    <form action="${contexto}/FrontController" method="post">
        <button type="submit" name="accion" value="Ver-AllCategorias" class="btn text-white text-start w-100">Gesti&oacute;n de Categor&iacute;as</button>
    </form>
    <form action="${contexto}/FrontController" method="post">
        <button type="submit" name="accion" value="Ver-Estadisticas" class="btn text-white text-start w-100">Estad&iacute;sticas Generales</button>
    </form>
    <form action="${contexto}/Login" method="post">
        <button type="submit" name="accion" value="Logout" class="btn text-white text-start w-100">Cerrar sesi&oacute;n</button>
    </form>
</aside>