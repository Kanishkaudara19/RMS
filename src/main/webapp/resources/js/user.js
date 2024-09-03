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
                createFoodList(JSON.parse(request.responseText));
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