package es.entrehobbies.controllers;

import com.google.gson.Gson;
import es.entrehobbies.DAO.IEventoDAO;
import es.entrehobbies.DAO.ISubcategoriaDAO;
import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.models.Utilities;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

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
        List<Object[]> eventosFiltrados = null;
        String provincia;
        String idSubcategoriaStr;
        Integer idSubcategoria;
        Integer idProvincia;
        int idCategoria;
        // Variables DAO
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();
        ISubcategoriaDAO daoS = daoF.getSubcategoriaDAO();
        IEventoDAO daoE = daoF.getEventoDAO();
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

            case "comprobar-password":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Recibimos los parámetros del usuario y la contraseña actual
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                String password = request.getParameter("password");

                // Comprobamos si la contraseña es correcta
                boolean correcta = daoU.comprobarPassword(idUsuario, Utilities.md5(password));

                // Creamos la respuesta JSON con el resultado
                jsonResponse = new JSONObject();
                jsonResponse.put("correcta", correcta);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(jsonResponse.toString());
                break;


            case "obtenerSubcategorias":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el idCategoria que se ha seleccionado
                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));

                // Obtenemos todas las subcategorías de la categoría indicada (idCategoria)
                List<Object[]> subcategorias = daoS.getAllSubcategoriasOrdenadas(idCategoria);

                List<Map<String, Object>> jsonSubcategorias = new ArrayList<>();
                for (Object[] sub : subcategorias) {
                    Map<String, Object> map = new HashMap<>();
                    map.put("id", sub[0]);
                    map.put("nombre", sub[1]);
                    jsonSubcategorias.add(map);
                }

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(jsonSubcategorias));
                break;

            case "estadisticas-categorias":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el total de eventos por categoría
                List<Object[]> resultados = daoE.getNumeroEventosPorCategoria();

                Map<String, Long> mapaCategorias = new LinkedHashMap<>();
                for (Object[] fila : resultados) {
                    String categoria = (String) fila[0];
                    Long total = (Long) fila[1];
                    mapaCategorias.put(categoria, total);
                }

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(mapaCategorias));
                break;

            case "Eventos-mes":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el año actual del sistema
                int anioActual = Calendar.getInstance().get(Calendar.YEAR);

                // Llamamos al DAO  de Eventos para obtener los datos junto al mapa con los 12 meses
                Map<String, Long> mapaMeses = daoE.getNumeroEventosPorMes(anioActual);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(mapaMeses));
                break;

            case "Usuarios-mes":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el año actual del sistema
                int anioUsuarios = Calendar.getInstance().get(Calendar.YEAR);

                // Obtenemos los datos de usuarios junto al mapa con los 12 meses
                Map<String, Long> mapaUsuariosMes = daoU.getNumeroUsuariosPorMes(anioUsuarios);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(mapaUsuariosMes));
                break;

            case "Usuarios-sexo":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el total de usuarios por sexo
                Map<String, Long> usuariosPorSexo = daoU.getNumeroUsuariosPorSexo();

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(usuariosPorSexo));
                break;
            case "Provincias-activas":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el top 5 de provincias con más eventos
                List<Object[]> provinciasActivas = daoE.getTop5ProvinciasConMasEventos();

                List<Map<String, Object>> listaProvincias = new ArrayList<>();
                for (Object[] fila : provinciasActivas) {
                    Map<String, Object> datos = new HashMap<>();
                    datos.put("provincia", fila[0]);
                    datos.put("totalEventos", fila[1]);
                    listaProvincias.add(datos);
                }

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(listaProvincias));
                break;

            case "Top-usuarios-eventos":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el top 5 de usuarios con más eventos
                List<Object[]> topUsuarios = daoE.getTop5UsuariosConMasEventos();

                List<Map<String, Object>> listaUsuarios = new ArrayList<>();
                for (Object[] fila : topUsuarios) {
                    Map<String, Object> datos = new HashMap<>();
                    datos.put("username", fila[0]);
                    datos.put("totalEventos", fila[1]);
                    listaUsuarios.add(datos);
                }

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(listaUsuarios));
                break;

            case "Categorias-activas":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el top 5 de categorías con más eventos
                List<Object[]> categoriasActivas = daoE.getTop5CategoriasConMasEventos();

                List<Map<String, Object>> listaCategorias = new ArrayList<>();
                for (Object[] fila : categoriasActivas) {
                    Map<String, Object> datos = new HashMap<>();
                    datos.put("categoria", fila[0]);
                    datos.put("totalEventos", fila[1]);
                    listaCategorias.add(datos);
                }

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(listaCategorias));
                break;

            case "Subcategorias-activas":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos el top 5 de subcategorías con más eventos
                List<Object[]> subcategoriasActivas = daoE.getTop5SubcategoriasConMasEventos();

                List<Map<String, Object>> listaSubcategorias = new ArrayList<>();
                for (Object[] fila : subcategoriasActivas) {
                    Map<String, Object> datos = new HashMap<>();
                    datos.put("subcategoria", fila[0]);
                    datos.put("totalEventos", fila[1]);
                    listaSubcategorias.add(datos);
                }

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(listaSubcategorias));
                break;

            case "Buscar-Eventos-Usuario":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Obtenemos los parámetros
                String filtro = request.getParameter("filtro");
                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                usuario = (Usuario) request.getSession().getAttribute("usuario");

                // Obtenemos los eventos filtrados
                eventosFiltrados = daoE.buscarEventosPorTextoYCategoria(filtro, idCategoria, usuario.getIdUsuario());

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(eventosFiltrados));
                break;

            case "Buscar-Eventos-No-User":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                String busqueda = request.getParameter("filtro");
                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));

                List<Object[]> eventosPublicosFiltrados = daoE.buscarEventosPublicosPorTextoYCategoria(busqueda, idCategoria);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(eventosPublicosFiltrados));
                break;

            case "Filtro-Evento-No-User":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                idProvincia = (request.getParameter("provincia") != null && !request.getParameter("provincia").trim().isEmpty())
                        ? Integer.parseInt(request.getParameter("provincia"))
                        : null;
                idSubcategoriaStr = request.getParameter("idSubcategoria");
                idSubcategoria = (idSubcategoriaStr != null && !idSubcategoriaStr.trim().isEmpty())
                        ? Integer.parseInt(idSubcategoriaStr)
                        : null;

                eventosFiltrados = daoE.filtrarEventosPublicos(idCategoria, idSubcategoria, idProvincia);

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(eventosFiltrados));
                break;

            case "Filtro-Eventos-Usuario":
                /* Configuramos el tipo de contenido y la codificación de la respuesta
                para que admita caracteres especiales */
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
                idSubcategoriaStr = request.getParameter("idSubcategoria");
                idProvincia = (request.getParameter("provincia") != null && !request.getParameter("provincia").trim().isEmpty())
                        ? Integer.parseInt(request.getParameter("provincia"))
                        : null;

                usuario = (Usuario) request.getSession().getAttribute("usuario");

                idSubcategoria = (idSubcategoriaStr != null && !idSubcategoriaStr.trim().isEmpty())
                        ? Integer.parseInt(idSubcategoriaStr)
                        : null;

                List<Object[]> eventosFiltradosUsuario = daoE.filtrarEventosPorSubcategoriaYProvinciaLogueado(idCategoria,idSubcategoria,idProvincia,usuario.getIdUsuario());

                // Escribimos la respuesta JSON al cliente
                response.getWriter().write(new Gson().toJson(eventosFiltradosUsuario));
                break;

        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}