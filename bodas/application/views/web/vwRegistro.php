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
                <?php
                echo form_open('web/Registro/registro_', array('id' => 'formlogin'));
                $btSubmit = array(
                    'name' => 'btSubmit',
                    'id' => 'btSubmit',
                    'value' => 'Registrarse',
                    'class' => 'button expand',
                    'onSubmit' => 'return '
                );
                echo '<label>Correo Electronico<input type="email" name="username" id="username"></label>';
                echo '<label>Contraseña<input type="password" name="password" id="username" required pattern="[a-zA-Z-0-9]+"></label>';
                echo '<label>Confirmar Contraseña<input type="password" id="repeatPass" required pattern="[a-zA-Z-0-9]+"></label>';
                if (!empty($sMsjError))
                    echo "<center><div data-alert class='alert-box alert round'>$sMsjError</div></center>";
                echo '<br/>', form_submit($btSubmit);
                echo form_close();
                ?>
                <center><a onclick="location.href = '<?php echo base_url('web/Login') ?>'">Iniciar Sesion</a></center>
            </div>
        </div>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>