function ajaxlogin(){
  $.ajax({
    type: "POST",
    url: '/bodas/web/login/validar_form',
    dataType: "json",
    data: "email="+$("#username").val()+"&password="+$("#password").val(),                      
    success: function(data){
        if(data==false){
            $("#error_1").show("fast");
        }else{
           document.location='http://localhost//bodas/admin/dashboard';
        }
    }
  });
}

function ajaxjoin(){
  $.ajax({
    type: "POST",
    url: '/bodas/web/registro/registro_',
    dataType: "json",
    data: "email="+$("#username").val()+"&password="+$("#password").val(),
    success: function(data){
        if(data==false){
            $("#error_1").show("fast");
        }
        else{
          document.location='http://localhost//bodas/web/bienvenida/index';
        }
    }
  });
}    