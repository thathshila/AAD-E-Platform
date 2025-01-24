package lk.ijse.eplatform.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.eplatform.dto.CartItemDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();

        // Get the cart from session or initialize it
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("add".equalsIgnoreCase(action) || action == null) {
            // Retrieve product details from the request
            int productId = Integer.parseInt(req.getParameter("product_id"));
            String productName = req.getParameter("product_name");
            double productPrice = Double.parseDouble(req.getParameter("product_price"));
            int quantity = Integer.parseInt(req.getParameter("product_quantity"));

            // Check if product already exists in the cart
            boolean itemExists = false;
            for (CartItemDTO item : cart) {
                if (item.getProductId() == productId) {
                    // Update quantity and subtotal
                    item.setQuantity(item.getQuantity() + quantity);
                    item.setSubtotal(item.getQuantity() * item.getProductPrice());
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists) {
                // Create a new cart item
                CartItemDTO cartItem = new CartItemDTO(
                        productId, productName, productPrice, quantity, productPrice * quantity
                );
                cart.add(cartItem);
            }

            // Save cart back to the session
            session.setAttribute("cart", cart);
        } else if ("update".equalsIgnoreCase(action)) {
            // Update cart item quantity
            int productId = Integer.parseInt(req.getParameter("product_id"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            for (CartItemDTO item : cart) {
                if (item.getProductId() == productId) {
                    item.setQuantity(quantity);
                    item.setSubtotal(item.getProductPrice() * quantity);
                    break;
                }
            }

            session.setAttribute("cart", cart);
        } else if ("remove".equalsIgnoreCase(action)) {
            // Remove item from the cart
            int productId = Integer.parseInt(req.getParameter("product_id"));
            cart.removeIf(item -> item.getProductId() == productId);

            session.setAttribute("cart", cart);
        }

        // Redirect to the cart page
        resp.sendRedirect("add-cart.jsp");
    }
}
