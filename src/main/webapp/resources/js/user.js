const RESPONSE_OK = 200;

function getNewDiv() {
    return document.createElement("div");
}

// index.jsp

function getFoodList() {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState === 4) {
            if (request.status === RESPONSE_OK) {

                if(window.location.pathname.includes("index.jsp")) {
                    createFoodList(JSON.parse(request.responseText));
                } else {
                    createFoodOptions(JSON.parse(request.responseText));
                }
            } else {
                // Do nothing
            }
        }
    };
    request.open("GET", "/food/all", true);
    request.send();
}

function createFoodList(foodObjArray) {
    var menu = document.getElementById("menu-wrapper");
    menu.innerHTML = "";

    foodObjArray.forEach((food) => {
        var image = document.createElement("img");
        image.classList.add("card-img-top");
        image.alt = food.name;
        image.src = "../uploads/foods/" + food.thumbnailUrl;

        var title = document.createElement("h5");
        title.classList.add("card-title");
        title.innerText = food.name;

        var price = document.createElement("p");
        price.classList.add("card-price");
        price.innerText = "Rs. " + food.price;

        var divBody = getNewDiv();
        divBody.classList.add("card-body");
        divBody.appendChild(title);
        divBody.appendChild(price);

        var divCard = getNewDiv();
        divCard.classList.add("card");
        divCard.appendChild(image);
        divCard.appendChild(divBody);

        var divMenuItem = getNewDiv();
        divMenuItem.classList.add("col-md-4", "menu-item", "menu-restaurant");
        divMenuItem.appendChild(divCard);

        menu.appendChild(divMenuItem);
    });
}

function createFoodOptions(foodObjArray) {
    var dishItemSelect = document.getElementById("dish");

    var firstOption = document.createElement("option");
    firstOption.value = "0";
    firstOption.setAttribute("disabled", "true");
    firstOption.setAttribute("selected", "true");
    firstOption.innerText = "Select Food Item";
    dishItemSelect.appendChild(firstOption);

    foodObjArray.forEach((food) => {
        var option = document.createElement("option");
        option.value = food.id;
        option.innerText = food.name;
        option.setAttribute("data-price", food.price);

        dishItemSelect.appendChild(option);
    });
}

function submitReview() {
    var ratingInput = document.getElementById("rating");
    var commentInput = document.getElementById("comment");

    if (ratingInput.value > 5 || ratingInput.value < 1) {
        alert("Something went wrong! Please try again later.");
        return;
    } else if (commentInput.value === "") {
        alert("Please add a comment");
        return;
    }

    var encodeParam = "?rating=" + encodeURIComponent(ratingInput.value) +
        "&comment=" + encodeURIComponent(commentInput.value);

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState === 4) {
            alert(request.responseText);
        }
    };
    request.open("GET", "/review/add" + encodeParam, true);
    request.send();
}

function getReviewList() {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState === 4) {
            if (request.status === RESPONSE_OK) {
                createReviewList(JSON.parse(request.responseText));
            } else {
                // Do nothing
            }
        }
    };
    request.open("GET", "/review/all", true);
    request.send();
}

function getStarList(rating) {
    var div = getNewDiv();
    div.classList.add("review-rating");

    for(var i=0; i<5; i++) {
        var span = document.createElement("span");
        span.classList.add("fa", "fa-star");
        if(i<rating) {
            span.classList.add("checked");
        }
        div.appendChild(span);
    }
    return div;
}

