package es.entrehobbies.models;

import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Usuario;
import es.entrehobbies.utils.EnviarCorreos;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.List;

public class Utilities {

    /**
     * Obtiene el valor de utilizar la función MD5 de una cadena
     *
     * @param input Cadena pasada para convertir a MD5
     * @return Cadena tras la conversión
     */
    public static String md5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);

            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Genera un mensaje de bienvenida en formato HTML para un nuevo usuario de EntreHobbies.
     *
     * <p>El mensaje incluye un saludo personalizado dependiendo del sexo del usuario,
     * así como sus credenciales de acceso (username y email). Este mensaje puede utilizarse
     * para envíos por correo electrónico tras el registro.</p>
     *
     * @param nombre   el nombre del usuario que se registró.
     * @param username el nombre de usuario con el que se ha registrado.
     * @param email    la dirección de correo electrónico del usuario.
     * @param sexo     el sexo del usuario, utilizado para personalizar el saludo ("Bienvenido/a").
     * @return una cadena HTML con el contenido del mensaje de bienvenida personalizado.
     */
    public static String generarMensajeBienvenida(String nombre, String username, String email, Usuario.Sexo sexo) {
        // Configuramos el saludo según el sexo del usuario
        String saludo = (sexo == Usuario.Sexo.Mujer) ? "¡Bienvenida" : "¡Bienvenido";

        return String.format(
                "<!DOCTYPE html>" +
                        "<html lang='es'>" +
                        "<head>" +
                        "  <meta charset='UTF-8'>" +
                        "  <title>Bienvenida a EntreHobbies</title>" +
                        "</head>" +
                        "<body style='margin:0; padding:0; font-family: Arial, sans-serif; background-color: #f0f0f0;'>" +
                        "  <table align='center' cellpadding='0' cellspacing='0' width='100%%' style='padding: 20px 0;'>" +
                        "    <tr>" +
                        "      <td align='center'>" +
                        "        <table cellpadding='0' cellspacing='0' width='600' style='background-color: #ffffff; padding: 30px; border: 1px solid #ddd;'>" +
                        "          <tr>" +
                        "            <td>" +
                        "              <h2 style='color: #4b1e8a;'>" + saludo + " a EntreHobbies, %s!</h2>" +
                        "              <p style='color: #333333; font-size: 16px;'>Nos alegra mucho que te unas a nuestra comunidad. En EntreHobbies, queremos que disfrutes al máximo de tus pasatiempos, conectes con personas con intereses similares y vivas experiencias únicas.</p>" +
                        "              <p style='color: #333333; font-size: 16px;'>A partir de ahora, podrás crear eventos según tus hobbies favoritos y unirte a actividades que te apasionen. ¡Las posibilidades son infinitas!</p>" +
                        "              <div style='background-color: #f9f9f9; padding: 15px; border: 1px solid #cccccc; margin-top: 20px; border-radius: 15px;'>" +
                        "                <h3 style='color: #4b1e8a;'>Tus credenciales de acceso:</h3>" +
                        "                <p style='color: #333333; font-size: 16px;'><strong>Username:</strong> %s</p>" +
                        "                <p style='color: #333333; font-size: 16px;'><strong>Email:</strong> %s</p>" +
                        "              </div>" +
                        "              <p style='color: #333333; font-size: 16px; margin-top: 20px;'>Si tienes alguna duda o necesitas ayuda, puedes escribirnos a: <strong>entrehobbies.info@gmail.com</strong>. Estamos aquí para ayudarte.</p>" +
                        "              <p style='color: #333333; font-size: 16px;'>Disfruta de la experiencia y bienvenido a la comunidad. ¡Nos encanta tenerte con nosotros!</p>" +
                        "              <p style='color: #333333; font-size: 16px;'>— El equipo de EntreHobbies</p>" +
                        "              <p style='text-align: center; color: #999999; font-size: 13px; margin-top: 40px;'>&copy; 2025 EntreHobbies - Todos los derechos reservados.</p>" +
                        "            </td>" +
                        "          </tr>" +
                        "        </table>" +
                        "      </td>" +
                        "    </tr>" +
                        "  </table>" +
                        "</body>" +
                        "</html>",
                nombre, username, email
        );
    }

    /**
     * Genera un mensaje en formato HTML para notificar a un usuario que un evento en el que iba a participar ha sido cancelado.
     *
     * <p>El mensaje incluye un aviso personalizado con el nombre del usuario, el nombre del creador del evento
     * y el título del evento cancelado. Está diseñado para ser enviado por correo electrónico como parte de la
     * comunicación del sistema EntreHobbies.</p>
     *
     * @param nombre        el nombre del usuario que recibirá el mensaje.
     * @param creadorNombre el nombre del usuario que creó el evento cancelado.
     * @param nombreEvento  el nombre del evento que ha sido cancelado.
     * @return una cadena HTML con el contenido del mensaje de cancelación del evento.
     */
    public static String generarMensajeCancelado(String nombre, String creadorNombre, String nombreEvento) {

        return String.format(
                "<!DOCTYPE html>" +
                        "<html lang='es'>" +
                        "<head>" +
                        "  <meta charset='UTF-8'>" +
                        "  <title>Evento cancelado - EntreHobbies</title>" +
                        "</head>" +
                        "<body style='margin:0; padding:0; font-family: Arial, sans-serif; background-color: #f0f0f0;'>" +
                        "  <table align='center' cellpadding='0' cellspacing='0' width='100%%' style='padding: 20px 0;'>" +
                        "    <tr>" +
                        "      <td align='center'>" +
                        "        <table cellpadding='0' cellspacing='0' width='600' style='background-color: #ffffff; padding: 30px; border: 1px solid #ddd;'>" +
                        "          <tr>" +
                        "            <td>" +
                        "              <h2 style='color: #4b1e8a;'>¡Se ha cancelado un evento en el que ibas a participar!</h2>" +
                        "              <p style='color: #333333; font-size: 16px;'>" +
                         "Lamentamos informarte que uno de los eventos a los que te habías unido ha sido cancelado, %s. Sabemos que esto puede ser una decepción, pero esperamos que pronto encuentres nuevas actividades que te entusiasmen." +
                        "              </p>" +
                        "              <div style='background-color: #f9f9f9; padding: 15px; border: 1px solid #cccccc; margin-top: 20px; border-radius: 15px;'>" +
                        "                <h3 style='color: #4b1e8a;'>Detalles del evento cancelado:</h3>" +
                        "                <p><strong>Organizador:</strong> %s</p>" +
                        "                <p><strong>Nombre del evento:</strong> %s</p>" +
                        "              </div>" +
                        "              <p style='color: #333333; font-size: 16px; margin-top: 20px;'>" +
                        "                Si tienes cualquier duda o necesitas asistencia, escríbenos a: <strong>entrehobbies.info@gmail.com</strong>. Estaremos encantados de ayudarte." +
                        "              </p>" +
                        "              <p style='color: #333333; font-size: 16px;'>" +
                        "                Te animamos a seguir explorando y participando en otros eventos. ¡Hay muchos hobbies y personas esperándote!" +
                        "              </p>" +
                        "              <p style='color: #333333; font-size: 16px;'>— El equipo de EntreHobbies</p>" +
                        "              <p style='text-align: center; color: #999999; font-size: 13px; margin-top: 40px;'>&copy; 2025 EntreHobbies - Todos los derechos reservados.</p>" +
                        "            </td>" +
                        "          </tr>" +
                        "        </table>" +
                        "      </td>" +
                        "    </tr>" +
                        "  </table>" +
                        "</body>" +
                        "</html>", nombre, creadorNombre, nombreEvento
        );
    }

    /**
     * Envía un correo electrónico de cancelación del evento a todos los participantes registrados.
     *
     * <p>Este método recorre la lista de usuarios que estaban inscritos en un evento y les envía
     * un correo personalizado informando que dicho evento ha sido cancelado.</p>
     *
     * @param participantes lista de usuarios que participaron en el evento cancelado.
     * @param asunto        el asunto del correo electrónico.
     * @param nombreCreador el nombre del usuario que creó el evento.
     * @param nombreEvento  el nombre del evento que fue cancelado.
     */
    public static void enviarEmailCanceladoAParticipantes(List<Usuario> participantes, String asunto, String nombreCreador, String nombreEvento) {

        String destinatario;
        String cuerpo;

        // Iteramos por cada participante
        for (Usuario u : participantes) {
            // Obtenemos el email del destinatario (participante)
            destinatario = u.getEmail();
            // Creamos el cuerpo del mensaje con los datos correspondientes
            cuerpo = generarMensajeCancelado(u.getNombre(),nombreCreador, nombreEvento);
            // Enviamos el email al destinatario
            EnviarCorreos.enviar(destinatario, asunto, cuerpo);
        }
    }

    /**
     * Genera un mensaje en formato HTML para notificar a un usuario que un evento en el que participa ha sido modificado.
     *
     * <p>El mensaje incluye todos los detalles actualizados del evento, como el título, la descripción, fechas, ubicación,
     * categoría, subcategoría, tipo de evento y nombre del organizador. Está diseñado para ser enviado por correo
     * electrónico a los participantes.</p>
     *
     * @param evento el objeto {@code Evento} que contiene la información actualizada del evento modificado.
     * @param nombreParticipante el nombre del usuario participante que recibirá el mensaje.
     * @return una cadena HTML con el contenido del mensaje de modificación del evento, personalizado para el participante.
     */
    public static String generarMensajeEventoModificado(Evento evento, String nombreParticipante) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        String fechaInicioFormateada = sdf.format(evento.getFechaInicio());
        String fechaFinFormateada = sdf.format(evento.getFechaFin());

        return String.format(
                "<!DOCTYPE html>" +
                        "<html lang='es'>" +
                        "<head>" +
                        "  <meta charset='UTF-8'>" +
                        "  <title>Evento modificado - EntreHobbies</title>" +
                        "</head>" +
                        "<body style='margin:0; padding:0; font-family: Arial, sans-serif; background-color: #f0f0f0;'>" +
                        "  <table align='center' cellpadding='0' cellspacing='0' width='100%%' style='padding: 20px 0;'>" +
                        "    <tr>" +
                        "      <td align='center'>" +
                        "        <table cellpadding='0' cellspacing='0' width='600' style='background-color: #ffffff; padding: 30px; border: 1px solid #ddd;'>" +
                        "          <tr>" +
                        "            <td>" +
                        "              <h2 style='color: #4b1e8a;'>¡Uno de tus eventos ha sido modificado!</h2>" +
                        "              <p style='color: #333333; font-size: 16px;'>Hola %s, te informamos que un evento en el que estás inscrito ha sido actualizado recientemente. A continuación puedes ver los nuevos detalles:</p>" +
                        "              <div style='background-color: #f9f9f9; padding: 15px; border: 1px solid #cccccc; margin-top: 20px; border-radius: 15px;'>" +
                        "                <h3 style='color: #4b1e8a;'>Detalles del evento modificado:</h3>" +
                        "                <p><strong>Título:</strong> %s</p>" +
                        "                <p><strong>Descripción:</strong> %s</p>" +
                        "                <p><strong>Fecha de inicio:</strong> %s</p>" +
                        "                <p><strong>Fecha de fin:</strong> %s</p>" +
                        "                <p><strong>Dirección::</strong> %s</p>" +
                        "                <p><strong>Localidad:</strong> %s</p>" +
                        "                <p><strong>Provincia:</strong> %s</p>" +
                        "                <p><strong>Categoría:</strong> %s</p>" +
                        "                <p><strong>Subcategoría:</strong> %s</p>" +
                        "                <p><strong>Tipo de evento:</strong> %s</p>" +
                        "                <p><strong>Organizador:</strong> %s</p>" +
                        "              </div>" +
                        "              <p style='color: #333333; font-size: 16px; margin-top: 20px;'>Si tienes dudas sobre los cambios, puedes contactar con el organizador o escribirnos a: <strong>entrehobbies.info@gmail.com</strong>.</p>" +
                        "              <p style='color: #333333; font-size: 16px;'>Gracias por seguir compartiendo tus hobbies con nosotros.</p>" +
                        "              <p style='color: #333333; font-size: 16px;'>— El equipo de EntreHobbies</p>" +
                        "              <p style='text-align: center; color: #999999; font-size: 13px; margin-top: 40px;'>&copy; 2025 EntreHobbies - Todos los derechos reservados.</p>" +
                        "            </td>" +
                        "          </tr>" +
                        "        </table>" +
                        "      </td>" +
                        "    </tr>" +
                        "  </table>" +
                        "</body>" +
                        "</html>",
                nombreParticipante,
                evento.getTitulo(),
                evento.getDescripcion(),
                fechaInicioFormateada,
                fechaFinFormateada,
                evento.getDireccion(),
                evento.getLocalidad(),
                evento.getProvincia().getNombre(),
                evento.getSubcategoria().getCategoria().getNombre(),
                evento.getSubcategoria().getNombre(),
                evento.getModo(),
                evento.getCreador().getUsername()
        );
    }

    /**
     * Envía un correo electrónico de notificación a todos los participantes de un evento que ha sido modificado.
     *
     * <p>Este método recorre la lista de usuarios inscritos en el evento proporcionado y les envía un correo
     * personalizado con los nuevos detalles del evento.</p>
     *
     * @param asunto el asunto del correo electrónico.
     * @param evento el objeto {@code Evento} con la información actualizada del evento modificado.
     */
    public static void enviarEmailEventoModificadoAParticipantes(String asunto, Evento evento) {

        String destinatario;
        String cuerpo;

        // Iteramos por cada participante
        for (Usuario u : evento.getParticipantes()) {
            // Obtenemos el email del destinatario (participante)
            destinatario = u.getEmail();
            // Creamos el cuerpo del mensaje con los datos correspondientes
            cuerpo = generarMensajeEventoModificado(evento, u.getNombre());
            // Enviamos el email al destinatario
            EnviarCorreos.enviar(destinatario, asunto, cuerpo);
        }
    }

}
