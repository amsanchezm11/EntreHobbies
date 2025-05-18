package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UsuarioEventoController", value = "/UsuarioEventoController")
public class UsuarioEventoController extends HttpServlet {


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
        Usuario user = null;
        Usuario sessionUser = null;
        Evento evento = null;

        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IGenericoDAO daoG = daoF.getGenericoDAO();

        switch (accion) {
            case "Unirse-evento":
                // Obtenemos el usuario de la sesión
                sessionUser = (Usuario) request.getSession().getAttribute("usuario");
                user = (Usuario) daoG.getById(sessionUser.getIdUsuario(), Usuario.class);
                // Obtenemos el id del evento seleccionado
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                // Obtenemos el evento de la base de datos mediante el id obtenido
                evento = (Evento) daoG.getById(idEvento, Evento.class);
                // Comprobamos si el evento tiene plazas disponibles
                if (evento.getNumParticipantes() == evento.getParticipantes().size()) {
                    request.setAttribute("error", "Lo sentimos, este evento ha alcanzado el límite de participantes.");
                } else {
                    // Comprobamos que el usuario no sea el creador del evento
                    if (user.getIdUsuario() != evento.getCreador().getIdUsuario()) {
                        // Comprobamos que el evento no esté ya en la lista
                        if (!user.getEventosParticipados().contains(evento)) {
                            // Añadimos el usuario al evento
                            user.getEventosParticipados().add(evento);
                            // Realizamos el update del usuario en la base de datos
                            daoG.insertOrUpdate(user);
                            request.setAttribute("aviso", "Te has unido al evento correctamente");
                        } else {
                            request.setAttribute("error", "Ya estás inscrito en este evento");
                        }
                    } else {
                        request.setAttribute("error", "No puedes unirte a tu propio evento");
                    }
                }

                break;

            case "Desapuntarse-evento":
                sessionUser = (Usuario) request.getSession().getAttribute("usuario");
                user = (Usuario) daoG.getById(sessionUser.getIdUsuario(), Usuario.class);
                int idEventoDesapuntar = Integer.parseInt(request.getParameter("idEvento"));
                evento = (Evento) daoG.getById(idEventoDesapuntar, Evento.class);

                if (user.getEventosParticipados().contains(evento)) {
                    user.getEventosParticipados().remove(evento);
                    daoG.insertOrUpdate(user);
                    request.setAttribute("aviso", "Te has desapuntado del evento correctamente");
                } else {
                    request.setAttribute("error", "No estás inscrito en este evento");
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