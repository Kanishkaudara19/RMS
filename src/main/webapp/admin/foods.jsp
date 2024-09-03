<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>User Management - Savory Delight</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }


        .content {
            margin-left: 250px;

            padding: 20px;
            background-color: #fff;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 32px;
            color: #343a40;
        }


        .food-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: nowrap;
            margin-bottom: 30px;
        }

        .food-form .form-group {
            display: flex;
            align-items: center;
            margin-right: 20px;
            flex: 1;
        }

        .food-form .form-group:last-child {
            margin-right: 0;
        }

        .food-form label {
            margin-right: 10px;
            font-weight: bold;
            color: #495057;
        }

        .food-form input[type="text"],
        .food-form input[type="number"],
        .food-form input[type="file"] {
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #fff;
            transition: border-color 0.3s;
            width: 100%;
        }

        .food-form input[type="text"]:focus,
        .food-form input[type="number"]:focus,
        .food-form input[type="file"]:focus {
            border-color: #80bdff;
            outline: none;
        }

        .food-form button {
            background-color: #28a745;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .food-form button:hover {
            background-color: #218838;
        }

        /* Food Table Styling */
        .food-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            margin-top: 30px;
        }

        .food-table th,
        .food-table td {
            padding: 15px;
            text-align: left;
            color: #343a40;
        }

        .food-table th {
            background-color: #343a40;
            color: #fff;
            font-weight: bold;
        }

        .food-table td {
            border-bottom: 1px solid #dee2e6;
        }

        .food-table img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Availability Toggle */
        .availability-toggle {

            justify-content: center;
            align-items: center;
        }

        .availability-toggle select {
            padding: 8px 12px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #f8f9fa;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .availability-toggle select:focus {
            outline: none;
            background-color: #e9ecef;
        }
        .foodimg{

            height: 10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .content {
                margin-left: 0;
                margin-top: 60px;
            }

            .sidebar {
                display: none; /* Hide sidebar on mobile */
            }

            .food-form {
                flex-direction: column;
            }

            .food-form .form-group {
                flex: 1 1 100%;
                margin: 10px 0;
            }

            .food-table img {
                width: 80px;
                height: 80px;
            }
        }
    </style>
</head>
<body onload="getFoodList();">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3>Admin Panel</h3>
        </div>
        <div class="sidebar-menu">
            <a href="orders.jsp" class="menu-item">
                <i class="fas fa-truck"></i> Orders
            </a>
            <a href="reservations.jsp" class="menu-item">
                <i class="fas fa-calendar-alt"></i> Reservations
            </a>
            <a href="foods.jsp" class="menu-item active">
                <i class="fas fa-calendar-alt"></i> Foods
            </a>
            <a href="users.jsp" class="menu-item">
                <i class="fas fa-users active"></i> Users
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
        <h1 style="margin-top: 100px;">Add New Food</h1>

        <!-- Food Form -->
        <div class="food-form">
            <div class="form-group">
                <label for="foodName">Name:</label>
                <input type="text" id="foodName" name="foodName" placeholder="Enter food name" required>
            </div>
            <div class="form-group">
                <label for="foodPrice">Price:</label>
                <input type="number" id="foodPrice" name="foodPrice" placeholder="Enter food price" required>
            </div>
            <div class="form-group">
                <label for="foodImage">Image:</label>
                <input type="file" id="foodImage" name="foodImage" accept="image/*" required>
            </div>
            <button style="margin-top: -20px;" onclick="addFood();">Add Food</button>
        </div>

        <!-- Food Table -->
        <table class="food-table">
            <thead>
                <tr>
                    <th>Food Name</th>
                    <th>Food Price</th>
                    <th>Image</th>
                    <th>Availability</th>
                </tr>
            </thead>
            <tbody id="food-data-table">
                <%-- Foods will be loaded here --%>
            </tbody>
        </table>
    </div>

    <script src="../resources/js/admin.js"></script>
</body>
</html>
