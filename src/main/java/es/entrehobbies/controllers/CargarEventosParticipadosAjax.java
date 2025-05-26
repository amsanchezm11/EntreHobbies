package es.entrehobbies.controllers;

import com.google.gson.Gson;
import es.entrehobbies.DAO.IEventoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CargarEventosParticipadosAjax", value = "/CargarEventosParticipadosAjax")
public class CargarEventosParticipadosAjax extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        int idUsuario = usuario.getIdUsuario();

        DAOFactory daoF = DAOFactory.getDAOFactory();
        IEventoDAO daoE = daoF.getEventoDAO();

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        List<Object[]> lista = daoE.getEventosResumenPorUsuarioParticipados(idUsuario);

        List<Map<String, Object>> jsonList = new ArrayList<>();

        for (Object[] fila : lista) {
            Map<String, Object> map = new HashMap<>();

            map.put("idEvento", fila[0]);
            map.put("titulo", fila[1]);
            map.put("descripcion", fila[2]);
            map.put("fechaInicio", sdf.format(fila[3]));
            map.put("fechaFin", sdf.format(fila[4]));
            map.put("localidad", fila[5]);
            map.put("provincia", fila[6]);
            map.put("creador", fila[7]);
            map.put("categoria", fila[8]);
            map.put("subcategoria", fila[9]);
            map.put("modo", fila[10].toString());
            map.put("estado", fila[11].toString().replace('_', ' '));
            map.put("totalParticipantes", fila[12]);
            map.put("numParticipantes", fila[13]);
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