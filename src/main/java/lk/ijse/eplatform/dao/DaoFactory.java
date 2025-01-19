//package lk.ijse.eplatform.dao;
//
//import lk.ijse.eplatform.dao.custom.impl.ProductDAOImpl;
//
//
//
//public class DaoFactory {
//    private static DaoFactory daoFactory;
//
//    private DaoFactory() {
//    }
//
//
//    public static DaoFactory getDaoFactory() {
//        if (daoFactory == null) {
//            daoFactory = new DaoFactory();
//        }
//        return daoFactory;
//    }
//
//    public enum DaoType {
//        PRODUCT
//    }
//
//    // Updated method to use generics for type safety
//    public SuperDAO getDaoType(DaoType daoType) {
//        switch (daoType) {
//            case PRODUCT:
//                return  new ProductDAOImpl();
//            default:
//                return null;
//        }
//    }
//}
package lk.ijse.eplatform.dao;

import lk.ijse.eplatform.dao.custom.impl.ProductDAOImpl;

import javax.sql.DataSource;

public class DaoFactory {
    private static DaoFactory daoFactory;
    private DataSource dataSource;

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
                return new ProductDAOImpl(dataSource);
            default:
                return null;
        }
    }
}
