<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>Reports - Savory Delight</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
    /* Print Styles */
    @media print {
        body {
            font-family: Arial, sans-serif;
            color: #333;
        }
        .sidebar, .topbar, .report-filters, .report-cards, .print-button {
            display: none; /* Hide all elements except the report */
        }
        .content {
            margin: 0;
            padding: 0;
        }
        #printable-report {
            display: block !important; /* Ensure report is shown during printing */
        }
    }
    /* Printable Report Styling */
    #printable-report {
        margin-top: 20px;
        padding: 20px;
        border: 1px solid #ddd;
        background-color: #fff;
    }

    #printable-report h2, #printable-report h3 {
        text-align: center;
        margin-bottom: 10px;
    }

    .report-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .report-table th, .report-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    .report-table th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    .report-summary {
        text-align: right;
        margin-top: 20px;
    }
</style>
<body onload="getReportData();">
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
            <a href="foods.jsp" class="menu-item">
                <i class="fas fa-calendar-alt"></i> Foods
            </a>
            <a href="users.jsp" class="menu-item">
                <i class="fas fa-users"></i> Users
            </a>
            <a href="reports.jsp" class="menu-item active">
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
        <h1>Reports</h1>

        <!-- Report Cards -->
        <div class="report-cards">
            <div class="report-card">
                <i class="fas fa-calendar-day"></i>
                <h3>Total Income</h3>
                <p id="t-income">LKR 0</p>
            </div>
            <div class="report-card">
                <i class="fas fa-piggy-bank"></i>
                <h3>Total Reservations</h3>
                <p id="t-reserv">0</p>
            </div>
            <div class="report-card">
                <i class="fas fa-users"></i>
                <h3>Total Customers</h3>
                <p id="t-user">0</p>
            </div>
            <div class="report-card">
                <i class="fas fa-box"></i>
                <h3>Total Orders</h3>
                <p id="t-order">0</p>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">

        <!-- Report Filters and Download -->
        <div class="report-filters">
            <label for="reportType">Select Report Type:</label>
            <select id="reportType" class="btn-primary">
                <option value="weekly">Weekly</option>
                <option value="monthly" selected>Monthly</option>
                <option value="yearly">Yearly</option>
            </select>
            <button class="btn-primary" onclick="generateReport()">Generate Report</button>
            <button class="btn-primary print-button" onclick="window.print()">Print Report</button>
        </div>

        <!-- Printable Report -->
        <div id="printable-report" style="display: none;">
            <h2>Report: <span id="report-period">Monthly</span></h2>
            <h3>Income Report</h3>
            <table class="report-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="income-date">YYYY-MM-DD</td>
                        <td id="income">LKR 0</td>
                    </tr>
                </tbody>
            </table>

            <h3>Reservation Report</h3>
            <table class="report-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Number of Reservations</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="reserv-date">YYYY-MM-DD</td>
                        <td id="reserv">0</td>
                    </tr>
                </tbody>
            </table>

            <h3>Order Report</h3>
            <table class="report-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Number of Orders</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="order-date">YYYY-MM-DD</td>
                        <td id="order">0</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <script src="../resources/js/admin.js"></script>
</body>
</html>
