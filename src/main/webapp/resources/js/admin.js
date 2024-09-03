const RESPONSE_OK = 200;

// users.jsp - start

function login() {
    var un = document.getElementById("username");
    var pw = document.getElementById("password");

    var encodedUrl = "username=" + encodeURIComponent(un.value) +
        "&password=" + encodeURIComponent(pw.value);

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                window.location = "orders.jsp";
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/login", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(encodedUrl);
}

function validateUser(fn, ln, un, pw, ut) {
    if(fn==="" || ln==="" || un==="" || pw==="") {
        alert("Please fill all the required fields.");
    } else if(un.length<4 || un.length>20) {
        alert("Username must be within 4-20 characters.");
    } else if(pw.length<4 || pw.length>20) {
        alert("Password must be within 4-20 characters.");
    } else {
        return true;
    }
    return false;
}

function register() {
    var fn = document.getElementById("firstName");
    var ln = document.getElementById("lastName");
    var un = document.getElementById("username");
    var pw = document.getElementById("password");
    var ut = document.getElementById("userType");

    if(!validateUser(fn, ln, un, pw, ut)) {
        return;
    }

    var jsonForm = JSON.stringify({
        "fname": fn.value,
        "lname": ln.value,
        "username": un.value,
        "password": pw.value,
        "usertype": ut.value
    });

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                alert("User registered successfully!");
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/register", true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(jsonForm);
}

function updateUser() {
    var fn = document.getElementById("editFirstName");
    var ln = document.getElementById("editLastName");
    var un = document.getElementById("editMobile");
    var pw = document.getElementById("editPassword");
    var ut = document.getElementById("editUserType");

    if(!validateUser(fn, ln, un, pw, ut)) {
        return;
    }

    var jsonForm = JSON.stringify({
        "fname": fn.value,
        "lname": ln.value,
        "username": un.value,
        "password": pw.value,
        "usertype": ut.value
    });

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                alert("User updated successfully!");
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/update", true);
    request.setRequestHeader("Content-Type", "application/json");
    request.send(jsonForm);
}

function getUserList() {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                createUserList(JSON.parse(request.responseText));
            } else {
                // Do nothing
            }
        }
    };
    request.open("GET", "/user/all", true);
    request.send();
}

function createUserList(userObjArray) {
    var tbody = document.getElementById("user-data-table");
    tbody.innerHTML = "";
    var td;

    for (var i = 0; i < userObjArray.length; i++) {
        var user = userObjArray[i];
        var tr = document.createElement("tr");

        td = document.createElement("td");
        td.innerText = (i+1) + '';
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerText = user.fname + " " + user.lname;
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerText = user.username;
        tr.appendChild(td);

        td = document.createElement("td");
        td.innerText = user.usertype;
        tr.appendChild(td);

        var btn = document.createElement("button");
        btn.classList.add("btn", "btn-secondary", "btn-sm");
        btn.setAttribute("onClick", "openEditModal('"+ user.fname +"', '"+ user.lname +"', '"+ user.username +"', '"+ user.usertype +"');");
        btn.innerText = "Edit";

        td = document.createElement("td");
        td.appendChild(btn);
        tr.appendChild(td);

        tbody.appendChild(tr);
    }
}

// users.jsp - end

// foods.jsp - start

function addFood() {
    var food = document.getElementById("foodName");
    var price = document.getElementById("foodPrice");
    var img = document.getElementById("foodImage");

    if(food.value==="") {
        alert("Please enter the food name.");
        return;
    } else if(price.value==="") {
        alert("Please enter the price.");
        return;
    } else if(img.files.length === 0) {
        alert("Please select an image.");
        return;
    }

    var jsonForm = JSON.stringify({
        "name": food.value,
        "price": price.value
    });

    var form = new FormData();
    form.append("food", new Blob([jsonForm], {type: "application/json"}));
    form.append("image", img.files[0]);

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                alert("Food is added successfully!");
                food.value = "";
                price.value = "";
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/food/insert", true);
    request.send(form);
}

function getFoodList() {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
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
    var tbody = document.getElementById("food-data-table");
    tbody.innerHTML = "";
    var td;

    foodObjArray.forEach((food) => {
        var tr = document.createElement("tr");

        // Append Name
        td = document.createElement("td");
        td.innerText = food.name;
        tr.appendChild(td);

        // Append Price
        td = document.createElement("td");
        td.innerText = food.price;
        tr.appendChild(td);

        // Append Image
        var img = document.createElement("img");
        img.alt = food.name;
        img.src = "../uploads/foods/" + food.thumbnailUrl;

        td = document.createElement("td");
        td.appendChild(img);
        tr.appendChild(td);

        // Append Availability
        var select = document.createElement("select");
        select.setAttribute("onChange", "updateAvailability("+ food.id +");")
        select.id = "availability-select-" + food.id;

        var optionAv = document.createElement("option");
        optionAv.value = "1";
        optionAv.innerText = "Available";

        var optionUn = document.createElement("option");
        optionUn.value = "0";
        optionUn.innerText = "Unavailable";

        if(food.available === 1) {
            optionAv.setAttribute("selected", "true");
        } else {
            optionUn.setAttribute("selected", "true");
        }

        select.appendChild(optionAv);
        select.appendChild(optionUn);

        td = document.createElement("td");
        td.classList.add("availability-toggle");
        td.appendChild(select);
        tr.appendChild(td);

        // Append Table Row
        tbody.appendChild(tr);
    });
}

function updateAvailability(foodId) {
    var availability = document.getElementById("availability-select-" + foodId).value;

    var encodeParam = "?foodId="+ encodeURIComponent(foodId) +"&available=" + encodeURIComponent(availability);

    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if(request.readyState === 4) {
            if(request.status===RESPONSE_OK) {
                alert("Availability updated successfully!");
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("GET", "/food/update/availability" + encodeParam, true);
    request.send();
}

// foods.jsp - end