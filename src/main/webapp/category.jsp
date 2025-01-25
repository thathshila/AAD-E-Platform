
<%@ page import="lk.ijse.eplatform.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 900px;
        }
        h1 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }
        .btn {
            border-radius: 30px;
            font-weight: bold;
            padding: 12px 24px;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        .btn-danger {
            background: linear-gradient(45deg, #ff4a4a, #ff6161);
            border: none;
            color: white;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #e04343, #f35454);
        }
        .btn-primary {
            background: linear-gradient(45deg, #4285f4, #6ea4f4);
            border: none;
            color: white;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #357ae8, #578cf2);
        }
        .btn-warning {
            background: linear-gradient(45deg, #f4a742, #f4c26e);
            border: none;
            color: white;
        }
        .btn-warning:hover {
            background: linear-gradient(45deg, #e4953c, #f0b05f);
        }
        .alert {
            border-radius: 8px;
        }
        form {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        footer {
            margin-top: 30px;
            text-align: center;
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>

</head>
<body>

<div class="container my-5">
    <h1 class="text-center mb-4 text-primary">Category Management</h1>

    <!-- Navigation Buttons -->
    <div class="d-flex justify-content-center mb-4">
        <form action="category-list" class="me-3">
            <button type="submit" class="btn btn-danger">View Categories</button>
        </form>
        <form action="admin.jsp">
            <button type="submit" class="btn btn-danger">Home</button>
        </form>
    </div>

    <%
        String message = request.getParameter("message");
        String error = request.getParameter("error");
    %>

    <% if (message != null) { %>
    <div class="alert alert-success" role="alert"><%= message %></div>
    <% } else if (error != null) { %>
    <div class="alert alert-danger" role="alert"><%= error %></div>
    <% } %>

    <!-- Add Category -->
    <div class="card my-4">
        <div class="card-body">
            <h5 class="card-title text-success">Add Category</h5>
            <form action="category-servlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" name="category_name" class="form-control" placeholder="Enter category name" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <input type="text" id="description" name="category_description" class="form-control" placeholder="Enter category description" required>
                </div>
                <button type="submit" class="btn btn-primary">Save Category</button>
            </form>
        </div>
    </div>

    <!-- Delete Category -->
    <div class="card my-4">
        <div class="card-body">
            <h5 class="card-title text-danger">Delete Category</h5>
            <form action="category-servlet" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">Category ID</label>
                    <input type="number" id="id" name="category_id" class="form-control" placeholder="Enter category ID" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete Category</button>
            </form>
        </div>
    </div>

    <!-- Update Category -->
    <div class="card my-4">
        <div class="card-body">
            <h5 class="card-title text-warning">Update Category</h5>
            <form action="category-servlet" method="post">
                <div class="mb-3">
                    <label for="update_category_id" class="form-label">Category ID</label>
                    <input type="number" id="update_category_id" name="update_category_id" class="form-control" placeholder="Enter category ID" required>
                </div>
                <div class="mb-3">
                    <label for="update_name" class="form-label">New Name</label>
                    <input type="text" id="update_name" name="update_name" class="form-control" placeholder="Enter new category name" required>
                </div>
                <div class="mb-3">
                    <label for="update_description" class="form-label">New Description</label>
                    <input type="text" id="update_description" name="update_description" class="form-control" placeholder="Enter new category description" required>
                </div>
                <button type="submit" class="btn btn-warning">Update Category</button>
            </form>
        </div>
    </div>
</div>

<footer>
    &copy; 2024 Category Management. All rights reserved.
</footer>
<script>
    document.addEventListener("DOMContentLoaded", () => {
<%--        <%--%>
<%--            String message = request.getParameter("message");--%>
<%--            String error = request.getParameter("error");--%>
<%--        %>--%>
        <% if (message != null) { %>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '<%= message %>',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        <% } else if (error != null) { %>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '<%= error %>',
            confirmButtonColor: '#d33',
            confirmButtonText: 'Try Again'
        });
        <% } %>
    });
</script>
<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
