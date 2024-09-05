<%@ page import="com.kanishka.rms.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");

    if(user!=null) {
        response.sendRedirect("orders.jsp");
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../resources/images/icon.png">
    <title>Savory Delight - Admin Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f7f8f8, #acbb78);
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-container img {
            display: block;
            margin: 0 auto 20px;
            height: 80px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #095764;
        }

        .form-group label {
            font-weight: 600;
            color: #333;
        }

        .form-control {
            border-radius: 20px;
            padding: 10px;
        }

        .btn-login {
            background-color: #095764;
            color: white;
            border-radius: 20px;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            width: 100%;
        }

        .btn-login:hover {
            background-color: #073f4f;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #095764;
            text-decoration: none;
            font-size: 14px;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <img src="../resources/images/icon.png" alt="Savory Delight Logo">
        <h2>Admin Login</h2>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="btn btn-login" onclick="login();">Login</button>
    </div>

    <script src="../resources/js/admin.js"></script>
</body>
</html>
