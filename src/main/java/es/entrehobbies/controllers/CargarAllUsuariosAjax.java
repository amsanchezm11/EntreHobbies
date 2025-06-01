package es.entrehobbies.controllers;

import com.google.gson.Gson;
import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAOFactory.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CargarAllUsuariosAjax", value = "/CargarAllUsuariosAjax")
public class CargarAllUsuariosAjax extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IUsuarioDAO daoU =  daoF.getUsuarioDAO();

        List<Object[]> lista = daoU.getAllUsuariosResumen();

        List<Map<String, Object>> jsonList = new ArrayList<>();

        for (Object[] fila : lista) {
            Map<String, Object> map = new HashMap<>();
            map.put("idUsuario", fila[0]);
            map.put("nombre", fila[1]);
            map.put("apellidos", fila[2]);
            map.put("username", fila[3]);
            map.put("email", fila[4]);
            map.put("telefono", fila[5]);
            map.put("fechaNacimiento", fila[6]);
            map.put("localidad", fila[7]);
            map.put("provincia", fila[8]);
            map.put("avatar", fila[9]);
            map.put("eventosCreados", fila[10]);
            map.put("eventosParticipados", fila[11]);
            jsonList.add(map);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(jsonList, response.getWriter());

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