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
                List<Product> products = new ArrayList<>();
                List<Category> categories = new ArrayList<>();

                try (Connection conn = dataSource.getConnection()) {

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


                    req.setAttribute("products", products);
                    req.setAttribute("categories", categories);


                    req.getRequestDispatcher("/products.jsp").forward(req, resp);

                } catch (SQLException e) {
                    e.printStackTrace();
                    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
                }
            }
}
