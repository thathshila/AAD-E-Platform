//package lk.ijse.eplatform.bo;
//
//
//import lk.ijse.eplatform.bo.impl.ProductBOImpl;
//
//public class BoFactory {
//    private static BoFactory boFactory;
//
//    private BoFactory() {
//    }
//
//    public static BoFactory getBoFactory() {
//        return boFactory == null ? boFactory = new BoFactory() : boFactory;
//    }
//
//
//    public enum BoType {
//        PRODUCT
//    }
//
//    public SuperBO getBoType(BoType boType) {
//        switch (boType) {
//            case PRODUCT:
//                return new ProductBOImpl();
//            default:
//                return null;
//        }
//    }
//}
package lk.ijse.eplatform.bo;


import lk.ijse.eplatform.bo.impl.ProductBOImpl;

import javax.sql.DataSource;

public class BoFactory {
    private static BoFactory boFactory;

    private BoFactory() {
    }

    public static BoFactory getBoFactory() {
        if (boFactory == null) {
            boFactory = new BoFactory();
        }
        return boFactory;
    }

    public enum BoType {
        PRODUCT
    }

    public SuperBO getBoType(BoType boType, DataSource dataSource) {
        switch (boType) {
            case PRODUCT:
                return new ProductBOImpl(dataSource);
            default:
                return null;
        }
    }
}
