package lk.ijse.eplatform.controller;

import java.io.*;
import java.sql.Connection;

import jakarta.annotation.Resource;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import lk.ijse.eplatform.config.FactoryConfiguration;
import lombok.SneakyThrows;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.naming.InitialContext;
import javax.sql.DataSource;

@WebServlet(name = "helloServlet", value = "/hello-servlet")

public class HelloServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    private String message;

    @SneakyThrows
    public void init() {
        dataSource.getConnection();
        Session session = FactoryConfiguration.getInstance().getSession();

        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}