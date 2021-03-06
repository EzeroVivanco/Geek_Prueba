<!doctype html>
<!--
    GeekBucket 2014
    Autor: Shary Chuc Ku
    Ventana de la informacion del usuarios
-->
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>information</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
    </head>
    <body>
        <div id="centrar" class="large-4 columns">
            <div class="callout panel">
                <label>Nombre de Usuario
                    <input type="text" name="username"/>
                </label>
                <label>Status
                    <input type="text" name="status"/>
                </label>
                <br>
                <!--                <a href="application/controllers/registra_evento.php" class="button expand">Finalizar</a>-->
                <a onclick="location.href = '<?php echo base_url('admin/dashboard') ?>'" class="button expand">Finalizar</a>
                <br/>
            </div>
        </div>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>
