package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.dto.CategoryDTO;
import lk.ijse.eplatform.dto.ProductDTO;
import lk.ijse.eplatform.entity.Category;
import lk.ijse.eplatform.entity.Product;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet",value = "/home")
public class HomeServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<CategoryDTO> categories = new ArrayList<>();
//        List<ProductDTO> products = new ArrayList<>();
//
//        try (Connection connection = dataSource.getConnection()) {
//            // Fetch Categories
//            String categoryQuery = "SELECT category_id, category_name, description FROM categories";
//            try (PreparedStatement categoryStmt = connection.prepareStatement(categoryQuery);
//                 ResultSet categoryRs = categoryStmt.executeQuery()) {
//
//                while (categoryRs.next()) {
//                    CategoryDTO category = new CategoryDTO();
//                    category.setCategoryId(categoryRs.getInt("category_id"));
//                    category.setCategoryName(categoryRs.getString("category_name"));
//                    category.setDescription(categoryRs.getString("description"));
//                    categories.add(category);
//                }
//            }
//
//            // Fetch Products
//            String productQuery = "SELECT product_id, product_name, product_description, product_price, product_quantity, category_id, image_path FROM products";
//            try (PreparedStatement productStmt = connection.prepareStatement(productQuery);
//                 ResultSet productRs = productStmt.executeQuery()) {
//
//                while (productRs.next()) {
//                    ProductDTO product = new ProductDTO();
//                    product.setProduct_id(productRs.getInt("product_id"));
//                    product.setProductName(productRs.getString("product_name"));
//                    product.setProductDescription(productRs.getString("product_description"));
//                    product.setProductPrice(productRs.getDouble("product_price"));
//                    product.setProductQuantity(productRs.getInt("product_quantity"));
//                    product.setCategory_id(productRs.getInt("category_id"));
//                    product.setImage_path(productRs.getString("image_path"));
//                    products.add(product);
//                }
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        // Attach data to the request
//        req.setAttribute("categories", categories);
//        req.setAttribute("products", products);
//
//        // Forward the request to the JSP page
//        req.getRequestDispatcher("/index.jsp").forward(req, resp);
//    }
//
//}
                List<Product> products = new ArrayList<>();
                List<Category> categories = new ArrayList<>();

                try (Connection conn = dataSource.getConnection()) {
                    // Fetch categories
                    String categoryQuery = "SELECT * FROM categories";
                    try (PreparedStatement categoryStmt = conn.prepareStatement(categoryQuery);
                         ResultSet categoryRs = categoryStmt.executeQuery()) {
                        while (categoryRs.next()) {
                            categories.add(new Category(
                                    categoryRs.getInt("id"),
                                    categoryRs.getString("name"),
                                    categoryRs.getString("description")
                            ));
                        }
                    }

                    // Fetch products
                    String productQuery = "SELECT id, name, price, image_url, category_id FROM products";
                    try (PreparedStatement productStmt = conn.prepareStatement(productQuery);
                         ResultSet productRs = productStmt.executeQuery()) {
                        while (productRs.next()) {
                            products.add(new Product(
                                    productRs.getInt("id"),
                                    productRs.getString("name"),
                                    productRs.getDouble("price"),
                                    productRs.getString("image_url"),
                                    productRs.getInt("category_id")
                            ));
                        }
                    }

                    // Set attributes for JSP
                    req.setAttribute("products", products);
                    req.setAttribute("categories", categories);

                    // Forward to JSP
                    req.getRequestDispatcher("/products.jsp").forward(req, resp);

                } catch (SQLException e) {
                    e.printStackTrace();
                    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
                }
            }
}
