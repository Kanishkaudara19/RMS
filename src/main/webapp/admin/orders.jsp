<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>Order Management - Savory Delight</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<!-- for Edit model  -->
<style>
    .invoice-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .invoice-table th,
    .invoice-table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }

    .invoice-table th {
        background-color: #f8f8f8;
        font-weight: bold;
    }
</style>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3>Admin Panel</h3>
        </div>
        <div class="sidebar-menu">
            <a href="orders.jsp" class="menu-item active">
                <i class="fas fa-truck"></i> Orders
            </a>
            <a href="reservations.jsp" class="menu-item">
                <i class="fas fa-calendar-alt"></i> Reservations
            </a>
            <a href="foods.jsp" class="menu-item">
                <i class="fas fa-calendar-alt"></i> Foods
            </a>
            <a href="users.jsp" class="menu-item">
                <i class="fas fa-users"></i> Users
            </a>
            <a href="reports.jsp" class="menu-item">
                <i class="fas fa-chart-line"></i> Reports
            </a>
        </div>
    </div>

    <!-- Topbar -->
    <div class="topbar">
        <div class="logo">
            <h3>Savory Delight</h3>
        </div>
        <img src="../resources/images/icon.png" alt="Savory Delight Logo" style="width: 40px;">
    </div>

    <!-- Main Content -->
    <div class="content">
        <h1>Delivery Orders</h1>

        <!-- Orders Table -->
        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Delivery Address</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>#1234</td>
                    <td>John Doe</td>
                    <td>123 Elm Street</td>
                    <td>2024-09-01</td>
                    <td>Delivered</td>
                    <td>
                        <button class="btn btn-secondary btn-sm">Update</button>
                    </td>
                </tr>
                <!-- More rows as needed -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Order Modal -->
    <div id="editOrderModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal('editOrderModal')">&times;</span>
            <h2>Edit Order</h2>
            <form id="editOrderForm">
                <label for="orderId">Order ID:</label>
                <input type="text" id="orderId" name="orderId" value="#1234" readonly disabled>

                <!-- Food Items List -->
                <div id="foodItemsContainer">
                    <h3>Food Items</h3>
                    <table class="invoice-table">
                        <thead>
                        <tr>
                            <th>Food Name</th>
                            <th>Quantity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Pizza</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>Burger</td>
                            <td>1</td>
                        </tr>
                        <!-- Repeat for additional food items -->
                        </tbody>
                    </table>
                </div>

                <label for="status">Status:</label>
                <select id="status" name="status">
                    <option value="pending">Pending</option>
                    <option value="delivered" selected>Delivered</option>
                    <option value="canceled">Canceled</option>
                </select>

                <button type="submit" class="btn btn-primary">Update Order</button>
                <button type="button" class="btn btn-secondary" onclick="closeModal('editOrderModal')">Cancel</button>
            </form>
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }

        // Example: Open edit modal when clicking the "Edit" button
        document.querySelectorAll('.btn-secondary').forEach(button => {
            button.addEventListener('click', () => {
                openModal('editOrderModal');
            });
        });
    </script>
    <script src="../resources/js/admin.js"></script>
</body>
</html>
