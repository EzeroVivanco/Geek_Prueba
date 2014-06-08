<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>registro</title>
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
            <div class="callout panel">
                <label>Correo Electronico
                    <input type="text"/>
                </label>
                <label>Contraseña
                    <input type="password" id="password" required pattern="[a-zA-Z]+">
                </label>
                <label>Confirmar Contraseña
                    <input type="password" id="repeatPass" required pattern="[a-zA-Z]+">
                </label>
                <div align="center"><a  href="#"class="button expand">Iniciar Sesion</a></div>
            </div></div>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>