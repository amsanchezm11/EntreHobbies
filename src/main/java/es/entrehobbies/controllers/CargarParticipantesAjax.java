package es.entrehobbies.controllers;

import com.google.gson.Gson;
import es.entrehobbies.DAO.EventoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CargarParticipantesAjax", value = "/CargarParticipantesAjax")
public class CargarParticipantesAjax extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Variables
        String idEventoText = request.getParameter("idEvento");
        int idEvento = Integer.parseInt(idEventoText);
        PrintWriter out;
        Gson gson;

        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        EventoDAO dao = new EventoDAO();

        // Obtenemos los participantes del evento de la base de datos a partir de su idEvento
        List<Object[]> participantes = dao.getParticipantesDeUnEvento(idEvento);

        // Creamos una lista JSON con username y avatar
        List<Map<String, String>> participantesJson = new ArrayList<>();
        for (Object[] fila : participantes) {
            String username = (String) fila[0];
            String avatar = (String) fila[1];

            Map<String, String> datos = new HashMap<>();
            datos.put("nombre", username);
            datos.put("avatar", avatar != null ? avatar : "IMG/AVATARES/avatar.svg");

            participantesJson.add(datos);
        }

        // Devolvemos el JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        out = response.getWriter();
        gson = new Gson();
        out.print(gson.toJson(participantesJson));
        out.flush();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}