
<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>login</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
    </head>
    <body>
        <div class="row" id="centrar">
            <div class="large-12 columns">
                 <!--<h4>Iniciar Sesion</h4><br/>-->
                <h5>Correo Electronico</h5>
                <input type="text"/>
                <h5>Contraseña</h5>
                <input type="password" id="password" required pattern="[a-zA-Z]+">
                <h5>Confirmar Contraseña</h5>
                <input type="password" id="repeatPass" required pattern="[a-zA-Z]+"><br/><br/>     
                <a  href="#"class="small round button" id="Join_button">Registrar</a><br/>
           
            </div>
                </div>   


        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>