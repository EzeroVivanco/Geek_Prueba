<!doctype html>
<!--
    GeekBucket 2014
    Autor: Shary Chuc Ku
    Ventana de registro para usuario
-->
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>registration</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
    </head>
    <body>
        <div class="callout panel" id="centrar">
            <?php
            $btSubmit = array(
                'name' => 'btSubmit',
                'id' => 'btSubmit',
                'value' => 'Registrarse',
                'class' => 'button expand',
                'onSubmit' => 'return ',
                'onclick'   => 'ajaxjoin()'
            );
            ?>
            <label>Correo Electronico<input type="email" name="username" id="username"></label>
            <label>Contraseña<input type="password" name="password" id="password" required pattern="[a-zA-Z-0-9]+"></label>
            <label>Confirmar Contraseña<input type="password" id="repeatPass" required pattern="[a-zA-Z-0-9]+" data-equalto="password"></label>
            <center><div data-alert class='alert-box alert round' id="error_1">Correo electronico ya registrado</div></center>
            <center><div data-alert class='alert-box alert round' id="error_2">el campo de contraseña o correo tiene espacios o estan vacios</div></center>
            <center><div data-alert class='alert-box alert round' id="error_3">Las contraseñas deben coincidir</div></center>
            <?php echo '<br/>', form_submit($btSubmit); ?>
        </div>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation/foundation.reveal.js"></script>
        <script src="<?php echo base_url() . FOUND; ?>js/foundation/foundation.js"></script>
        <script src="<?php echo base_url() . FOUND; ?>js/foundation/foundation.abide.js"></script>
        <script>$(document).foundation();</script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/validacion_contrasena.js"></script>
</html>