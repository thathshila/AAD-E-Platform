
package lk.ijse.eplatform.dao;

import lk.ijse.eplatform.dao.custom.impl.ProductDAOImpl;
import javax.sql.DataSource;

public class DaoFactory {
    private static DaoFactory daoFactory;

    private final DataSource dataSource;

    private DaoFactory(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public static DaoFactory getDaoFactory(DataSource dataSource) {
        if (daoFactory == null) {
            daoFactory = new DaoFactory(dataSource);
        }
        return daoFactory;
    }

    public enum DaoType {
        PRODUCT
    }

    public SuperDAO getDaoType(DaoType daoType) {
        switch (daoType) {
            case PRODUCT:
                return new ProductDAOImpl(dataSource); // Pass the DataSource
            default:
                return null;
        }
    }
}
