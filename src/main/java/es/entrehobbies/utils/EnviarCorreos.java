package es.entrehobbies.utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class EnviarCorreos {

    private static final String REMITENTE = "entrehobbies.info@gmail.com";
    private static final String PASSWORD = "ytzj zadq vdok uaic";

    public static void enviar(String destinatario, String asunto, String cuerpo) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(REMITENTE, PASSWORD);
            }
        });

        try {
            Message mensaje = new MimeMessage(session);
            mensaje.setFrom(new InternetAddress(REMITENTE));
            mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinatario));
            mensaje.setSubject(asunto);

            // Configuramos el setContent para manejar HTML
            mensaje.setContent(cuerpo, "text/html; charset=utf-8");

            // Enviamos el mensaje
            Transport.send(mensaje);
            System.out.println("Correo enviado a " + destinatario);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Error al enviar el correo: " + e.getMessage());
        }
    }

}

