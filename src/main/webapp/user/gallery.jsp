<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory Delight Gallery</title>
    <link rel="icon" href="../resources/images/icon.png">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Satisfy|Bree+Serif|Candal|PT+Sans">
    <link rel="stylesheet" href="../resources/css/user.css">
    <style>
        .gallery {
            padding: 30px 0;
        }
        .gallery-item {
            position: relative;
            overflow: hidden;
            margin-bottom: 30px;
        }
        .gallery-item img {
            width: 100%;
            transition: transform 0.5s ease;
        }
        .gallery-item:hover img {
            transform: scale(1.1);
        }
        .gallery-item .caption {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            color: #fff;
            opacity: 0;
            transition: opacity 0.5s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .gallery-item:hover .caption {
            opacity: 1;
        }
        .caption h4 {
            margin: 0;
        }







        /* ////////////.gallerynedw// */
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

    <!-- Gallery Section -->
    <section id="gallery" class="gallery section-padding">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12 text-center marb-35">
                    <!-- Additional content can go here -->
                </div>
                <div class="col-md-12">
                    <img src="../resources/images/icon.png" style="height: 100px; margin-top: 50px;" alt="Logo">
                    <h1 class="header-h" style="color: black;">Gallery</h1>
                    <p class="header-p">Explore our beautiful moments captured through the lens. Discover the essence of
                        Savory Delight in every picture.</p>
                </div>
            </div>
            <div class="row">
                <!-- Gallery Item 1 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (1).jpg" alt="Gallery Image 1" class="img-responsive">
                        <div class="caption">
                            <h4>Elegant Dining</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 2 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (10).jpg" alt="Gallery Image 2" class="img-responsive">
                        <div class="caption">
                            <h4>Delicious Plates</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 3 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (5).jpg" alt="Gallery Image 3" class="img-responsive">
                        <div class="caption">
                            <h4>Warm Ambiance</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 4 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (12).jpg" alt="Gallery Image 4" class="img-responsive">
                        <div class="caption">
                            <h4>Charming Setting</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 5 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (11).jpg" alt="Gallery Image 5" class="img-responsive">
                        <div class="caption">
                            <h4>Fresh Ingredients</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 6 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (14).jpg" alt="Gallery Image 6" class="img-responsive">
                        <div class="caption">
                            <h4>Artful Presentation</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 7 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (2).jpg" alt="Gallery Image 7" class="img-responsive">
                        <div class="caption">
                            <h4>Cozy Atmosphere</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 8 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (3).jpg" alt="Gallery Image 8" class="img-responsive">
                        <div class="caption">
                            <h4>Gourmet Dishes</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 9 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (6).jpg" alt="Gallery Image 9" class="img-responsive">
                        <div class="caption">
                            <h4>Elegant Table Settings</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 10 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (7).jpg" alt="Gallery Image 10" class="img-responsive">
                        <div class="caption">
                            <h4>Refined Flavors</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 11 -->
                <div class="col-md-3 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (8).jpg" alt="Gallery Image 11" class="img-responsive">
                        <div class="caption">
                            <h4>Plated Perfection</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 12 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (9).jpg" alt="Gallery Image 12" class="img-responsive">
                        <div class="caption">
                            <h4>Elegant Arrangements</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 13 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g.avif" alt="Gallery Image 13" class="img-responsive">
                        <div class="caption">
                            <h4>Vibrant Ingredients</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 14 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g.jpg" alt="Gallery Image 14" class="img-responsive">
                        <div class="caption">
                            <h4>Refined Settings</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 15 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (16).jpg" alt="Gallery Image 15" class="img-responsive">
                        <div class="caption">
                            <h4>Delightful Dishes</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 16 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (17).jpg" alt="Gallery Image 16" class="img-responsive">
                        <div class="caption">
                            <h4>Luxurious Experience</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 17 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (19).jpg" alt="Gallery Image 17" class="img-responsive">
                        <div class="caption">
                            <h4>Serene Moments</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 18 -->
                <div class="col-md-3 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (18).jpg" alt="Gallery Image 18" class="img-responsive">
                        <div class="caption">
                            <h4>Gourmet Experience</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 19 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (21).jpg" alt="Gallery Image 19" class="img-responsive">
                        <div class="caption">
                            <h4>Stunning Plating</h4>
                        </div>
                    </div>
                </div>
                <!-- Gallery Item 20 -->
                <div class="col-md-4 col-sm-4">
                    <div class="gallery-item">
                        <img src="../resources/images/g (20).jpg" alt="Gallery Image 20" class="img-responsive">
                        <div class="caption">
                            <h4>Exquisite Flavors</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / Gallery Section -->

    <!-- Footer -->
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
    <!-- / Footer -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../resources/js/user.js"></script>
</body>
</html>
