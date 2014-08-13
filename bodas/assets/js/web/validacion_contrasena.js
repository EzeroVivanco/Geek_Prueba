function ajaxlogin() {
    $.ajax({
        type: "POST",
        url: '/bodas/web/login/validate_form',
        dataType: "json",
        data: "email=" + $("#username").val() + "&password=" + $("#password").val(),
        success: function(data) {
            if (data == false) {
                $("#error_1").show("fast");
            } else {
                document.location = 'http://localhost/bodas/admin/dashboard';
            }
        }
    });
}

function ajaxjoin() {
    var pass1 = $("#password").val();
    var pass2 = $("#repeatPass").val();
    if (pass1 != pass2) {
        $("#error_3").show("fast");
    }
    else {
        var space = false;
        var cont = 0;
        while (!space && (cont < pass1.length)) {
            if (pass1.charAt(cont) == " ") {
                space = true;
                cont++;
            }
        }
        if (space) {
            $("#error_2").show("fast");
        }
        else {
            $.ajax({
                type: "POST",
                url: '/bodas/web/registration/register',
                dataType: "json",
                data: "email=" + $("#username").val() + "&password=" + $("#password").val(),
                success: function(data) {
                    if (data == false) {
                        $("#error_1").show("fast");
                    }
                    else {
                        document.location = 'http://localhost/bodas/web/welcome/index';
                    }
                }
            });
        }
    }
}    