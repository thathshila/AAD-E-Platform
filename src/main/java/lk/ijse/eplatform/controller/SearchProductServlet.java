package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.eplatform.dto.ProductDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SearchProductServlet", value = "/search-product")
public class SearchProductServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productName = req.getParameter("product_name");

        if (productName == null || productName.trim().isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Product name is required");
            return;
        }

        try {
            ProductDTO productDTO = getProductByName(productName);

            if (productDTO != null) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                PrintWriter out = resp.getWriter();
                out.print("{");
                out.print("\"productId\":\"" + productDTO.getProduct_id() + "\",");
                out.print("\"productName\":\"" + productDTO.getProductName() + "\",");
                out.print("\"productDescription\":\"" + productDTO.getProductDescription() + "\",");
                out.print("\"productPrice\":\"" + productDTO.getProductPrice() + "\",");
                out.print("\"productQuantity\":\"" + productDTO.getProductQuantity() + "\",");
                out.print("\"categoryId\":\"" + productDTO.getCategory_id() + "\",");
                out.print("\"imagePath\":\"" + productDTO.getImage_path() + "\"");
                out.print("}");
                out.flush();
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("Product not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while searching for the product");
        }
    }

    private ProductDTO getProductByName(String productName) throws Exception {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Get a connection from the DataSource
            connection = dataSource.getConnection();

            // Prepare the SQL query
            String query = "SELECT * FROM products WHERE product_name = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, productName);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Map the result set to ProductDTO
                return new ProductDTO(
                        resultSet.getInt("product_id"),
                        resultSet.getString("product_name"),
                        resultSet.getString("product_description"),
                        resultSet.getDouble("product_price"),
                        resultSet.getInt("product_quantity"),
                        resultSet.getInt("category_id"),
                        resultSet.getString("image_path")
                );
            }
        } finally {
            // Close resources
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        }
        return null;
    }
}
