const RESPONSE_OK = 200;

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

function register() {
    var fn = document.getElementById("firstName");
    var ln = document.getElementById("lastName");
    var un = document.getElementById("username");
    var pw = document.getElementById("password");
    var ut = document.getElementById("userType");

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