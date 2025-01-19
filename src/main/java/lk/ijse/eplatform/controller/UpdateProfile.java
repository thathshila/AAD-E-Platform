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
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name ="UpdateProfile",value = "/update-profile")
public class UpdateProfile extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId")); // Assuming user ID is passed in the form (or fetched from session)
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");

        // SQL Update Query
        String updateQuery = "UPDATE users SET username = ?, email = ?, address = ?, password = ? WHERE user_id = ?";

        try (Connection conn = dataSource.getConnection()) {
            try (PreparedStatement stmt = conn.prepareStatement(updateQuery)) {
                // Set the values for the SQL statement
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, address);
                stmt.setString(4, password); // Consider hashing the password before saving
                stmt.setInt(5, userId);

                // Execute the update query
                int rowsUpdated = stmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // If the update was successful, redirect to the profile page
                    resp.sendRedirect("profilePage.jsp");
                } else {
                    // If no rows were updated, show an error message
                    req.setAttribute("errorMessage", "Profile update failed. Please try again.");
                    req.getRequestDispatcher("profileUpdate.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Database error: " + e.getMessage());
            req.getRequestDispatcher("profileUpdate.jsp").forward(req, resp);
        }
    }
    }

