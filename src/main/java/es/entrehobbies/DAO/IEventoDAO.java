package es.entrehobbies.DAO;

import es.entrehobbies.beans.Evento;
import es.entrehobbies.beans.Usuario;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IEventoDAO {

    public List<Object[]> getAllEventosPorCategoriaOrdenados(int idCategoria);

    public List<Object[]> getAllEventosUsuariosOrdenadosCrono(int idUsuario);

    public List<Object[]> getEventosDondeParticipaUsuario(int idUsuario);

    public List<Object[]> getNumeroEventosPorCategoria();

    public Map<String, Long> getNumeroEventosPorMes(int anio);

    public List<Object[]> getTop5ProvinciasConMasEventos();

    public List<Object[]> getTop5UsuariosConMasEventos();

    public List<Object[]> getTop5CategoriasConMasEventos();

    public List<Object[]> getTop5SubcategoriasConMasEventos();

    public List<Object[]> getParticipantesDeUnEvento(int idEvento);

    public List<Object[]> getAllEventosPorCategoriaOrdenadosUserLogueado(int idCategoria, int idUsuario);

    public Evento getEventoCompletoPorId(int idEvento);

    public List<Object[]> getAllEventosResumen();

    public void actualizarEventosEnCurso(Date fecha);

    public void actualizarEventosFinalizados(Date fecha);

    public List<Object[]> getAllEventosParticipadosOrdenadosPorFechaInicio(Usuario usuario);


}
