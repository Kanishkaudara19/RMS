<%@ page import="com.kanishka.rms.entity.User" %>
<%@ page import="com.kanishka.rms.model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");

    if(user==null) {
        response.sendRedirect("index.jsp");
    }

    // Restrict access to the page for RECEPTION_STAFF
    if(user.getUserType() == UserType.DELIVERY_STAFF) {
        %>
        <script type="text/javascript">
            // Display an alert to the user
            alert("You do not have permission to access Receptions Page");
            // Redirect to the unauthorized page after alert
            window.location.href = "orders.jsp";
        </script>
        <%
        return; // Stop further execution
    }

    // Allow access for DELIVERY_STAFF and ADMIN
    if(user.getUserType() == UserType.RECEPTION_STAFF || user.getUserType() == UserType.ADMIN) {
        // User is authorized, proceed with page rendering
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>Reservation Management - Savory Delight</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body onload="getReservationList();">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3>Admin Panel</h3>
        </div>
        <div class="sidebar-menu">
            <a href="orders.jsp" class="menu-item">
                <i class="fas fa-truck"></i> Orders
            </a>
            <a href="reservations.jsp" class="menu-item active">
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
        <!-- Page Header -->
        <div class="page-header">
            <h2>Reservations</h2>
        </div>

        <!-- Table -->
        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Customer Name</th>
                        <th>Date Time</th>
                        <th>Seats</th>
                        <th>Place</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="reservation-data-table">
                    <!-- Reservations will be loaded here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeReservationModal()">&times;</span>
            <h2>Edit Reservation</h2>
            <div>
                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="rid">Customer Name:</label>
                    <input type="text" id="rid" name="editName" disabled>
                </div>
                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="editName">Customer Name:</label>
                    <input type="text" id="editName" name="editName" disabled>
                </div>
                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="editDate">Date:</label>
                    <input type="datetime-local" id="editDate" name="editDate" required>
                </div>
                <button class="btn-primary" onclick="updateReservation();">Save Changes</button>
            </div>
        </div>
    </div>

    <script>
        function openReservationModal(id, name, date) {
            document.getElementById('rid').value = id;
            document.getElementById('editName').value = name;
            document.getElementById('editDate').value = date;
            document.getElementById('editModal').style.display = 'block';
        }

        function closeReservationModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }
    </script>
    <script src="../resources/js/admin.js"></script>
</body>
</html>
