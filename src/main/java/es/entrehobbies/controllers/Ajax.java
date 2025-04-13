package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Usuario;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Ajax", value = "/Ajax")
public class Ajax extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // En caso de entrar por doGet redirigimos al usuario a la página principal
        request.getRequestDispatcher(".").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        Usuario usuario = null;

        DAOFactory daoF = DAOFactory.getDAOFactory();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();

        JSONObject jsonResponse = null;
        String jsonRespuesta = null;

        switch (accion){

            case "comprobar-username":

                  /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos el username que queremos comprobar
                String username = request.getParameter("usernameComprobar");

                // En caso de que la respuesta sea true es que existe ya un username en la Base de datos
                if (daoU.comprobarUsername(username)) {
                    jsonRespuesta = "Si";
                } else {
                    jsonRespuesta = "No";
                }

                // Creamos la respuesta JSON
                jsonResponse = new JSONObject();
                jsonResponse.put("disponible", jsonRespuesta);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(jsonResponse.toString());

                break;

            case "comprobar-email":

                  /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos el correo que queremos comprobar
                String email = request.getParameter("emailComprobar");

                // En caso de que la respuesta sea true es que existe ya un username en la Base de datos
                if (daoU.comprobarEmail(email)) {
                    jsonRespuesta = "Si";
                } else {
                    jsonRespuesta = "No";
                }

                // Creamos la respuesta JSON
                jsonResponse = new JSONObject();
                jsonResponse.put("disponible", jsonRespuesta);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(jsonResponse.toString());

                break;
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}