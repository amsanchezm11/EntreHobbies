package es.entrehobbies.DAOFactory;

import es.entrehobbies.DAO.GenericoDAO;
import es.entrehobbies.DAO.IGenericoDAO;
import es.entrehobbies.DAO.IUsuarioDAO;
import es.entrehobbies.DAO.UsuarioDAO;

/**
 * Fábrica concreta para la fuente de datos MySQL
 * @author alberto
 */
public class MySQLDAOFactory extends DAOFactory{



    @Override
    public IUsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO();
    }

    @Override
    public IGenericoDAO getGenericoDAO() {
        return new GenericoDAO();
    }
}
