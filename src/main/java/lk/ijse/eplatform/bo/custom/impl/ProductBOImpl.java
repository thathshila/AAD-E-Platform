//package lk.ijse.eplatform.bo.custom.impl;
//
//import lk.ijse.eplatform.bo.custom.ProductBO;
//import lk.ijse.eplatform.dto.ProductDTO;
//
//import javax.sql.DataSource;
//
//public class ProductBOImpl implements ProductBO {
//
//    @Override
//    public void saveProduct(ProductDTO productDTO, DataSource dataSource) {
//
//    }
//
//    @Override
//    public void updateProduct(ProductDTO productDTO, DataSource dataSource) {
//
//    }
//
//    @Override
//    public void deleteProduct(int id, DataSource dataSource) {
//
//    }
//}
package lk.ijse.eplatform.bo.impl;

import lk.ijse.eplatform.bo.custom.ProductBO;


import lk.ijse.eplatform.dao.DaoFactory;
import lk.ijse.eplatform.dao.custom.ProductDAO;

import lk.ijse.eplatform.dao.custom.impl.ProductDAOImpl;
import lk.ijse.eplatform.dto.ProductDTO;
import lk.ijse.eplatform.entity.Product;



import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class ProductBOImpl implements ProductBO {
    private final ProductDAO productDAO;

    public ProductBOImpl(DataSource dataSource) {
        this.productDAO = (ProductDAO) DaoFactory.getDaoFactory(dataSource).getDaoType(DaoFactory.DaoType.PRODUCT);
    }
//ProductDAO productDAO = (ProductDAO) DaoFactory.getDaoFactory().getDaoType(DaoFactory.DaoType.PRODUCT);
   // DaoFactory daoFactory = DaoFactory.getDaoFactory(dataSource);

    // Example: Obtain ProductDAO
 //   ProductDAO productDAO = (ProductDAO) daoFactory.getDaoType(DaoFactory.DaoType.PRODUCT);
@Override
public void saveProduct(ProductDTO productDTO, DataSource dataSource) throws Exception {
    System.out.println("saveProduct");
//    ProductDAO productDAO = new ProductDAOImpl(dataSource);
    // Convert ProductDTO to Product entity
    Product product = new Product(
           1,
            productDTO.getProductName(),
            productDTO.getProductDescription(),
            productDTO.getProductPrice(),
            productDTO.getProductQuantity(),
            productDTO.getCategory_id()
    );
    productDAO.save(product); // Delegate to DAO
}

    @Override
    public void updateProduct(ProductDTO productDTO, DataSource dataSource) throws SQLException {
      //  ProductDAO productDAO = new ProductDAOImpl(dataSource);
        Product product =new Product(
                1,
                productDTO.getProductName(),
                productDTO.getProductDescription(),
                productDTO.getProductPrice(),
                productDTO.getProductQuantity(),
                productDTO.getCategory_id()
        );
        productDAO.update(product);
    }

    @Override
    public void deleteProduct(int productId, DataSource dataSource) throws SQLException {
        ProductDAO productDAO = new ProductDAOImpl(dataSource);
        productDAO.delete(productId);

    }

}
