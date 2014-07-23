$(function() {
	
    // Menus
    $(".goTo").click(function() { window.location = $(this).attr("ref"); });
    // Book Me In
    $(".bookmein").click(function() { showAppConteiner(); });
    
});