package es.entrehobbies.controllers;

import es.entrehobbies.DAO.*;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author alberto
 */
@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // En caso de entrar por doGet redirigimos al usuario a la página principal
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = ".";
        String accion = request.getParameter("accion");
        Usuario user = null;
        Evento evento = null;
        List<Object[]> listaObjetos = null;
        List<Object[]> listaProvincias = null;
        int idCategoria;
        int idEvento;
        String nombreCategoria;
        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IGenericoDAO daoG = daoF.getGenericoDAO();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();
        ICategoriaDAO daoC = daoF.getCategoriaDAO();
        IEventoDAO daoE = daoF.getEventoDAO();
        IProvinciaDAO daoP = daoF.getProvinciaDAO();

        switch (accion) {
            case "Refresh":
                user = (Usuario) request.getSession().getAttribute("usuario");

                if (user != null) {
                    if (user.getRol() == Usuario.Rol.Admin) {
                        url = "/JSP/ADMIN/dashboard.jsp";
                    } else {
                        url = "/JSP/USUARIO/menuUsuario.jsp";
                    }
                }
                break;
            case "Login":
                url = "/JSP/LOGIN/login.jsp";
                break;
            case "Registro-usuario":
                // Obtenemos las provincias para el select de provincias
                listaProvincias = daoP.getAllProvinciasOrdenadas();
                if (listaProvincias != null && !listaProvincias.isEmpty()) {
                    request.setAttribute("provincias", listaProvincias);
                    url = "/JSP/USUARIO/registroUsuario.jsp";
                } else {
                    url = "/JSP/AVISOS/noProvincias.jsp";
                }
                break;
            case "Mi-Cuenta":
                // Obtenemos las provincias para el select de provincias
                listaProvincias = daoP.getAllProvinciasOrdenadas();
                if (listaProvincias != null && !listaProvincias.isEmpty()) {
                    request.setAttribute("provincias", listaProvincias);
                    url = "/JSP/USUARIO/perfilUsuario.jsp";
                } else {
                    url = "/JSP/AVISOS/noProvincias.jsp";
                }
                break;
            case "Ver-Estadisticas":
                url = "/JSP/ADMIN/estadisticasAdministrador.jsp";
                break;
            case "Dashboard":
                url = "/JSP/ADMIN/dashboard.jsp";
                break;
            case "Sobre-Nosotros":
                url = "/JSP/INFO/sobreNosotros.jsp";
                break;
            case "Privacidad":
                url = "/JSP/INFO/politicaPrivacidad.jsp";
                break;
            case "Informacion":
                url = "/JSP/USUARIO/informacion.jsp";
                break;
            case "Mis-Eventos":
                user = (Usuario) request.getSession().getAttribute("usuario");
                listaObjetos = daoE.getAllEventosUsuariosOrdenadosCrono(user.getIdUsuario());
                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/USUARIO/eventosUsuario.jsp";
                } else {
                    url = "/JSP/AVISOS/noEventosUsuario.jsp";
                }
                break;

            case "Crear-Evento":
                // Obtenemos las categorias para los eventos
                listaObjetos = daoC.getAllCategoriasOrdenadas();
                // Obtenemos las provincias para el select de provincias
                listaProvincias = daoP.getAllProvinciasOrdenadas();
                // Comprobamos que la lista venga can datos y redireccionamos según el resultado obtenido
                if (listaObjetos != null && !listaObjetos.isEmpty()
                        && listaProvincias != null && !listaProvincias.isEmpty()) {
                    request.setAttribute("categorias", listaObjetos);
                    request.setAttribute("provincias", listaProvincias);
                    url = "/JSP/EVENTO/crearEvento.jsp";
                } else {
                    request.setAttribute("error", "No se han encontrado categorías");
                    url = "/JSP/ERRORES/error500.jsp";
                }
                break;
            case "Ver-Categorias":
                // Obtenemos todas las categorías ordenadas alfabéticamente y con imagen
                listaObjetos = daoC.getAllCategoriasOrdenadasConImg();
                // Comprobamos que la lista venga can datos y redireccionamos según el resultado obtenido
                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("categorias", listaObjetos);
                    url = "/JSP/EVENTO/categorias.jsp";
                } else {
                    request.setAttribute("error", "No se han encontrado categorías");
                    url = "/JSP/ERRORES/error500.jsp";
                }
                break;
            case "Ver-Eventos":
                // Obtenemos el idCategoria que el usuario ha seleccionado
                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                // Obtenemos el nombre de la categoria
                nombreCategoria = daoC.getNombreCategoriaPorId(idCategoria);
                // Recogemos todos los eventos de dicha categoría
                listaObjetos = daoE.getAllEventosPorCategoriaOrdenados(idCategoria);
                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("categoria", nombreCategoria);
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/EVENTO/verEventos.jsp";
                } else {
                    request.setAttribute("categoria", nombreCategoria);
                    url = "/JSP/AVISOS/noEventosCategoria.jsp";
                }
                break;
            case "Eventos-Apuntados":
                user = (Usuario) request.getSession().getAttribute("usuario");
                listaObjetos = daoE.getEventosDondeParticipaUsuario(user.getIdUsuario());
                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/USUARIO/verEventosParticipado.jsp";
                } else {
                    request.setAttribute("error", "No se han encontrado eventos");
                    url = "/JSP/ERRORES/error500.jsp";
                }
                break;
            case "Ver-AllUsuarios":
                url = "/JSP/ADMIN/verTodosUsuarios.jsp";
                break;
            case "Ver-AllEventos":
                url = "/JSP/ADMIN/verTodosEventos.jsp";
                break;
            case "Ver-AllCategorias":
                url = "/JSP/ADMIN/verTodasCategorias.jsp";
                break;
            case "Estadisticas-Usuario":
                // Obtenemos el usuario con más eventos creados
                Object[] usuarioCreador = daoU.getUsuarioConMasEventosCreados();
                request.setAttribute("usuariocreador", usuarioCreador);
                // Obtenemos el usuario con más participaciones
                Object[] usuarioParticipante = daoU.getUsuarioConMasEventosParticipados();
                request.setAttribute("usuarioparticipante", usuarioParticipante);
                Long totalUsuariosRegistrados = daoU.getTotalUsuariosRegistrados();
                request.setAttribute("totalRegistrados", totalUsuariosRegistrados);

                url = "/JSP/ADMIN/estadisticasUsuarios.jsp";

                break;

            case "Ver-Eventos-Logueado":
                // Obtenemos el usuario de la sesión
                user = (Usuario) request.getSession().getAttribute("usuario");
                // Obtenemos el idCategoria que el usuario ha seleccionado
                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                // Obtenemos el nombre de la categoria
                nombreCategoria = daoC.getNombreCategoriaPorId(idCategoria);
                // Recogemos todos los eventos de dicha categoría
                listaObjetos = daoE.getAllEventosPorCategoriaOrdenadosUserLogueado(idCategoria, user.getIdUsuario());
                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("categoria", nombreCategoria);
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/EVENTO/verEventosLogueado.jsp";
                } else {
                    request.setAttribute("categoria", nombreCategoria);
                    url = "/JSP/AVISOS/noEventosCategoriaLogueado.jsp";
                }
                break;

            case "Modificar-Evento":
                // Obtenemos el id del evento a modificar
                idEvento = Integer.parseInt(request.getParameter("idEvento"));
                evento = daoE.getEventoCompletoPorId(idEvento);
                // Obtenemos las provincias para el select de provincias
                listaProvincias = daoP.getAllProvinciasOrdenadas();
                // Comprobamos que la lista de provincias tenga datos
                if (listaProvincias != null && !listaProvincias.isEmpty()) {
                    // Pasamos la lista de provincias por petición
                    request.setAttribute("provincias", listaProvincias);
                    // Comprobamos que el evento exista en la base de datos
                    if (evento != null) {
                        // Añadimos el evento a la sesión
                        request.getSession().setAttribute("evento", evento);
                        // Comprobamos si el evento tiene o no participantes
                        if (!evento.getParticipantes().isEmpty()) {
                            /* En caso de tener participantes lo llevamos a un formulario parcial donde
                            solo modificará la dirección, fecha de inicio y fecha de fin */
                            url = "/JSP/EVENTO/modificarEventoParcial.jsp";
                        } else {
                            // Obtenemos las categorias para los eventos
                            listaObjetos = daoC.getAllCategoriasOrdenadas();
                            // Comprobamos que la lista venga con datos y redireccionamos según el resultado obtenido
                            if (listaObjetos != null && !listaObjetos.isEmpty()) {
                                request.setAttribute("categorias", listaObjetos);
                                url = "/JSP/EVENTO/modificarEvento.jsp";
                            } else {
                                request.setAttribute("error", "No se han encontrado categorías");
                                url = "/JSP/AVISOS/error500.jsp";
                            }
                        }
                    } else {
                        request.setAttribute("error", "No se han encontrado el evento");
                        url = "/JSP/AVISOS/noEventosCategoria.jsp";
                    }
                } else {
                    request.setAttribute("error", "No se han encontrado provincias.");
                    url = "/JSP/AVISOS/noProvincias.jsp";
                }
                break;
            case "Mis-Participaciones":
                user = (Usuario) request.getSession().getAttribute("usuario");
                listaObjetos = daoE.getAllEventosParticipadosOrdenadosPorFechaInicio(user);

                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/USUARIO/eventoParticipaciones.jsp";
                }else{
                    request.setAttribute("error", "No se han encontrado el evento");
                    url = "/JSP/AVISOS/noParticipaciones.jsp";
                }


                break;
        }

        // Redirigimos al usuario a la url correspondiente
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
