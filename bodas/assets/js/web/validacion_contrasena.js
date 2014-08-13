function ajaxlogin() {
    $.ajax({
        type: "POST",
        url: '/bodas/web/login/validar_form',
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
    var pass1 = document.getElementById("#password").value;
    var pass2 = document.getElementById("#repeatPass").value;
    if (pass1 != pass2) {
        $("#error_3").show("fast");
    }
    else {
        var espacios = false;
        var cont = 0;
        while (!espacios && (cont < pass1.length)) {
            if (pass1.charAt(cont) == " ") {
                espacios = true;
                cont++;
            }
        }
        if (espacios) {
            $("#error_2").show("fast");
        }
        else {
            $.ajax({
                type: "POST",
                url: '/bodas/web/registro/registro_',
                dataType: "json",
                data: "email=" + $("#username").val() + "&password=" + $("#password").val(),
                success: function(data) {
                    if (data == false) {
                        $("#error_1").show("fast");
                    }
                    else {
                        document.location = 'http://localhost/bodas/web/bienvenida/index';
                    }
                }
            });
        }
    }
}    