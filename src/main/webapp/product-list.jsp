
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.eplatform.dto.ProductDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 900px;
            margin-top: 40px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 30px;
        }

        .btn {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        table {
            border-collapse: collapse;
        }

        th {
            text-align: center;
        }

        .alert-warning {
            border-radius: 8px;
            font-size: 1rem;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <form action="admin.jsp" class="mb-3">
        <button type="submit" class="btn btn-secondary">Home</button>
    </form>

    <h1>Product Management</h1>

    <%
        List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("productList");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Category ID</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (ProductDTO productDTO : dataList) {
            %>
            <tr>
                <td class="text-center"><%= productDTO.getProduct_id() %></td>
                <td><%= productDTO.getProductName() %></td>
                <td><%= productDTO.getProductDescription() %></td>
                <td class="text-end">LKR <%= String.format("%.2f", productDTO.getProductPrice()) %></td>
                <td class="text-center"><%= productDTO.getProductQuantity() %></td>
                <td class="text-center"><%= productDTO.getCategory_id() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <form action="product.jsp" class="text-center mt-4">
        <button type="submit" class="btn btn-primary">Add, Update, or Delete Product</button>
    </form>
    <% } else { %>
    <div class="alert alert-warning mt-4" role="alert">
        No products available.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
