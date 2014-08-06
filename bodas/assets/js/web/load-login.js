function ajaxloadjoin(){
	$.ajax({
        type : "POST",
        url :  "/bodas/web/registro/index", 
        success : function(data){
        	$("#logincarga").html(data);
            $("#boton-login").show();
        } 
    });
    $('#myModal').foundation('reveal', 'open');
}
function cerrar(){
	$('#myModal').foundation('reveal', 'close');
}
function ajaxloadlogin(){
    $.ajax({
        type : "POST",
        url :  "/bodas/web/login/index", 
        success : function(data){
            if(data==false){
                document.location='http://localhost/bodas/web/login/sesion';
            }else{
                $("#logincarga").html(data);
                $("#boton-login").hide();
            }
        } 
    });
}