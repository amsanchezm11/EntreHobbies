package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.models.Utilities;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {


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
        String usernameMail = request.getParameter("username");
        String password = request.getParameter("password");
        Usuario usuario = null;


        DAOFactory daoF = DAOFactory.getDAOFactory();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();

        switch (accion) {
            case "Login":
                // Comprobamos si el usuario ha introducido username o email
                if (usernameMail.contains("@")){
                    usuario = daoU.getUsuarioPorEmail(usernameMail, Utilities.md5(password));
                }else{
                    usuario = daoU.getUsuarioPorUsername(usernameMail, Utilities.md5(password));
                }

                // En caso de encontrar el usuario lo añadimos a la sesión
                if (usuario != null){
                    request.getSession().setAttribute("usuario", usuario);
                }else{
                    request.setAttribute("error", "Contraseña incorrecta");
                    url = "/JSP/LOGIN/login.jsp";
                }
                break;

                case "Logout":
                    // Eliminamos al usuario de la sesión en caso de que exista
                    if (request.getSession().getAttribute("usuario") != null){
                        request.getSession().removeAttribute("usuario");
                    }
                break;
        }

        // Redirigimos al usuario a la url correspondiente
        request.getRequestDispatcher(url).forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}