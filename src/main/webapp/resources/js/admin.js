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
                window.location = "dashboard.jsp";
            } else {
                alert(request.responseText);
            }
        }
    };
    request.open("POST", "/user/login", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send(encodedUrl);
}