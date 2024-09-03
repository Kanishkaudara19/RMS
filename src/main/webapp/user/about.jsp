<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory Delight</title>
    <link rel="icon" href="../resources/images/icon.png">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Satisfy|Bree+Serif|Candal|PT+Sans">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../resources/css/user.css">
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
    <!-- About Us -->
    <section id="about" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center marb-35">
                    <img src="../resources/images/icon.png" style="height: 100px; margin-top: 50px;" alt="">
                    <h1 class="header-h" style="color: black;">About Savory Delight</h1>

                    <p class="header-p">Welcome to Savory Delight, where culinary excellence meets a passion for serving
                        delightful experiences. Our journey began with a simple vision: to provide an exceptional dining experience
                        with a touch of elegance and warmth.</p>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="col-md-6 col-sm-6">
                        <div class="about-info">
                            <h2 class="heading" style="color: rgb(7, 15, 121);">Our Story</h2>
                            <p>At Savory Delight, we believe that food is more than just sustenance; it's a celebration of flavors and
                                traditions. Founded on the principles of quality, innovation, and hospitality, our restaurant has grown
                                from a humble start to a beloved local gem. Our dedicated team works tirelessly to bring you the
                                freshest ingredients, carefully crafted dishes, and an inviting atmosphere that makes every visit
                                memorable.</p>
                            <div class="details-list">
                                <ul>
                                    <li><i class="fa fa-check"></i> A legacy of excellence in culinary arts.</li>
                                    <li><i class="fa fa-check"></i> Commitment to using locally sourced, high-quality ingredients.</li>
                                    <li><i class="fa fa-check"></i> An inviting atmosphere that blends comfort with elegance.</li>
                                    <li><i class="fa fa-check"></i> Exceptional service that makes every guest feel at home.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <img src="../resources/images/about2.jpg" alt="Savory Delight Interior" class="img-responsive">
                        <img src="../resources/images/portrait1.avif" alt="Savory Delight Interior" class="img-responsive">
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </section>
</body>

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img src="../resources/images/icon.png" alt="" style="height: 50px;">
                <h3>About Savory Delight</h3>
                <p>Experience the best in dining with a touch of luxury and tradition. Join us for an unforgettable culinary
                    journey.</p>
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

</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script src="../resources/js/script.js"></script>
