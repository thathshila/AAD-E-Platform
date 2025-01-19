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
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "AdminLoginServlet", value = "/admin-login")
public class AdminLoginServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailOrPhone = req.getParameter("email"); // the parameter in the form
        String password = req.getParameter("password");

        try (Connection connection = dataSource.getConnection()) {
            // Query to check if the user exists with the given email or phone
            String query = "SELECT user_name , password  FROM users WHERE email = ? OR phone = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setString(1, emailOrPhone);
                ps.setString(2, emailOrPhone);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // If a record is found, compare the hashed password
                    String storedPasswordHash = rs.getString("password"); // stored hash from DB
                    if (BCrypt.checkpw(password, storedPasswordHash)) {
                        // Login successful
                        req.getSession().setAttribute("user", rs.getString("user_name")); // store user info in session
                        resp.sendRedirect("admin.jsp"); // redirect to dashboard

                    } else {
                        // Incorrect password
                        req.setAttribute("error", "Invalid credentials. Please try again.");
                        req.getRequestDispatcher("/login.jsp").forward(req, resp);
                    }
                } else {
                    // No user found with the given email/phone
                    req.setAttribute("error", "Invalid credentials. Please try again.");
                    req.getRequestDispatcher("/login.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }


    }
}
