package es.entrehobbies.DAO;

import java.util.List;
import java.util.Map;

public interface ICategoriaDAO {

    public List<Object[]> getAllCategoriasOrdenadas();

    public List<Object[]> getAllCategoriasOrdenadasConImg();

    public String getNombreCategoriaPorId(int idCategoria);

    public List<Map<String, Object>> getAllCategoriasResumen();
}
