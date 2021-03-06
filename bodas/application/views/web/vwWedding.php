<!doctype html>
<!--
    GeekBucket 2014
    Autor: Ramón Can Tepal
    Ventana para el registro de la boda
-->
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>wedding</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
    </head>
    <body>
        <form action="<?php echo base_url() ?>web/registration/new_couple" method="post">
            <div id="centrar" class="large-4 columns">
                <div class="callout panel">
                    <label>Tu nombre
                        <input type="text" name="name"/>
                    </label>
                    <label>Tu pareja
                        <input type="text" name="name_couple"/>
                    </label>
                    <br>
                    <?php
                    if (!empty($sMsjError)) {
                        echo "<center><div data-alert class='alert-box alert round'>$sMsjError</div></center>";
                    }
                    ?>
                    <input type="submit" value="Añadir" class="button expand"/>
                    </form>
                    <br>
                    <a onclick='location.href = "<?php echo base_url('web/wedding/information'); ?>"' class="button expand">Capturar mas información</a>
                </div>
            </div>
            <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
            <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
            <!-- Funcionalidad JS de la pagina -->
            <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>