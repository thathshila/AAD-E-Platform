package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
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
@WebServlet(name = "CategoryName", value ="/category-name")
public class CategoryName extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;


    private List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        String query = "SELECT category_name FROM categories";  // Adjust the query if necessary

        try (Connection connection = dataSource.getConnection();

             // Add debug log in getCategories method to check the connection
// Use connection from DataSource
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                String categoryName = rs.getString("category_name");
                categories.add(categoryName);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Log the categories to ensure they are fetched correctly
        System.out.println("Categories fetched: " + categories.size());

        return categories;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch categories from the database
        List<String> categories = getCategories();

        // Log the categories to check
        System.out.println("Fetched categories: " + categories);

        // If no categories found, initialize an empty list to avoid NullPointerException
        if (categories == null || categories.isEmpty()) {
            categories = new ArrayList<>();
        }

        // Set categories in the request attribute
        request.setAttribute("categories", categories);

        // Forward to the JSP page to display the form
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }
}
