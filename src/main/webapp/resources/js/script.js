
jQuery(document).ready(function ($) {
    "use strict";

    //Contact
    $('form.contactForm').submit(function () {

        var f = $(this).find('.form-group'),
            ferror = false,
            emailExp = /^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i;

        f.children('input').each(function () { // run all inputs

            var i = $(this); // current input
            var rule = i.attr('data-rule');

            if (rule !== undefined) {
                var ierror = false; // error flag for current input
                var pos = rule.indexOf(':', 0);
                if (pos >= 0) {
                    var exp = rule.substr(pos + 1, rule.length);
                    rule = rule.substr(0, pos);
                } else {
                    rule = rule.substr(pos + 1, rule.length);
                }

                switch (rule) {
                    case 'required':
                        if (i.val() === '') { ferror = ierror = true; }
                        break;

                    case 'minlen':
                        if (i.val().length < parseInt(exp)) { ferror = ierror = true; }
                        break;

                    case 'email':
                        if (!emailExp.test(i.val())) { ferror = ierror = true; }
                        break;

                    case 'checked':
                        if (!i.attr('checked')) { ferror = ierror = true; }
                        break;

                    case 'regexp':
                        exp = new RegExp(exp);
                        if (!exp.test(i.val())) { ferror = ierror = true; }
                        break;
                }
                i.next('.validation').html((ierror ? (i.attr('data-msg') !== undefined ? i.attr('data-msg') : 'wrong Input') : '')).show('blind');
            }
        });
        f.children('textarea').each(function () { // run all inputs

            var i = $(this); // current input
            var rule = i.attr('data-rule');

            if (rule !== undefined) {
                var ierror = false; // error flag for current input
                var pos = rule.indexOf(':', 0);
                if (pos >= 0) {
                    var exp = rule.substr(pos + 1, rule.length);
                    rule = rule.substr(0, pos);
                } else {
                    rule = rule.substr(pos + 1, rule.length);
                }

                switch (rule) {
                    case 'required':
                        if (i.val() === '') { ferror = ierror = true; }
                        break;

                    case 'minlen':
                        if (i.val().length < parseInt(exp)) { ferror = ierror = true; }
                        break;
                }
                i.next('.validation').html((ierror ? (i.attr('data-msg') != undefined ? i.attr('data-msg') : 'wrong Input') : '')).show('blind');
            }
        });
        if (ferror) return false;
        else var str = $(this).serialize();
        $.ajax({
            type: "POST",
            url: "contactform/contactform.php",
            data: str,
            success: function (msg) {
                // alert(msg);
                if (msg == 'OK') {
                    $("#sendmessage").addClass("show");
                    $("#errormessage").removeClass("show");
                }
                else {
                    $("#sendmessage").removeClass("show");
                    $("#errormessage").addClass("show");
                    $('#errormessage').html(msg);
                }

            }
        });
        return false;
    });

});

// menu

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}



(function ($) {

    // Menu filer
    $("#menu-flters li a").click(function () {
        $("#menu-flters li a").removeClass('active');
        $(this).addClass('active');

        var selectedFilter = $(this).data("filter");
        //  $("#menu-wrapper").fadeTo(100, 0);

        $(".menu-restaurant").fadeOut();

        setTimeout(function () {
            $(selectedFilter).slideDown();
            //$("#menu-wrapper").fadeTo(300, 1);
        }, 300);
    });

    // Add smooth scrolling to all links in navbar + footer link
    $(".sidenav a").on('click', function (event) {
        var hash = this.hash;
        if (hash) {
            event.preventDefault();
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 900, function () {
                window.location.hash = hash;
            });
        }

    });

    $(".sidenav a").on('click', function () {
        closeNav();
    });

})(jQuery);


