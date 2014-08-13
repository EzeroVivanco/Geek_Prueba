function ajaxloadjoin() {
    $.ajax({
        type: "POST",
        url: "/bodas/web/registration/index",
        success: function(data) {
            if (data == false) {
                document.location = 'http://localhost/bodas/web/login/sesion';
            } else {
                $("#loginload").html(data);
                $("#button-login").hide();
            }
        }
    });
    $('#myModal').foundation('reveal', 'open');
}
function close() {
    $('#myModal').foundation('reveal', 'close');
}
function ajaxloadlogin() {
    $.ajax({
        type: "POST",
        url: "/bodas/web/login/index",
        success: function(data) {
            $("#loginload").html(data);
            $("#button-login").show();
        }
    });
}