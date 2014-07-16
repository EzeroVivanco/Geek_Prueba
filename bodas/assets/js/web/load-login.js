function ajaxloadjoin(){
    $('#myModal').foundation('reveal', 'open');
	$.ajax({
        type : "POST",
        url :  "/bodas/web/registro/index", 
        success : function(data){
        	$("#logincarga").html(data);
        } 
    }); 
    $(document).foundation();
}
function cerrar(){
    $(document).foundation();
	$('#myModal').foundation('reveal', 'close');
}