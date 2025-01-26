//package lk.ijse.eplatform.controller;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//@WebServlet(name = "SignInServlet", value = "/SignInServlet")
//public class SignInServlet extends HttpServlet {
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // Get email and password from the form
//        String email = req.getParameter("email");
//        String password = req.getParameter("password");
//
//        try (Connection connection = dataSource.getConnection()) {
//            // Query to validate user credentials
//            String query = "SELECT user_id, email FROM users WHERE email = ? AND password = ?";
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setString(1, email);
//            stmt.setString(2, password);
//
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                // User authenticated successfully
//                int userId = rs.getInt("id");
//                String userEmail = rs.getString("email");
//
//                // Create session and store user details
//                HttpSession session = req.getSession();
//                session.setAttribute("userId", userId);
//                session.setAttribute("userEmail", userEmail);
//
//                // Redirect to the home page or dashboard
//                resp.sendRedirect("check-out.jsp");
//            } else {
//                // Authentication failed, redirect to login page with an error message
//                req.setAttribute("errorMessage", "Invalid email or password");
//                req.getRequestDispatcher("signin.jsp").forward(req, resp);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during sign-in.");
//        }
//    }
//}
//
//package lk.ijse.eplatform.controller;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//@WebServlet(name = "SignInServlet", value = "/SignInServlet")
//public class SignInServlet extends HttpServlet {
//    @Resource(name = "java:comp/env/jdbc/pool")
//    private DataSource dataSource;
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // Retrieve email and password from the form
//        String email = req.getParameter("email");
//        String password = req.getParameter("password");
//
//        try (Connection connection = dataSource.getConnection()) {
//            // Query to validate user credentials
//            String query = "SELECT user_id, email FROM users WHERE email = ? AND password = ?";
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setString(1, email);
//            stmt.setString(2, password);
//
//            ResultSet rs = stmt.executeQuery();
//
//            if (rs.next()) {
//                // User authenticated successfully
//                int userId = rs.getInt("user_id");
//                String userEmail = rs.getString("email");
//
//                // Create session and store user details
//                HttpSession session = req.getSession();
//                session.setAttribute("userId", userId);
//                session.setAttribute("userEmail", userEmail);
//                session.setMaxInactiveInterval(1800); // Session timeout: 30 minutes
//
//                // Redirect to the checkout page
//                resp.sendRedirect("check-out.jsp");
//            } else {
//                // Authentication failed, redirect to signin.jsp with an error message
//                req.setAttribute("errorMessage", "Invalid email or password");
//                req.getRequestDispatcher("signin.jsp").forward(req, resp);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            req.setAttribute("errorMessage", "An error occurred. Please try again later.");
//            req.getRequestDispatcher("signin.jsp").forward(req, resp);
//        }
//    }
//}

package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.eplatform.dto.UserDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SignInServlet", value = "/SignInServlet")
public class SignInServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");


        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT user_id, user_name FROM users WHERE email = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                int userId = rs.getInt("user_id");
                String userName = rs.getString("user_name");

                UserDTO userDTO = new UserDTO(userId, userName,email);

                HttpSession session = req.getSession();
                session.setAttribute("user", userDTO);
                System.out.println("User ID: " + userId);
                System.out.println("Session set: User ID = " + userDTO.getUserId() + ", User Name = " + userDTO.getUserName());

                resp.sendRedirect("view-profile.jsp");
            } else {

                req.setAttribute("errorMessage", "Email not found. Please try again.");
                req.getRequestDispatcher("signin.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during sign-in.");
        }
    }
}


