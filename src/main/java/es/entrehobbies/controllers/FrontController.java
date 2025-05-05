package es.entrehobbies.controllers;

import es.entrehobbies.DAO.ICategoriaDAO;
import es.entrehobbies.DAO.IEventoDAO;
import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Categoria;
import es.entrehobbies.beans.Usuario;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
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
        List<Object[]> categorias = null;

        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        //IGenericoDAO daoG = daoF.getGenericoDAO();
        ICategoriaDAO daoC = daoF.getCategoriaDAO();

        switch (accion) {
            case "Refresh":
                user = (Usuario) request.getSession().getAttribute("usuario");

                if (user != null) {
                    if (user.getRol() == Usuario.Rol.Admin){
                        url = "/JSP/ADMIN/menuAdministrador.jsp";
                    }else {
                        url = ".";
                    }
                }

                break;
            case "Login":
                url = "/JSP/LOGIN/login.jsp";
                break;
            case "Registro-usuario":
                url = "/JSP/USUARIO/registroUsuario.jsp";
                break;
            case "MiCuenta":
                url = "/JSP/USUARIO/perfilUsuario.jsp";
                break;
            case "Crear-Evento":
                // Obtenemos las categorias para los eventos
                categorias = daoC.getAllCategoriasOrdenadas();
                // Comprobamos que la lista venga can datos y redireccionamos según el resultado obtenido
                if (categorias != null) {
                    request.setAttribute("categorias", categorias);
                    url = "/JSP/EVENTO/crearEvento.jsp";
                } else {
                  request.setAttribute("error", "No se han encontrado categorías");
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
