function logout() {
    $.ajax({
        type: "POST",
        url: '/bodas/web/login/logout',
        dataType: "json",
        success: function(data) {
        }
    });
    document.location = 'http://localhost//bodas/';
}    