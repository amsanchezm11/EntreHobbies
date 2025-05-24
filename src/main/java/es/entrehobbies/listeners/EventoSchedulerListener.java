package es.entrehobbies.listeners;

import es.entrehobbies.DAO.EventoDAO;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.*;

@WebListener
public class EventoSchedulerListener implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newSingleThreadScheduledExecutor();

        Runnable tarea = new Runnable() {
            @Override
            public void run() {
                EventoDAO eventoDAO = new EventoDAO();

                Date ahora = new Date();
                Date fechaSinHora = truncateTime(ahora);
                // Actualizamos los eventos que van a empezar
                eventoDAO.actualizarEventosEnCurso(fechaSinHora);
                // Actualizamos los eventos que han terminado
                eventoDAO.actualizarEventosFinalizados(fechaSinHora);

                System.out.println("Scheduler: Actualización completada.");
            }
        };

        // Calculamos el delay hasta la próxima ejecución diaria a las 00:00
        long delayInicial = calcularDelayHastaHora(0, 0);
        // Periodo de 24H (1 día). Va a ser el tiempo que tiene que esperar para volverse a ejecutar
        long periodo = TimeUnit.DAYS.toSeconds(1);
        // Indicamos que se ejecute por primera vez tras el delayInicial y luego, cada 24 horas(periodo)
        scheduler.scheduleAtFixedRate(tarea, delayInicial, periodo, TimeUnit.SECONDS);
        // Enviamos un mensaje para llevar el control en la terminal
        System.out.println("Scheduler iniciado: Primera ejecución en " + delayInicial + " segundos.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null) {
            scheduler.shutdownNow();
            System.out.println("Scheduler detenido.");
        }
    }

    /**
     * Calcula el número de segundos que faltan desde el momento actual
     * hasta la próxima ocurrencia de la hora y minuto especificados.
     * Si ya pasó esa hora hoy, calcula el delay hasta mañana.
     *
     * @param hora    Hora del día (0-23)
     * @param minuto  Minuto de la hora (0-59)
     * @return        Delay en segundos hasta la próxima ejecución
     */
    private long calcularDelayHastaHora(int hora, int minuto) {
        Calendar ahora = Calendar.getInstance();
        Calendar proximaEjecucion = (Calendar) ahora.clone();

        proximaEjecucion.set(Calendar.HOUR_OF_DAY, hora);
        proximaEjecucion.set(Calendar.MINUTE, minuto);
        proximaEjecucion.set(Calendar.SECOND, 0);
        proximaEjecucion.set(Calendar.MILLISECOND, 0);

        // Si ya pasó la hora de hoy, programa para mañana
        if (proximaEjecucion.before(ahora)) {
            proximaEjecucion.add(Calendar.DAY_OF_MONTH, 1);
        }

        return (proximaEjecucion.getTimeInMillis() - ahora.getTimeInMillis()) / 1000;
    }


    /**
     * Elimina la parte de hora, minutos, segundos y milisegundos de una fecha,
     * dejando solo la parte correspondiente a la fecha (00:00:00.000).
     *
     * @param fecha  Fecha original con hora
     * @return       Fecha truncada a medianoche
     */
    private Date truncateTime(Date fecha) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(fecha);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
}


