package lk.ijse.eplatform.bo.custom.impl;

import lk.ijse.eplatform.bo.custom.ProductBO;
import lk.ijse.eplatform.dao.DaoFactory;
import lk.ijse.eplatform.dao.custom.ProductDAO;
import lk.ijse.eplatform.dto.ProductDTO;
import lk.ijse.eplatform.entity.Product;

import javax.sql.DataSource;
import java.sql.Connection;

public class ProductBOImpl implements ProductBO {

    private final ProductDAO productDAO;

    public ProductBOImpl(DaoFactory daoFactory) {
        this.productDAO = (ProductDAO) daoFactory.getDaoType(DaoFactory.DaoType.PRODUCT);
    }

    @Override
    public void saveProduct(ProductDTO productDTO, DataSource dataSource) {
        try (Connection connection = dataSource.getConnection()) {
            Product product = new Product(
                    0,
                    productDTO.getProductName(),
                    productDTO.getProductDescription(),
                    productDTO.getProductPrice(),
                    productDTO.getProductQuantity(),
                    productDTO.getCategory_id(),
                    productDTO.getImage_path()
            );
            productDAO.save(product, connection);
        } catch (Exception e) {
            throw new RuntimeException("Failed to save the product", e);
        }
    }
}
