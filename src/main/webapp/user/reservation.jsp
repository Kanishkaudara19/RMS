<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservations - Savory Delight</title>
    <link rel="icon" href="../resources/images/icon.png">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Satisfy|Bree+Serif|Candal|PT+Sans">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resources/css/user.css">
</head>
<style>
    /* Improved styling for the seat selector */
    .seat-selector {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        margin-top: 15px;

    }

    .seat-selector button {
        border: none;
        background-color: #007bff;
        color: white;
        padding: 5px 20px;
        font-size: 15px;
        cursor: pointer;
        border-radius: 10%;
        transition: background-color 0.3s ease;
    }

    .seat-selector button:hover {
        background-color: #0056b3;
    }

    .seat-selector button:disabled {
        background-color: #e0e0e0;
        cursor: not-allowed;
    }

    .seat-selector input {
        text-align: center;
        width: 60px;
        font-size: 20px;
        border: 2px solid #007bff;
        border-radius: 8px;
        padding: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .seat-selector .plus {
        background-color: #28a745;
    }

    .seat-selector .minus {
        background-color: #dc3545;
    }

    .seat-selector .plus:hover {
        background-color: #218838;
    }

    .seat-selector .minus:hover {
        background-color: #c82333;
    }

    /* Ensure select elements are styled properly */
    .form-control {
        border-radius: 4px;
        padding: 10px;
        /* Adjust padding for better visibility */
        font-size: 16px;
        /* Increase font size for readability */
        height: auto;
        /* Ensure the height is dynamic based on content */
        box-sizing: border-box;
        /* Include padding and border in the element's total width and height */
    }

    /* Style for select dropdown */
    .select-wrapper {
        position: relative;
        display: inline-block;
        width: 100%;
    }

    .select-wrapper select {
        width: 100%;
        height: 40px;
        /* Adjust height for better visibility */
        padding: 10px;
        /* Adjust padding for better visibility */
        font-size: 16px;
        /* Increase font size for readability */
    }
</style>
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

    <!-- Reservation Banner -->
    <section id="res-banner">
        <div class="bg-color">
            <header id="header">
                <div class="container">
                </div>
            </header>
            <div class="container">
                <div class="row">
                    <div class="inner text-center">
                        <h1 class="logo-name" style="color: yellow;">Reserve Your Table</h1>
                        <h2 style="color: white;">Plan Your Culinary Experience</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / banner -->

    <!-- Reservation Form Section -->
    <section id="reservation" class="section-padding" style="background-color: #f9f9f9;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="header-h">Table Reservation</h1>
                    <p class="header-p">Reserve your spot for an extraordinary dining experience with us.</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <form class="form" method="POST" action="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone">Your Phone</label>
                                    <input type="tel" class="form-control" id="phone"
                                           placeholder="Enter your phone number" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="location">Select Location</label>
                                    <select class="form-control" id="location" required>
                                        <option disabled selected>Select restaurant location</option>
                                        <option value="colombo">Colombo</option>
                                        <option value="kandy">Mathara</option>
                                        <option value="galle">Galle</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="date">Date</label>
                                    <input type="date" class="form-control" id="date" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="time">Time</label>
                                    <input type="time" class="form-control" id="time" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group seat-selector">
                                    <label for="seats">Select Number of People</label>
                                    <button type="button" class="btn minus" id="decrease-seats"><i
                                            class="fa fa-minus"></i></button>
                                    <input type="text" class="form-control" id="seats" value="1" readonly>
                                    <button type="button" class="btn plus" id="increase-seats"><i
                                            class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </div>

                        <div class="text-center" style="margin-top: 60px;">
                            <button type="submit" class="btn btn-primary btn-lg">Reserve Now</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- / Reservation Form Section -->

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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const increaseSeatsButton = document.getElementById('increase-seats');
            const decreaseSeatsButton = document.getElementById('decrease-seats');
            const seatsInput = document.getElementById('seats');

            let seats = 1;
            const maxSeats = 10;

            increaseSeatsButton.addEventListener('click', function () {
                if (seats < maxSeats) {
                    seats++;
                    seatsInput.value = seats;
                }
            });

            decreaseSeatsButton.addEventListener('click', function () {
                if (seats > 1) {
                    seats--;
                    seatsInput.value = seats;
                }
            });
        });
    </script>
    <script src="../resources/js/script.js"></script>
    <script src="../resources/js/user.js"></script>
</body>
</html>
