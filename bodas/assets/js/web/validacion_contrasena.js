function prueba(){
  $.ajax({
    type: "POST",
    url: '/bodas/web/login/validar_form',
    dataType: "json",
    data: "email="+$("#username").val()+"&password="+$("#password").val(),                      
    success: function(data){
        if(data==false){
            $("#error_1").show("slow");
        }else{
           document.location='http://localhost//bodas/admin/dashboard';
        }
    }
  });
}   