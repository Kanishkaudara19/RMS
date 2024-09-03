<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Now - Savory Delight</title>
    <link rel="icon" href="../resources/images/icon.png" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Satisfy|Bree+Serif|Candal|PT+Sans" />
    <link rel="stylesheet" href="../resources/css/user.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .order-form,
        .invoice {
            margin-top: 30px;
        }

        .order-form .form-group,
        .invoice .form-group {
            margin-bottom: 20px;
        }

        .invoice-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .invoice-item:last-child {
            border-bottom: none;
        }

        .form-control {
            border-radius: 4px;
        }

        .form-control {
            border-radius: 4px;
            padding: 10px;
            font-size: 16px;
            height: auto;
            box-sizing: border-box;
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
            padding: 10px;
            font-size: 16px;
        }

        .qty-container {
            display: flex;

            gap: 10px;
            margin-top: 15px;
        }

        .qty-container .qty {
            width: 80px;
            text-align: center;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            padding: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            outline: none;
            transition: box-shadow 0.3s ease;
        }

        .qty-container .qty:focus {
            box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5);
        }

        .qty-container .btn {
            border: none;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 10%;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .qty-container .btn:hover {
            background-color: #0056b3;
        }

        .qty-container .btn:active {
            transform: scale(0.95);
        }

        .qty-container .btn:disabled {
            background-color: #e0e0e0;
            cursor: not-allowed;
        }

        .qty-container .btn.increment {
            background-color: #2d6aee;
        }

        .qty-container .btn.increment:hover {
            background-color: #080ba8;
        }

        .qty-container .btn.decrement {
            background-color: #585858;
        }

        .qty-container .btn.decrement:hover {
            background-color: #131313;
        }

        .form-group label {
            margin-bottom: 10px;
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

    <!-- Order Banner -->
    <section id="order-banner">
        <div class="bg-color">
            <header id="header">
                <div class="container"></div>
            </header>
            <div class="container">
                <div class="row">
                    <div class="inner text-center">
                        <h1 class="logo-name">Order Your Favorite Dish</h1>
                        <h2>Easy and Quick Online Orders</h2>
                        <p>Order now and have it delivered to your doorstep!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Order Form and Invoice Section -->
    <section id="order" class="section-padding" style="background-color: white">
        <div class="container">
            <div class="row">
                <div class="col-md-6 order-form">
                    <h1 class="header-h">Place Your Order</h1>
                    <p class="header-p">Fill in your details and select your dishes.</p>
                    <form class="form" id="order-form">
                        <div class="form-group">
                            <label for="dish">Select Dish</label>
                            <select class="form-control" id="dish" required>
                                <option disabled selected>Select Food Item</option>
                                <option value="Pasta">Pasta</option>
                                <option value="Burger">Burger</option>
                                <option value="Pizza">Pizza</option>
                                <option value="Salad">Salad</option>
                                <option value="Dessert">Dessert</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="quantity">Quantity</label>
                            <div class="qty-container">
                                <button type="button" class="btn decrement" id="decrease-quantity">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <input type="number" class="form-control qty" id="quantity" min="1" value="1" required />
                                <button type="button" class="btn increment" id="increase-quantity">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="">
                            <button type="button" class="btn btn-primary btn-lg" id="add-to-order">
                                Add to Order
                            </button>
                        </div>
                    </form>
                </div>

                <div class="col-md-6 invoice">
                    <h3>Invoice</h3>
                    <div class="form-group">
                        <label for="phone">Your Phone</label>
                        <input type="tel" class="form-control" id="phone" placeholder="Enter your phone number" required />
                    </div>
                    <div class="form-group">
                        <label for="address">Delivery Address</label>
                        <input type="text" class="form-control" id="address" placeholder="Enter your address" required />
                    </div>
                    <div class="form-group">
                        <label for="invoice-location">Select Restaurant Location</label>
                        <select class="form-control" id="invoice-location">
                            <option disabled selected>Select Restaurant Location</option>
                            <option value="Colombo">Colombo</option>
                            <option value="Mathara">Mathara</option>
                            <option value="Galle">Galle</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="invoice-order-type">Select Order Type</label>
                        <select class="form-control" id="invoice-order-type">
                            <option disabled selected>Select Order Type</option>
                            <option value="Dine-In">Dine-In</option>
                            <option value="Delivery">Deliver</option>
                        </select>
                    </div>
                    <div id="invoice-items">
                        <!-- Dynamically added items will appear here -->
                    </div>
                    <span style="font-size: large">
                    <strong style="color: maroon">Total:</strong>
                    <span style="color: maroon; font-weight: bolder" id="invoice-total">LKR 0</span></span>

                    <div class="form-group">
                        <label for="paymentMethod">Select Payment Method</label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="paymentMethod" value="cash" checked />
                                Cash
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="paymentMethod" value="card" />
                                Credit/Debit Card
                            </label>
                        </div>
                    </div>
                    <div class="form-group text-center">
                        <button type="button" class="btn btn-success btn-lg" id="place-order">
                            Place Order
                        </button>
                        <button type="button" class="btn btn-danger btn-lg" id="clear-order">
                            Clear Order
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="../resources/images/icon.png" alt="" style="height: 50px" />
                    <h3>About Savory Delight</h3>
                    <p>
                        Experience the best in dining with a touch of luxury and
                        tradition. Join us for an unforgettable culinary journey.
                    </p>
                </div>
                <div class="col-md-4">
                    <h3>Opening Hours</h3>
                    <p>Mon-Fri: 10am - 10pm<br />Sat-Sun: 10am - 11pm</p>
                </div>
                <div class="col-md-4">
                    <h3>Contact Us</h3>
                    <p>Email: info@savorydelight.com<br />Phone: +94 123 456 789</p>
                </div>
            </div>
        </div>
    </footer>

    <script>
        //qty selecter
        document.addEventListener("DOMContentLoaded", function () {
            const increaseQuantityButton =
                document.getElementById("increase-quantity");
            const decreaseQuantityButton =
                document.getElementById("decrease-quantity");
            const quantityInput = document.getElementById("quantity");

            let quantity = parseInt(quantityInput.value, 10);
            const minQuantity = parseInt(quantityInput.min, 10);

            increaseQuantityButton.addEventListener("click", function () {
                quantity++;
                quantityInput.value = quantity;
            });

            decreaseQuantityButton.addEventListener("click", function () {
                if (quantity > minQuantity) {
                    quantity--;
                    quantityInput.value = quantity;
                }
            });
        });



        // add and clear orders

        document.addEventListener("DOMContentLoaded", function () {
            const addToOrderButton = document.getElementById("add-to-order");
            const clearOrderButton = document.getElementById("clear-order");
            const invoiceItemsContainer = document.getElementById("invoice-items");
            const invoiceTotal = document.getElementById("invoice-total");
            const dishSelect = document.getElementById("dish");
            const quantityInput = document.getElementById("quantity");

            let invoiceItems = [];
            let total = 0;

            addToOrderButton.addEventListener("click", function () {
                const dish = dishSelect.value;
                const quantity = parseInt(quantityInput.value);

                if (dish && quantity) {
                    invoiceItems.push({ dish, quantity });
                    updateInvoice();
                }
            });

            clearOrderButton.addEventListener("click", function () {
                invoiceItems = [];
                total = 0;
                updateInvoice();
            });

            function updateInvoice() {
                invoiceItemsContainer.innerHTML = "";
                total = 0;

                invoiceItems.forEach((item) => {
                    const div = document.createElement("div");
                    div.className = "invoice-item";
                    div.innerHTML = `<span>${item.dish}</span> <span>${item.quantity}</span>`;
                    invoiceItemsContainer.appendChild(div);

                    // Example price calculation
                    total += item.quantity * 500; // Assume each item costs LKR 500
                });

                invoiceTotal.innerText = `LKR ${total}`;
            }
        });
    </script>
    <script src="../resources/js/script.js"></script>
    <script src="../resources/js/user.js"></script>
</body>
</html>
