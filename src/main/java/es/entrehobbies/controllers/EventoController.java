package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IEventoDAO;
import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Categoria;
import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Subcategoria;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.models.EnumConverter;
import es.entrehobbies.models.Utilities;
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
        String url = "/JSP/USUARIO/menuUsuario.jsp";
        String accion = request.getParameter("accion");
        Usuario creador = null;
        Evento evento = null;
        Evento eventoModificado = null;
        Categoria categoria = null;
        Subcategoria subcategoria = null;
        DateConverter converter = null;
        int idEvento;
        String modificarTipo = null;

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
                    // Añadimos la categoria y subcategoria al evento
                    subcategoria.setCategoria(categoria);
                    evento.setSubcategoria(subcategoria);
                    // Añadimos el evento a la base de datos
                    daoG.insertOrUpdate(evento);
                    // Notificamos al usuario que ha creado el evento correctamente
                    request.setAttribute("aviso", "Evento creado correctamente");

                } catch (IllegalAccessException | InvocationTargetException e) {
                    Logger.getLogger(Subcategoria.class.getName()).log(Level.SEVERE, null, e);
                    Logger.getLogger(Categoria.class.getName()).log(Level.SEVERE, null, e);
                    Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, e);
                }
                break;

            case "Cancelar-Evento":
                // Obtenemos el id del evento que se va a cancelar
                idEvento = Integer.parseInt(request.getParameter("idEvento"));
                // Obtenemos el evento de la base de datos por el id obtenido
                evento = (Evento) daoG.getById(idEvento, Evento.class);
                // Ponemos su estado en 'Cancelado'
                evento.setEstado(Evento.Estado.Cancelado);
                // Aplicamos la modificación en la base de datos
                daoG.insertOrUpdate(evento);
                // Comprobamos si habia participantes en el evento
                if (evento.getParticipantes().size()>0){
                    // Enviamos los emails de que el evento ha sido cancelado a los participantes del evento
                    Utilities.enviarEmailCanceladoAParticipantes(evento.getParticipantes(),"Evento cancelado",evento.getCreador().getUsername(),evento.getTitulo());
                }
                request.setAttribute("aviso", "Se ha cancelado el evento correctamente");
                break;

            case "Modificar-Evento":
                modificarTipo = request.getParameter("Modificacion");
                // Obtenemos el evento original de la sesión
                evento = (Evento) request.getSession().getAttribute("evento");
                // Convertimos la fecha y el enum antes de utilizar BeansUtils
                converter = new DateConverter();
                converter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(converter, java.util.Date.class);
                ConvertUtils.register(new EnumConverter(), Evento.Estado.class);

                try {

                    // Inicializamos evento, categoria y subcategoria
                    eventoModificado = new Evento();
                    categoria = new Categoria();
                    subcategoria = new Subcategoria();
                    // Obtenemos los datos modificados de evento que vienen del formulario con BeansUtils
                    BeanUtils.populate(eventoModificado, request.getParameterMap());
                    // Le añadimos al evento su usuario creador
                    eventoModificado.setCreador(evento.getCreador());
                    // Añadimos al evento su estado y modo
                    eventoModificado.setEstado(evento.getEstado());
                    eventoModificado.setModo(evento.getModo());
                    // Le añadimos la fecha de hoy en su fecha de creación
                    eventoModificado.setFechaCreacion(evento.getFechaCreacion());
                    // Le añadimos la subcategoría
                    eventoModificado.setSubcategoria(evento.getSubcategoria());
                    // Comprobamos el tipo de modificación (Parcial = tiene participantes)
                    if (modificarTipo.equals("Parcial")){
                        eventoModificado.setParticipantes(evento.getParticipantes());
                        // Notificamos a todos los participantes que el evento ha sido modificado
                        Utilities.enviarEmailEventoModificadoAParticipantes("EntreHobbies: Evento Modificado",eventoModificado);
                    }
                    // Añadimos el evento a la base de datos
                    daoG.insertOrUpdate(eventoModificado);
                    //Eliminamos el evento de la sesión
                    request.getSession().removeAttribute("evento");
                    // Notificamos al usuario que ha creado el evento correctamente
                    request.setAttribute("aviso", "Evento modificado correctamente");

                } catch (IllegalAccessException | InvocationTargetException e) {
                    Logger.getLogger(Evento.class.getName()).log(Level.SEVERE, null, e);
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