function createReviewList(reviewObjArray) {
    var reviewContainer = document.getElementById("review-list");
    reviewContainer.innerHTML = "";

    reviewObjArray.forEach((review) => {
        var name = document.createElement("h4");
        name.classList.add("reviewer-name");
        name.innerText = review.customerName;

        var starRating = getStarList(review.rating);

        var divInfo = getNewDiv();
        divInfo.classList.add("reviewer-info");
        divInfo.appendChild(name);
        divInfo.appendChild(starRating);

        var divHeader = getNewDiv();
        divHeader.classList.add("review-header");
        divHeader.appendChild(divInfo);

        var comment = document.createElement("p");
        comment.innerText = review.comment;

        var divBody = getNewDiv();
        divBody.classList.add("review-body");
        divBody.appendChild(comment);

        var reviewItem = getNewDiv();
        reviewItem.classList.add("review-item");
        reviewItem.appendChild(divHeader);
        reviewItem.appendChild(divBody);

        reviewContainer.appendChild(reviewItem);
    });
}

// index.jsp

// user_auth.jsp

function login() {
    var un = document.getElementById("login-username");
    var pw = document.getElementById("login-password");

    var encodedUrl = "username=" + encodeURIComponent(un.value) +
        "&password=" + encodeURIComponent(pw.value);

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                window.history.back();
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/login", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(encodedUrl);
}

function validateUser(fn, ln, un, pw, cpw) {
    if(fn==="" || ln==="" || un==="" || pw==="") {
        alert("Please fill all the required fields.");
    } else if(un.length<4 || un.length>20) {
        alert("Username must be within 4-20 characters.");
    } else if(pw.length<4 || pw.length>20) {
        alert("Password must be within 4-20 characters.");
    } else if(pw !== cpw) {
        alert("Password does not match with confirm password.");
    } else {
        return true;
    }
    return false;
}

function register() {
    var fn = document.getElementById("First-name");
    var ln = document.getElementById("Last-name");
    var un = document.getElementById("register-Username");
    var pw = document.getElementById("register-password");
    var cpw = document.getElementById("register-confirm-password");

    if(!validateUser(fn.value, ln.value, un.value, pw.value, cpw.value)) {
        return;
    }

    var jsonForm = JSON.stringify({
        "fname": fn.value,
        "lname": ln.value,
        "username": un.value,
        "password": pw.value,
        "usertype": "CUSTOMER"
    });

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                alert("User registered successfully!");
                fn.value = "";
                ln.value = "";
                un.value = "";
                pw.value = "";
                cpw.value = "";
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/register", true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(jsonForm);
}

// user_auth.jsp

// order.jsp

function placeOrder() {
    var phoneEl= document.getElementById("phone");
    var addressEl= document.getElementById("address");
    var locationEl= document.getElementById("invoice-location");
    var orderTypeEl= document.getElementById("invoice-order-type");
    var paymentMethodEl = document.querySelector('input[name="paymentMethod"]:checked');

    if(phoneEl.value === "" || addressEl.value === "") {
        alert("Please fill contact details");
    } else if(locationEl.value == 0 || orderTypeEl.value == 0 ) {
        alert("Please select restaurant location and order type");
    } else if(invoiceItems.length === 0) {
        alert("Please add dishes to your order");
    } else {
        addContact(phoneEl, addressEl);
        addOrder(locationEl, orderTypeEl, paymentMethodEl);
    }
}

function addContact(phoneEl, addressEl) {
    var encodedUrl = "mobile=" + encodeURIComponent(phoneEl.value) +
        "&address=" + encodeURIComponent(addressEl.value);

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                phoneEl.value = "";
                addressEl.value = "";
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/update/contact", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(encodedUrl);
}

function createFoodListArray() {
    var foodList = [];

    invoiceItems.forEach((item) => {
        var obj = {};
        obj.id = item.id;
        obj.qty = item.quantity;
        foodList.push(obj);
    });

    return foodList;
}

function addOrder(locationEl, orderTypeEl, paymentMethodEl) {
    var jsonForm = JSON.stringify({
        "orderType": orderTypeEl.value,
        "branch": locationEl.value,
        "paymentMethod": paymentMethodEl.value,
        "foodList": createFoodListArray()
    });

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                alert("Order added successfully!");

                invoiceItems = [];
                total = 0;
                updateInvoice();
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/order/insert", true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(jsonForm);
}

// order.jsp