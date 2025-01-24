<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ page import="java.util.List"%>--%>
<%--<%@ page import="lk.ijse.eplatform.dto.CartItemDTO"%>--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lk.ijse.eplatform.dto.CartItemDTO" %>
<%@ page import="java.util.List" %>
<%--&lt;%&ndash;%>
<%--    List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }
    double subtotal = cart.stream().mapToDouble(CartItemDTO::getSubtotal).sum();
dash;%&gt;--%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .cart-summary {
            text-align: right;
        }

        .btn-remove {
            background-color: #dc3545;
            color: white;
        }

        .btn-remove:hover {
            background-color: #c82333;
        }

        .btn-update {
            background-color: #0d6efd;
            color: white;
        }

        .btn-update:hover {
            background-color: #0b5ed7;
        }

        .checkout-btn {
            background-color: #28a745;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .checkout-btn:hover {
            background-color: #218838;
            color: white;
        }

        .cart-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="cart-container">
        <h1 class="text-center mb-4">Your Shopping Cart</h1>

        <table class="table table-bordered">
            <thead class="table-dark">
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Subtotal</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    for (CartItemDTO item : cart) {
            %>
            <tr>
                <td><%= item.getProductName() %></td>
                <td>LKR <%= item.getProductPrice() %></td>
                <td>
                    <form action="cart" method="post" class="d-flex">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control me-2" style="max-width: 80px;">
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </form>
                </td>
                <td>LKR <%= item.getSubtotal() %></td>
                <td>
                    <form action="cart" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="5" class="text-center">Your cart is empty.</td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>

        <div class="cart-summary">
            <%
                double subtotal = 0;
                if (cart != null) {
                    for (CartItemDTO item : cart) {
                        subtotal += item.getSubtotal();
                    }
                }
            %>
            <h3>Subtotal: <span class="text-primary">LKR <%= subtotal %></span></h3>
            <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
