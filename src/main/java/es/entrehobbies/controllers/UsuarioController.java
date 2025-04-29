package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.models.EnumConverter;
import es.entrehobbies.models.Utilities;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;

@MultipartConfig
@WebServlet(name = "UsuarioController", value = "/UsuarioController")
public class UsuarioController extends HttpServlet {


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
        String accion = request.getParameter("accion");
        Usuario usuario = null;

        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IGenericoDAO daoG = daoF.getGenericoDAO();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();

        // Avatar
        String dirImagen = request.getServletContext().getRealPath("/IMG/AVATARES/");
        StringBuilder nombreFichero = new StringBuilder();
        String filePath = null;


        switch (accion) {
            case "Registrar":

                // Convertimos la fecha y el enum antes de utilizar BeansUtils
                DateConverter converter = new DateConverter();
                converter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(converter, java.util.Date.class);
                ConvertUtils.register(new EnumConverter(), Usuario.Rol.class);

                try {
                    usuario = new Usuario();
                    // Rellenamos los datos de usuario que vienen del formulario con BeansUtils
                    BeanUtils.populate(usuario, request.getParameterMap());
                    // Ciframos su contraseña con md5
                    usuario.setPassword(Utilities.md5(usuario.getPassword()));
                    // Le añadimos su rol correspondiente
                    usuario.setRol(Usuario.Rol.Colaborador);
                    // Actualizamos su ultimo acceso
                    //usuario.setUltimoAcceso(Date.valueOf(LocalDate.now()));
                    // Lo añadimos a la base de datos
                    daoG.insertOrUpdate(usuario);
                    // Gestionamos el avatar del usuario
                    // Obtenemos la imagen de avatar del input type file
                    Part filePart = request.getPart("avatar");
                    // Comprobamos que la imagen cumpla con el formato correcto
                    if (filePart.getContentType().equals("image/png") || filePart.getContentType().equals("image/jpg") || filePart.getContentType().equals("image/jpeg")) {
                        // Comprobamos que la imagen no sea mayor de 100KB(Tamaño permitido en la aplicación)
                        if (filePart.getSize() < 102400) {
                            // Obtenemos la extensión de la imagen
                            String extension = ".jpeg";
                            if (filePart.getContentType().equals("image/jpg")) {
                                extension = ".jpg";
                            }
                            if (filePart.getContentType().equals("image/png")) {
                                extension = ".png";
                            }
                            // Obtenemos el nombre del fichero
                            nombreFichero.append("AvatarN").append(String.valueOf(usuario.getIdUsuario())).append(extension);
                            filePath = dirImagen + nombreFichero.toString();
                            // Escribimos el fichero en el servidor
                            filePart.write(filePath);

                            // Modificamos el avatar en el usuario de sesión
                            usuario.setAvatar(nombreFichero.toString());
                            daoG.insertOrUpdate(usuario);
                        } else {
                            request.setAttribute("error", "Tamaño de imagen demasiado grande");
                        }
                    } else {
                        request.setAttribute("error", "Formato de imagen no permitido");
                    }

                    // Añadimos el usuario a la sesión
                    request.getSession().setAttribute("usuario", usuario);
                    // Notificamos que se ha hecho el registro correctamente
                    request.setAttribute("aviso", "Se ha registrado el usuario correctamente");


                } catch (IllegalAccessException | InvocationTargetException e) {
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, e);
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