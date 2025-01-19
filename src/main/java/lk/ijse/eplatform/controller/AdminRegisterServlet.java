package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AdminRegisterServlet",value = "/admin-register-servlet")
public class AdminRegisterServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("user_name");
        String plainPassword = req.getParameter("password");
        String email = req.getParameter("email");
        String role = req.getParameter("role");
        String status = req.getParameter("status");


        String phone = role.equals("admin") ? req.getParameter("phone") : null;
        String address = role.equals("admin") ? req.getParameter("address") : null;

        // Encrypt the password
        String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO users (user_name, password, email, phone, address, role, status) VALUES (?, ?, ?, ?, ?, ?,?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, userName);
                preparedStatement.setString(2, hashedPassword);

                // Set email with debugging
                if (email != null && !email.trim().isEmpty()) {
                    preparedStatement.setString(3, email);

                } else {
                    preparedStatement.setNull(3, java.sql.Types.VARCHAR);
                }

                // Set phone
                if (phone != null && !phone.trim().isEmpty()) {
                    preparedStatement.setString(4, phone);
                } else {
                    preparedStatement.setNull(4, java.sql.Types.VARCHAR);
                }

                // Set address
                if (address != null && !address.trim().isEmpty()) {
                    preparedStatement.setString(5, address);
                } else {
                    preparedStatement.setNull(5, java.sql.Types.VARCHAR);
                }

                preparedStatement.setString(6, role);
                preparedStatement.setString(7, status);

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    if ("admin".equalsIgnoreCase(role)) {
                        resp.sendRedirect("admin.jsp?message=Admin registered successfully!");
                    } else {
                        resp.sendRedirect("index.jsp?message=Customer registered successfully!");
                    }
                } else {
                    resp.sendRedirect("signin.jsp?error=Registration failed. Please try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
