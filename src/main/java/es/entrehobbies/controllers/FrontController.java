package es.entrehobbies.controllers;

import es.entrehobbies.DAO.ICategoriaDAO;
import es.entrehobbies.DAO.IEventoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
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
        List<Object[]> listaObjetos = null;

        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        //IGenericoDAO daoG = daoF.getGenericoDAO();
        ICategoriaDAO daoC = daoF.getCategoriaDAO();
        IEventoDAO daoE = daoF.getEventoDAO();

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
                url = "/JSP/USUARIO/registroUsuario.jsp";
                break;
            case "Mi-Cuenta":
                url = "/JSP/USUARIO/perfilUsuario.jsp";
                break;
            case "Ver-Estadisticas":
                url = "/JSP/ADMIN/estadisticasAdministrador.jsp";
                break;
            case "Dashboard":
                url = "/JSP/ADMIN/dashboard.jsp";
                break;
            case "Mis-Eventos":
                user = (Usuario) request.getSession().getAttribute("usuario");
                listaObjetos = daoE.getAllEventosUsuariosOrdenadosCrono(user.getIdUsuario());
                if (listaObjetos != null) {
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/USUARIO/eventosUsuario.jsp";
                } else {
                    url = "/JSP/AVISOS/noEventos.jsp";
                }
                break;
            case "Sobre-Nosotros":
                url = "/JSP/INFO/sobreNosotros.jsp";
                break;
            case "Crear-Evento":
                // Obtenemos las categorias para los eventos
                listaObjetos = daoC.getAllCategoriasOrdenadas();
                // Comprobamos que la lista venga can datos y redireccionamos según el resultado obtenido
                if (listaObjetos != null) {
                    request.setAttribute("categorias", listaObjetos);
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
                if (listaObjetos != null) {
                    request.setAttribute("categorias", listaObjetos);
                    url = "/JSP/EVENTO/categorias.jsp";
                } else {
                    request.setAttribute("error", "No se han encontrado categorías");
                    url = "/JSP/ERRORES/error500.jsp";
                }
                break;
            case "Ver-Eventos":
                // Obtenemos el idCategoria que el usuario ha seleccionado
                int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                // Obtenemos el nombre de la categoria
                String nombreCategoria = daoC.getNombreCategoriaPorId(idCategoria);
                // Recogemos todos los eventos de dicha categoría
                listaObjetos = daoE.getAllEventosPorCategoriaOrdenados(idCategoria);
                if (listaObjetos != null && !listaObjetos.isEmpty()) {
                    request.setAttribute("categoria",nombreCategoria);
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/EVENTO/verEventos.jsp";
                } else {
                    request.setAttribute("categoria",nombreCategoria);
                    url = "/JSP/AVISOS/noEventos.jsp";
                }
                break;
            case "Eventos-Apuntados":
                user = (Usuario) request.getSession().getAttribute("usuario");
                listaObjetos = daoE.getEventosDondeParticipaUsuario(user.getIdUsuario());
                if (listaObjetos != null) {
                    request.setAttribute("eventos", listaObjetos);
                    url = "/JSP/USUARIO/verEventosParticipado.jsp";
                } else {
                    request.setAttribute("error", "No se han encontrado eventos");
                    url = "/JSP/ERRORES/error500.jsp";
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
