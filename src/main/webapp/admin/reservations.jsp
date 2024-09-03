<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>Reservation Management - Savory Delight</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
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
                <tbody>
                <tr>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>2024-09-05 19:00:00</td>
                    <td>4</td>
                    <td>Mathara</td>
                    <td>
                        <button class="btn btn-secondary btn-sm"
                                onclick="openEditModal('John Doe', '2024-09-05')">Edit</button>
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </td>
                </tr>
                <!-- More rows as needed -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeEditModal()">&times;</span>
            <h2>Edit Reservation</h2>
            <form>
                <div class="form-group">
                    <label for="editName">Customer Name:</label>
                    <input type="text" id="editName" name="editName" disabled>
                </div>
                <div class="form-group">
                    <label for="editDate">Date:</label>
                    <input type="date" id="editDate" name="editDate" required>
                </div>
                <button type="submit" class="btn-primary">Save Changes</button>
            </form>
        </div>
    </div>

    <script>
        function openEditModal(name, date) {
            document.getElementById('editName').value = name;
            document.getElementById('editDate').value = date;
            document.getElementById('editModal').style.display = 'block';
        }

        function closeEditModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }
    </script>
</body>
</html>
