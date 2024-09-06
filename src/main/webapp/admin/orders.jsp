<%@ page import="com.kanishka.rms.entity.User" %>
<%@ page import="com.kanishka.rms.model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Retrieve the current user from the session
    User user = (User) session.getAttribute("user");

    // Redirect to login page if the user is not logged in
    if(user == null) {
        response.sendRedirect("index.jsp");
        return; // Stop further execution
    }

    // Restrict access to the page for RECEPTION_STAFF
    if(user.getUserType() == UserType.RECEPTION_STAFF) {
        %>
        <script type="text/javascript">
            // Display an alert to the user
            alert("You do not have permission to access Orders page");
            // Redirect to the unauthorized page after alert
            window.location.href = "reports.jsp";
        </script>
        <%
        return; // Stop further execution
    }

    // Allow access for DELIVERY_STAFF and ADMIN
    if(user.getUserType() == UserType.DELIVERY_STAFF || user.getUserType() == UserType.ADMIN) {
        // User is authorized, proceed with page rendering
    }
%>

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
<body onload="getOrderList();">
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
                <tbody id="order-data-table">
                    <!-- Order data will be loaded here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Order Modal -->
    <div id="editOrderModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>Edit Order</h2>
            <div id="editOrderForm">
                <label for="orderId">Order ID:</label>
                <input type="text" id="orderId" name="orderId" value="" readonly disabled>

                <!-- Food Items List -->
                <div id="foodItemsContainer" style="margin-bottom: 25px;">
                    <h3>Food Items</h3>
                    <table class="invoice-table">
                        <thead>
                            <tr>
                                <th>Food Name</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody id="food-data-table">
                            <!-- Order foods will be loaded here -->
                        </tbody>
                    </table>
                </div>

                <label for="status" style="margin-top: 25px !important;">Status:</label>
                <select id="status" name="status">
                    <option value="Queued" selected disabled>Queued</option>
                    <option value="Prepare">Prepare</option>
                    <option value="Deliver">Deliver</option>
                    <option value="Serve">Serve</option>
                    <option value="Completed">Completed</option>
                </select>

                <button class="btn btn-primary" style="margin-top: 15px;" onclick="updateOrderStatus();">Update Order</button>
                <button type="button" class="btn btn-secondary" style="margin-top: 15px;" onclick="closeModal()">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        function openModal() {
            document.getElementById("editOrderModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("editOrderModal").style.display = "none";
        }
    </script>
    <script src="../resources/js/admin.js"></script>
</body>
</html>
