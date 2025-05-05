package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IEventoDAO;
import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Categoria;
import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Subcategoria;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.models.EnumConverter;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EventoController", value = "/EventoController")
public class EventoController extends HttpServlet {

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
        String url = ".";
        String accion = null;
        Usuario creador = null;
        Evento evento = null;
        Categoria categoria = null;
        Subcategoria subcategoria = null;
        DateConverter converter = null;

        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IGenericoDAO daoG = daoF.getGenericoDAO();
        IEventoDAO daoE = daoF.getEventoDAO();

        switch (accion) {
            case "Crear-Evento":

                // Convertimos la fecha y el enum antes de utilizar BeansUtils
                converter = new DateConverter();
                converter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(converter, java.util.Date.class);
                ConvertUtils.register(new EnumConverter(), Evento.Estado.class);
                ConvertUtils.register(new EnumConverter(), Evento.ModoEvento.class); // ¿Borrar?

                try {
                    // Obtenemos el usuario creador de la sesión
                    creador = (Usuario) request.getSession().getAttribute("usuario");
                    // Inicializamos evento, categoria y subcategoria
                    evento = new Evento();
                    categoria = new Categoria();
                    subcategoria = new Subcategoria();
                    // Rellenamos los datos de evento que vienen del formulario con BeansUtils
                    BeanUtils.populate(subcategoria, request.getParameterMap());
                    BeanUtils.populate(categoria, request.getParameterMap());
                    BeanUtils.populate(evento, request.getParameterMap());

                    // Le añadimos al evento su usuario creador
                    evento.setCreador(creador);
                    // Añadimos al evento su estado y modo
                    evento.setEstado(Evento.Estado.Por_Empezar);
                    evento.setModo(Evento.ModoEvento.Comunitario);
                    // Le añadimos la fecha de hoy en su fecha de creación
                    evento.setFechaCreacion(new Date());
                    // Añadimos la categoria y sub categoria al evento
                    subcategoria.setCategoria(categoria);
                    evento.setSubcategoria(subcategoria);

                    // Comprobamos si es el primer evento que se va a insertar en la lista del creador
                    if (creador.getEventosCreados() == null){
                        creador.setEventosCreados(new ArrayList<Evento>());
                    }
                    // Añadimos el evento a la lista de eventos creados del usuario
                    creador.getEventosCreados().add(evento);
                    // Añadimos el evento a la base de datos
                    daoG.insertOrUpdate(evento);

                } catch (IllegalAccessException | InvocationTargetException e) {
                    Logger.getLogger(Subcategoria.class.getName()).log(Level.SEVERE, null, e);
                    Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, e);
                    Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, e);
                }


                break;
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


}