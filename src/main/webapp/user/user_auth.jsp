<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Savory Delight</title>
    <link rel="icon" href="../resources/images/icon.png">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Satisfy|Bree+Serif|Candal|PT+Sans">
    <link rel="stylesheet" href="../resources/css/user.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            background: url('../resources/images/slide4.webp') no-repeat center center;
            background-size: cover;
        }

        #auth-section {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .auth-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        .auth-container h2 {
            margin-top: 0;
            font-size: 24px;
            text-align: center;
        }

        .nav-tabs {
            border-bottom: none;
        }

        .nav-tabs>li {
            width: 50%;
        }

        .nav-tabs>li>a {
            border: none;
            border-radius: 5px 5px 0 0;
            font-size: 18px;
        }

        .tab-content {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 0 0 5px 5px;
            background-color: #fff;
        }

        .form-control {
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }

        .btn-lg {
            padding: 15px 30px;
            font-size: 18px;
        }

        .footer {
            background-color: #333;
            color: #fff;
            padding: 50px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-default navbar-fixed-top navbar-transparent">
        <div class="container">
            <div class="navbar-header">
                <button id="menu-toggle" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar bar1"></span>
                    <span class="icon-bar bar2"></span>
                    <span class="icon-bar bar3"></span>
                </button>
                <a href="index.jsp" class="navbar-brand">SAVORY DELIGHT</a>
            </div>
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav navbar-right">

                    <li><a href="order.jsp">ORDER NOW</a></li>
                    <li><a href="reservation.jsp">RESERVATIONS</a></li>
                    <li><a href="about.jsp">ABOUT</a></li>
                    <li><a href="gallery.jsp">GALLERY</a></li>
                    <!-- Display user name if logged in -->
                    <li id="user-name" class="hidden "><a href="#">Welcome, <span id="username">User</span></a></li>
                    <!-- Display login/register links if not logged in -->
                    <li id="login-link"><a href="user_auth.jsp">LOGIN / REGISTER</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Authentication Section -->
    <section id="auth-section">
        <div class="auth-container">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                <li><a href="#register" data-toggle="tab">Register</a></li>
            </ul>
            <div class="tab-content">
                <!-- Login Tab -->
                <div class="tab-pane fade in active" id="login">
                    <h2>Login</h2>
                    <form id="login-form" method="POST" action="">
                        <div class="form-group">
                            <label for="login-username">Username</label>
                            <input type="text" class="form-control" id="login-username" placeholder="Enter your Username"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="login-password">Password</label>
                            <input type="password" class="form-control" id="login-password"
                                   placeholder="Enter your password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg">Login</button>
                        </div>
                    </form>
                </div>

                <!-- Register Tab -->
                <div class="tab-pane fade" id="register">
                    <h2>Register</h2>
                    <form id="register-form" method="POST" action="register_submit.php">
                        <div class="form-group">
                            <label for="First-name">First Name</label>
                            <input type="text" class="form-control" id="First-name" placeholder="Enter your first name"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="Last-name">Last Name</label>
                            <input type="text" class="form-control" id="Last-name" placeholder="Enter your last name"
                                   required>
                        </div>
                        <div class="form-group">
                            <label for="register-Username">Username</label>
                            <input type="text" class="form-control" id="register-Username"
                                   placeholder="Enter your username" required>
                        </div>
                        <div class="form-group">
                            <label for="register-password">Password</label>
                            <input type="password" class="form-control" id="register-password"
                                   placeholder="Enter your password" required>
                        </div>
                        <div class="form-group">
                            <label for="register-confirm-password">Confirm Password</label>
                            <input type="password" class="form-control" id="register-confirm-password"
                                   placeholder="Confirm your password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success btn-lg">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="../resources/images/icon.png" alt="" style="height: 50px;">
                    <h3>About Savory Delight</h3>
                    <p>Experience the best in dining with a touch of luxury and tradition. Join us for an unforgettable
                        culinary journey.</p>
                </div>
                <div class="col-md-4">
                    <h3>Opening Hours</h3>
                    <p>Mon-Fri: 10am - 10pm<br>Sat-Sun: 10am - 11pm</p>
                </div>
                <div class="col-md-4">
                    <h3>Contact Us</h3>
                    <p>Email: info@savorydelight.com<br>Phone: +94 123 456 789</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="../resources/js/script.js"></script>
    <script src="../resources/js/user.js"></script>
</body>
</html>
