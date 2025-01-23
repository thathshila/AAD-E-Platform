package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Category", value = "/category")
public class Category extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> categoryNames = new ArrayList<>(); // List to hold category names

        try (Connection connection = dataSource.getConnection();
             Statement stm = connection.createStatement();
             ResultSet rst = stm.executeQuery("SELECT category_name FROM categories")) {

            // Fetch category names from the result set and add them to the list
            while (rst.next()) {
                categoryNames.add(rst.getString("category_name")); // Corrected to getString
            }

            // Set the category names as a request attribute
            req.setAttribute("categories", categoryNames);

            // Forward the request to product.jsp
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            // Log error and redirect to an error page
            resp.sendRedirect("category-list.jsp?error=Failed to load categories");
        }
    }
}
