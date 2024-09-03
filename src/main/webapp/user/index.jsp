<%@ page import="com.kanishka.rms.entity.User" %>
<%@ page import="com.kanishka.rms.model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Savory Delight</title>
    <link rel="icon" href="../resources/images/icon.png">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Satisfy|Bree+Serif|Candal|PT+Sans">
    <link rel="stylesheet" href="../resources/css/user.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* General card styles */
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Card hover effect */
        .card:hover {
            transform: scale(1.05);
            /* Slightly enlarges the card */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            /* Increases shadow on hover */
        }


        /* Reviews Section Styles */
        #reviews {
            padding: 60px 0;
        }

        .review-item {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .review-body {
            position: relative;
        }

        .review-rating {
            margin-bottom: 10px;
        }

        .review-rating .fa-star {
            font-size: 1.5em;
        }

        .review-rating .fa-star.checked {
            color: #f39c12;
        }

        .review-form {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .review-form .form-group {
            margin-bottom: 20px;
        }

        .review-form .btn-primary {
            background-color: #3498db;
            border-color: #3498db;
        }

        .review-form .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }

        .star-rating {
            display: flex;
            justify-content: center;
            cursor: pointer;
        }

        .star-rating .fa-star {
            font-size: 2em;
            color: #ddd;
        }

        .star-rating .fa-star.selected {
            color: #f39c12;
        }
    </style>
</head>

<body onload="getFoodList(); getReviewList();">
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

    <section id="banner">
        <div class="bg-color">
            <div class="container">
                <div class="row">
                    <div class="inner text-center">
                        <h1 class="logo-name">Savory Delight</h1>
                        <h2>Food To Lift your lifestyle & health.</h2>
                        <p>Specialized in Culinary Excellence!!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / banner -->

    <!-- menu -->
    <section id="menu-list" class="section-padding" style="background-color: white;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center ">
                    <h1 class="header-h">Menu List</h1>
                    <p class="header-p">Explore our delicious menu crafted with fresh ingredients.</p>
                </div>

                <div id="menu-wrapper" class="row">
                    <%-- Foods will be loaded here --%>
                </div>
            </div>
        </div>
    </section>
    <!--/ menu -->

    <!--Event Gallery -->
    <section id="event">
        <div class=" section-padding" style="background-color: black;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 text-center" style="padding:60px;">
                        <h1 class="header-h">Gallery</h1>
                        <p class="header-p">Explore our collection of memorable moments and stunning visuals.</p>
                    </div>
                    <div class="col-md-12" style="padding-bottom:60px;">
                        <div class="gallery-item">
                            <div class="col-md-4 col-sm-4 gallery-image">
                                <img src="../resources/images/event1.jpg" class="img-responsive" alt="Gallery Image 1">
                                <div class="gallery-caption">
                                    <h3>Joyful Party</h3>
                                    <p>A stunning event with elegant decor and lively atmosphere.</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 gallery-image">
                                <img src="../resources/images/event2.jpg" class="img-responsive" alt="Gallery Image 1">
                                <div class="gallery-caption">
                                    <h3>Office Party</h3>
                                    <p>Guests enjoying a lively and festive atmosphere. Joyful evening</p>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 gallery-image">
                                <img src="../resources/images/event 3.png" class="img-responsive" alt="Gallery Image 1">
                                <div class="gallery-caption">
                                    <h3>An Auction</h3>
                                    <p>High-profile auction featuring rare and valuable items</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <a href="gallery.jsp" class="btn-read-more">View More Gallery</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / Event Gallery -->

    <!-- About Us -->
    <section id="about" class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center marb-35">

                    <h1 class="header-h">About Savory Delight</h1>
                    <p class="header-p">Welcome to Savory Delight, where culinary excellence meets a passion for serving
                        delightful experiences. Our journey began with a simple vision: to provide an exceptional dining
                        experience with a touch of elegance and warmth.</p>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="col-md-6 col-sm-6">
                        <div class="about-info">
                            <h2 class="heading">Our Story</h2>
                            <p>At Savory Delight, we believe that food is more than just sustenance; it's a celebration
                                of flavors and traditions. Founded on the principles of quality, innovation, and
                                hospitality, our restaurant has grown from a humble start to a beloved local gem. Our
                                dedicated team works tirelessly to bring you the freshest ingredients, carefully crafted
                                dishes, and an inviting atmosphere that makes every visit memorable.</p>
                            <div class="details-list">
                                <ul>
                                    <li><i class="fa fa-check"></i> A legacy of excellence in culinary arts.</li>
                                    <li><i class="fa fa-check"></i> Commitment to using locally sourced, high-quality
                                        ingredients.</li>
                                    <li><i class="fa fa-check"></i> An inviting atmosphere that blends comfort with
                                        elegance.</li>
                                    <li><i class="fa fa-check"></i> Exceptional service that makes every guest feel at
                                        home.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <img src="../resources/images/food2.jpg" alt="Savory Delight Interior" class="img-responsive">
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </section>
    <!-- / About Us -->

    <!-- Reviews Section -->
    <section id="reviews" class="section-padding" style="background-color: #000000;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="header-h">Customer Reviews</h1>
                    <p class="header-p">See what our customers have to say about their experiences with us.</p>
                </div>
            </div>
            <div class="row">
                <!-- Review Display -->
                <div class="col-md-12">
                    <div class="reviews-list" id="review-list">

                        <!-- Single Review -->
                        <div class="review-item">
                            <div class="review-header">
                                <div class="reviewer-info">
                                    <h4 class="reviewer-name">John Doe</h4>
                                    <div class="review-rating">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </div>
                                </div>

                            </div>
                            <div class="review-body">
                                <p>Great food and excellent service. The atmosphere is perfect for a nice dinner out.
                                    Highly recommend!</p>
                            </div>
                        </div>

                        <!-- Repeat Review Item for more reviews -->
                    </div>
                </div>
            </div>
            <%
                User user = (User) session.getAttribute("user");
                String showReviewSubmission = "display: none;";

                if(user != null && user.getUserType() == UserType.CUSTOMER) {
                    showReviewSubmission = "";
                }
            %>
            <div class="row" style="<%= showReviewSubmission %>">
                <!-- Submit Review Form -->
                <div class="col-md-12">
                    <div class="review-form">
                        <h2 class="header-h">Submit Your Review</h2>
                        <div class="review-form">
                            <div class="form-group">
                                <label for="comment">Rating:</label>
                                <div id="star-rating" class="star-rating">
                                    <span class="fa fa-star" data-value="1"></span>
                                    <span class="fa fa-star" data-value="2"></span>
                                    <span class="fa fa-star" data-value="3"></span>
                                    <span class="fa fa-star" data-value="4"></span>
                                    <span class="fa fa-star" data-value="5"></span>
                                </div>
                                <input type="hidden" name="rating" id="rating" required>
                            </div>
                            <div class="form-group">
                                    <textarea class="form-control" id="comment" name="review" rows="4" placeholder="Your Comment"
                                              required></textarea>
                            </div>

                            <button class="btn btn-primary" onclick="submitReview();">Submit Review</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / Reviews Section -->

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
</body>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const stars = document.querySelectorAll('#star-rating .fa-star');
        const ratingInput = document.getElementById('rating');

        stars.forEach(star => {
            star.addEventListener('mouseover', function () {
                const value = this.getAttribute('data-value');
                stars.forEach(s => {
                    s.classList.toggle('selected', s.getAttribute('data-value') <= value);
                });
            });

            star.addEventListener('mouseout', function () {
                stars.forEach(s => {
                    s.classList.toggle('selected', s.classList.contains('selected'));
                });
            });

            star.addEventListener('click', function () {
                const value = this.getAttribute('data-value');
                ratingInput.value = value;
                stars.forEach(s => {
                    s.classList.toggle('selected', s.getAttribute('data-value') <= value);
                });
            });
        });
    });

    // selecting stars output number of stars
    document.addEventListener('DOMContentLoaded', function () {
        const stars = document.querySelectorAll('#star-rating .fa-star');
        const ratingInput = document.getElementById('rating');
        const reviewForm = document.querySelector('.review-form');

        stars.forEach(star => {
            star.addEventListener('mouseover', function () {
                const value = this.getAttribute('data-value');
                stars.forEach(s => {
                    s.classList.toggle('selected', s.getAttribute('data-value') <= value);
                });
            });

            star.addEventListener('mouseout', function () {
                const value = ratingInput.value;
                stars.forEach(s => {
                    s.classList.toggle('selected', s.getAttribute('data-value') <= value);
                });
            });

            star.addEventListener('click', function () {
                const value = this.getAttribute('data-value');
                ratingInput.value = value;
                stars.forEach(s => {
                    s.classList.toggle('selected', s.getAttribute('data-value') <= value);
                });
            });
        });
    });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script src="../resources/js/script.js"></script>
<script src="../resources/js/user.js"></script>
</html>
