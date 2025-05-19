package es.entrehobbies.models;

import es.entrehobbies.beans.Usuario;
import es.entrehobbies.utils.EnviarCorreos;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

    public static String generarMensajeBienvenida(String nombre, String username, String email, Usuario.Sexo sexo) {

        // Determinamos el saludo según el sexo del usuario
        String saludo;
        if (sexo == Usuario.Sexo.Mujer) {
            saludo = "¡Bienvenida";
        } else {
            saludo = "¡Bienvenido";
        }

        // Configuramos el cuerpo del mensaje que se le va a enviar al usuario cuando se registre
        return String.format(
                "<html lang='es'>" +
                        "<head>" +
                        "    <meta charset='UTF-8'>" +
                        "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
                        "    <title>Bienvenida a EntreHobbies</title>" +
                        "    <style>" +
                        "        body {" +
                        "            font-family: Arial, sans-serif;" +
                        "            padding: 20px;" +
                        "            background-color: #6F42C1;" +
                        "        }" +
                        "        .contenedor {" +
                        "            background-color: #ffffff;" +
                        "            padding: 30px;" +
                        "            border-radius: 10px;" +
                        "            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);" +
                        "            max-width: 600px;" +
                        "            margin: auto;" +
                        "        }" +
                        "        h2 { color: #2c3e50; }" +
                        "        p { color: #555555; font-size: 16px; }" +
                        "        .credenciales {" +
                        "            background-color: #f9f9f9;" +
                        "            padding: 15px;" +
                        "            border-radius: 5px;" +
                        "            margin-top: 20px;" +
                        "            border: 1px solid #ddd;" +
                        "        }" +
                        "        .credenciales p {" +
                        "            margin: 5px 0;" +
                        "        }" +
                        "        strong {" +
                        "            color: #6c5ce7;" +
                        "        }" +
                        "        .copy {" +
                        "            margin-top: 50px;" +
                        "            text-align: center;" +
                        "        }" +
                        "    </style>" +
                        "</head>" +
                        "<body>" +
                        "    <div class='contenedor'>" +
                        "        <h2>" + saludo + " a EntreHobbies, %s!</h2>" +
                        "        <p>Nos alegra mucho que te unas a nuestra comunidad. En EntreHobbies, queremos que disfrutes al máximo de tus pasatiempos, conectes con personas con intereses similares y vivas experiencias únicas.</p>" +
                        "        <p>A partir de ahora, podrás crear eventos según tus hobbies favoritos y unirte a actividades que te apasionen. ¡Las posibilidades son infinitas!</p>" +
                        "        <div class='credenciales'>" +
                        "            <h3>Aquí tienes tus credenciales de acceso:</h3>" +
                        "            <p><strong>Username:</strong> %s</p>" +
                        "            <p><strong>Email:</strong> %s</p>" +
                        "        </div>" +
                        "        <p>Si tienes alguna duda o necesitas ayuda, no dudes en ponerte en contacto con nosotros a través de nuestro correo electrónico: <strong>entrehobbies.info@gmail.com</strong>. Estamos aquí para ayudarte.</p>" +
                        "        <p>Disfruta de la experiencia y bienvenido a la comunidad. ¡Nos encanta tenerte con nosotros!</p>" +
                        "        <p>— El equipo de EntreHobbies</p>" +
                        "        <p class='copy'>&copy; 2025 EntreHobbies - Todos los derechos reservados.</p>" +
                        "    </div>" +
                        "</body>" +
                        "</html>", nombre, username, email
        );
    }

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
                        "                <p><strong>Creador:</strong> %s</p>" +
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

}
