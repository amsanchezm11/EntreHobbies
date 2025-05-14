package es.entrehobbies.controllers;

import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAOFactory.DAOFactory;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.models.EnumConverter;
import es.entrehobbies.models.Utilities;
import es.entrehobbies.utils.EnviarCorreos;
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

import static es.entrehobbies.models.Utilities.generarMensajeBienvenida;

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
        String passwordActual = null;
        String passwordNueva = null;
        String confirmPassword = null;
        Usuario usuario = null;
        Usuario usuarioModificado = null;
        DateConverter converter = null;


        // DAOs
        DAOFactory daoF = DAOFactory.getDAOFactory();
        IGenericoDAO daoG = daoF.getGenericoDAO();
        IUsuarioDAO daoU = daoF.getUsuarioDAO();

        // Avatar
        String dirImagen = request.getServletContext().getRealPath("/IMG/AVATARES/");
        StringBuilder nombreFichero = new StringBuilder();
        String filePath = null;
        Part filePart = null;

        // Correos
        String destinatario = null;
        String asunto = null;
        String cuerpo = null;

        switch (accion) {
            case "Registrar":

                // Convertimos la fecha y el enum antes de utilizar BeansUtils
                converter = new DateConverter();
                converter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(converter, java.util.Date.class);
                ConvertUtils.register(new EnumConverter(), Usuario.Rol.class);
                ConvertUtils.register(new EnumConverter(), Usuario.Sexo.class);

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
                    // Gestionamos el enviar correo de bienvenida
                    // Obtenemos el email del nuevo usuario
                    destinatario = usuario.getEmail();
                    // Configuramos el asunto del mensaje
                    asunto = "Bienvenido a EntreHobbies";
                    // Configuramos el cuerpo del mensaje
                    cuerpo = cuerpo = generarMensajeBienvenida(usuario.getNombre(), usuario.getUsername(), usuario.getEmail(), usuario.getSexo());
                    EnviarCorreos.enviar(destinatario, asunto, cuerpo);
                    // Gestionamos el avatar del usuario
                    // Obtenemos la imagen de avatar del input type file
                    filePart = request.getPart("avatar");
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
            case "Actualizar-datos":

                // Recuperamos el usuario de la sesión
                usuario = (Usuario) request.getSession().getAttribute("usuario");
                // Convertimos la fecha y el enum antes de utilizar BeansUtils
                converter = new DateConverter();
                converter.setPattern("yyyy-MM-dd");
                ConvertUtils.register(converter, java.util.Date.class);
                //ConvertUtils.register(new EnumConverter(), Usuario.Rol.class);

                try {
                    usuarioModificado = new Usuario();
                    // Rellenamos los datos de usuario que vienen del formulario con BeansUtils
                    BeanUtils.populate(usuarioModificado, request.getParameterMap());
                    // Añadimos el id al usuario modificado
                    usuarioModificado.setIdUsuario(usuario.getIdUsuario());
                    // Añadimos la contraseña al usuario modificado
                    usuarioModificado.setPassword(usuario.getPassword());
                    // Le añadimos su rol correspondiente
                    usuarioModificado.setRol(usuario.getRol());
                    // Le añadimos su sexo
                    usuarioModificado.setSexo(usuario.getSexo());
                    // Aplicamos el avatar que ya tenía el usuario
                    usuarioModificado.setAvatar(usuario.getAvatar());
                    // Actualizamos su ultimo acceso
                    //usuario.setUltimoAcceso(Date.valueOf(LocalDate.now()));
                    // Lo añadimos a la base de datos
                    daoG.insertOrUpdate(usuarioModificado);
                    // Añadimos el usuario a la sesión
                    request.getSession().setAttribute("usuario", usuarioModificado);
                    // Notificamos que se ha hecho el registro correctamente
                    request.setAttribute("aviso", "Datos modificados correctamente");
                    // Actualizamos la url para redirigir al usuario a su perfil
                    url = "/JSP/USUARIO/perfilUsuario.jsp";

                } catch (IllegalAccessException | InvocationTargetException e) {
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, e);
                }
                break;

            case "Actualizar-password":

                // Recuperamos el usuario de la sesión
                usuario = (Usuario) request.getSession().getAttribute("usuario");

                passwordActual = request.getParameter("passwordActual");
                passwordNueva = request.getParameter("nuevaPassword");
                confirmPassword = request.getParameter("confirmPassword");

                // Comprobamos que la contraseña actual proporcionada sea la misma que la de la base de datos
                if (usuario.getPassword().equals(Utilities.md5(passwordActual))) {
                    // Comprobamos que la nueva contraseña sea distinta a la contraseña actual
                    if (!passwordNueva.equals(passwordActual)) {
                        // Comprobamos que el confirmar contraseña sea igual a la contraseña nueva
                        if (confirmPassword.equals(passwordNueva)) {
                            // Aplicamos la nueva contraseña cifrada con md5 al usuario
                            usuario.setPassword(Utilities.md5(passwordNueva));
                            // Modificamos el usuario en la base de datos
                            daoG.insertOrUpdate(usuario);
                            request.setAttribute("aviso", "Contraseña modificada correctamente");
                        } else {
                            request.setAttribute("error", "Confirmar contraseña no coincide con la contraseña nueva");
                        }

                    } else {
                        request.setAttribute("error", "La contraseña nueva debe ser distinta a la actual");
                    }
                } else {
                    request.setAttribute("error", "La contraseña actual no es correcta");
                }

                url = "/JSP/USUARIO/perfilUsuario.jsp";
                break;

            case "Actualizar-avatar":

                // Recuperamos el usuario de la sesión
                usuario = (Usuario) request.getSession().getAttribute("usuario");
                // Obtenemos el nuevo avatar
                filePart = request.getPart("avatar");
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
                        // Modificamos el avatar en la base de datos
                        daoG.insertOrUpdate(usuario);
                        request.setAttribute("aviso", "Avatar actualizado correctamente");
                    }
                }
                url = "/JSP/USUARIO/perfilUsuario.jsp";
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