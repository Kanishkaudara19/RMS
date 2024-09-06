<%@ page import="com.kanishka.rms.entity.User" %>
<%@ page import="com.kanishka.rms.model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");

    if(user==null) {
        response.sendRedirect("index.jsp");
    }

    // Restrict access to the page for RECEPTION_STAFF
    if(user.getUserType() == UserType.RECEPTION_STAFF || user.getUserType() == UserType.DELIVERY_STAFF) {
        %>
        <script type="text/javascript">
            // Display an alert to the user
            alert("You do not have permission to access Users Page");
            // Redirect to the unauthorized page after alert
            window.location.href = "reports.jsp";
        </script>
        <%
        return; // Stop further execution
    }

    // Allow access for DELIVERY_STAFF and ADMIN
    if(user.getUserType() == UserType.ADMIN) {
        // User is authorized, proceed with page rendering
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>User Management - Savory Delight</title>
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body onload="getUserList();">
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
            <a href="users.jsp" class="menu-item active">
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
        <!-- Page Header -->
        <div class="page-header">
            <h2>Manage Users</h2>
            <button class="btn">Add User</button>
        </div>

        <!-- Users Table -->
        <div class="table-container">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="user-data-table">
                    <%-- Users will be loaded here --%>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add New User Modal -->
    <div id="addUserModal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <h2>Add New User</h2>
            <div class="form">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>

                <label for="username">Username:</label>
                <input type="tel" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="userType">User Type:</label>
                <select id="userType" name="userType" required>
                    <option value="ADMIN">Admin</option>
                    <option value="DELIVERY_STAFF">Delivery Staff</option>
                    <option value="RECEPTION_STAFF">Reception Staff</option>
                </select>

                <button class="btn btn-primary" onclick="register();">Add User</button>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeEditModal()">&times;</span>
            <h2>Edit User</h2>
            <div class="form">
                <label for="editFirstName">First Name:</label>
                <input type="text" id="editFirstName" name="firstName" required>

                <label for="editLastName">Last Name:</label>
                <input type="text" id="editLastName" name="lastName" required>

                <label for="editMobile">Username:</label>
                <input type="text" id="editMobile" name="mobile" required disabled>

                <label for="editPassword">Password:</label>
                <input type="password" id="editPassword" name="password" required>

                <label for="editUserType">User Type:</label>
                <select id="editUserType" name="userType">
                    <option value="ADMIN">Admin</option>
                    <option value="DELIVERY_STAFF">Delivery Staff</option>
                    <option value="RECEPTION_STAFF">Reception Staff</option>
                </select>

                <button class="btn btn-primary" onclick="updateUser();">Save Changes</button>
            </div>
        </div>
    </div>

    <script>
        function openEditModal(firstName, lastName, username, userType) {
            document.getElementById('editFirstName').value = firstName;
            document.getElementById('editLastName').value = lastName;
            document.getElementById('editMobile').value = username;
            document.getElementById('editUserType').value = userType;
            document.getElementById('editModal').style.display = 'block';
        }

        function closeEditModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        };

        // Function to open the modal
        function openModal() {
            document.getElementById("addUserModal").style.display = "flex";
        }

        // Function to close the modal
        function closeModal() {
            document.getElementById("addUserModal").style.display = "none";
        }

        // Close the modal if the user clicks outside of it
        window.onclick = function(event) {
            if (event.target === document.getElementById("addUserModal")) {
                closeModal();
            }
        };

        // Example function to trigger modal open (you can attach this to a button)
        document.querySelector(".page-header .btn").addEventListener("click", openModal);
    </script>
    <script src="../resources/js/admin.js"></script>
</body>
</html>
