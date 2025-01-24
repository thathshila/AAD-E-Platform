<%--
  Created by IntelliJ IDEA.
  User: Thathshila
  Date: 1/24/2025
  Time: 5:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.CartItemDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        .checkout-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .summary-card {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .place-order-btn {
            background-color: #28a745;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
        }

        .place-order-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="checkout-container">
        <h1 class="text-center mb-4">Checkout</h1>
        <form action="order-confirmation.jsp" method="post">
            <div class="row">
                <!-- Billing Details -->
                <div class="col-md-6">
                    <h3>Billing Details</h3>
                    <div class="mb-3">
                        <label for="billingName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="billingName" name="billingName" required>
                    </div>
                    <div class="mb-3">
                        <label for="billingEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="billingEmail" name="billingEmail" required>
                    </div>
                    <div class="mb-3">
                        <label for="billingPhone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="billingPhone" name="billingPhone" required>
                    </div>
                    <div class="mb-3">
                        <label for="billingAddress" class="form-label">Address</label>
                        <textarea class="form-control" id="billingAddress" name="billingAddress" rows="3" required></textarea>
                    </div>
                </div>

                <!-- Shipping Details -->
                <div class="col-md-6">
                    <h3>Shipping Details</h3>
                    <div class="mb-3">
                        <label for="shippingName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="shippingName" name="shippingName" required>
                    </div>
                    <div class="mb-3">
                        <label for="shippingPhone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="shippingPhone" name="shippingPhone" required>
                    </div>
                    <div class="mb-3">
                        <label for="shippingAddress" class="form-label">Address</label>
                        <textarea class="form-control" id="shippingAddress" name="shippingAddress" rows="3" required></textarea>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="row mt-4">
                <div class="col-12">
                    <h3>Order Summary</h3>
                    <div class="summary-card">
                        <%
                            List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                            double total = 0;
                            if (cart != null) {
                                for (CartItemDTO item : cart) {
                                    total += item.getSubtotal();
                        %>
                        <div class="d-flex justify-content-between mb-3">
                            <span><%= item.getProductName() %> (x<%= item.getQuantity() %>)</span>
                            <span>LKR <%= item.getSubtotal() %></span>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <p>Your cart is empty.</p>
                        <%
                            }
                        %>
                        <hr>
                        <div class="d-flex justify-content-between">
                            <h4>Total:</h4>
                            <h4 class="text-primary">LKR <%= total %></h4>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Place Order Button -->
            <div class="text-end mt-4">
                <button type="submit" class="place-order-btn">Place Order</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

