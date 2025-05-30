package es.entrehobbies.controllers;

import com.google.gson.Gson;
import es.entrehobbies.DAO.CategoriaDAO;
import es.entrehobbies.DAO.ICategoriaDAO;
import es.entrehobbies.DAOFactory.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CargarAllCategoriasAjax", value = "/CargarAllCategoriasAjax")
public class CargarAllCategoriasAjax extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAOFactory daoF = DAOFactory.getDAOFactory();
        ICategoriaDAO daoC = daoF.getCategoriaDAO();

        List<Map<String, Object>> lista = daoC.getAllCategoriasResumen();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        new Gson().toJson(lista, response.getWriter());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
