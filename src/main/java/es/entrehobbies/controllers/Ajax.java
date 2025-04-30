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

        // Variables
        String accion = request.getParameter("accion");
        Usuario usuario = null;
        String credencial = null;
        // Variables DAO
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();
        // Variables Ajax
        JSONObject jsonResponse = null;
        String jsonRespuesta = null;
        boolean existe = false;

        switch (accion) {

            case "comprobar-credencial":

                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos la credencial que queremos comprobar
                credencial = request.getParameter("credencial");

                // Comprobamos si la credencial es un username o un email y comprobamos si existe
                if (credencial.contains("@")) {
                    // Realizamos la comprobación por email
                    existe = daoU.comprobarEmail(credencial);
                } else {
                    // Realizamos la comprobación por username
                    existe = daoU.comprobarUsername(credencial);
                }

                // Creamos la respuesta JSON con el resultado obtenido
                jsonResponse = new JSONObject();
                jsonResponse.put("disponible", existe);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(jsonResponse.toString());

                break;
            case "comprobar-email":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos la credencial que queremos comprobar
                credencial = request.getParameter("email");

                // Comprobamos si existe el email en la base de datos
                existe = daoU.comprobarEmail(credencial);

                // Creamos la respuesta JSON con el resultado obtenido
                jsonResponse = new JSONObject();
                jsonResponse.put("disponible", existe);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(jsonResponse.toString());

                break;

            case "comprobar-username":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos la credencial que queremos comprobar
                credencial = request.getParameter("username");

                // Comprobamos si existe el username en la base de datos
                existe = daoU.comprobarUsername(credencial);

                // Creamos la respuesta JSON con el resultado obtenido
                jsonResponse = new JSONObject();
                jsonResponse.put("disponible", existe);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(jsonResponse.toString());

                break;

            case "comprobar-telefono":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos la credencial que queremos comprobar
                credencial = request.getParameter("telefono");

                // Comprobamos si existe el username en la base de datos
                existe = daoU.comprobarTelefono(credencial);

                // Creamos la respuesta JSON con el resultado obtenido
                jsonResponse = new JSONObject();
                jsonResponse.put("disponible", existe);

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