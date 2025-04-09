package es.entrehobbies.DAOFactory;

public abstract class DAOFactory {

    /**
     * Una clase abstracta por cada tabla de la base de datos
     *
     * @return Inteface de las operaciones a realizar con la tabla
     */

    /**
     * Fábrica abstracta
     *
     * @return Objeto de la fábrica abstracta
     */
    public static DAOFactory getDAOFactory() {

        DAOFactory daof = null;

        daof = new MySQLDAOFactory();

        return daof;
    }

}
