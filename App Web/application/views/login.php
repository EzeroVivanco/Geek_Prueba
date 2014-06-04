<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Wedding Planner</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <script src="js/vendor/modernizr.js"></script>
    <script language="javascript" src="js/jquery-1.3.2.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" media="screen" />
  </head>
  <body>
  <script language="javascript">
        $(document).ready(function(){
            $('#login').hide('fast');
            $('#join').hide('fast');
            $('#Join_button').click(function (){
                $('#join').show('clip', { direction: "vertical" }, 1000);
                $('#login').hide('clip', { direction: "horizontal" }, 1000);
            })
            estado=0;						   
            $("#login_button").click(function () { 
               if(estado==1) {
                 $('#login').show("blind", { direction: "vertical" }, 1000);
                 estado=0;
              } else {
                 $('#login').hide("blind", { direction: "vertical" }, 1000);
                 estado=1;
              }
            });
        });
</script>
  <center>
      <div id="panel_login_join" class="panel">
          <a class="small round button" id="login_button" aling="right">Iniciar Sesion</a><br/>
          <center>
              <div id="login" class="panel">
                   <h4>Iniciar Sesion</h4>
                   <h5>Usuario</h5>
                   <input type="text" placeholder="Usuario/Correo"/>
                   <h5>Contraseña</h5>
                   <input type="password" id="password" required pattern="[a-zA-Z]+" placeholder="Contraseña" style="margin-bottom: 0px">
                   <small><a href="#" >Olvide mi contraseña</a></small><br/>
                   <a  href="#"class="small round button" id="Join_button" aling="left">Registrar</a><br/>
               </div>
          </center>
      </div>
  </center>
  </body>
</html>
