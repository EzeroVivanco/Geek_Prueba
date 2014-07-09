<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>bienvenida</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
    </head>
    <body>
        <div class="large-4 columns" id="centrar">
            <div class="callout panel">
                <center>
                    <p>!Haz sido registrado con exito!</p>
                    <h2>BIENVENIDO</h2>
                    <br>
                    <a onclick="location.href = '<?php echo base_url('web/Registro/index2') ?>'" id="boton" class="button" >Continuar</a>
                </center>
            </div>
        </div>

        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>