package es.entrehobbies.controllers;

import es.entrehobbies.beans.Usuario;

import java.io.IOException;
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
