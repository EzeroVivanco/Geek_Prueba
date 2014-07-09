<!doctype html>
<html class="no-js" lang="en" id="todo">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
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
                <div align="center">
                    <?php
                    //cargamos un form de datos
                    $btSubmit = array(
                        'name' => 'btSubmit',
                        'id' => 'btSubmit',
                        'value' => 'Iniciar sesión',
                        'class' => 'button expand',
                        'onclick'   => 'prueba()'
                    );
                    //imprimimos por php para tomar el nombre de las variables
                    echo '<label>Correo Electronico<input type="email" name="username" id="username"></label>';
                    echo '<label>Contraseña<input type="password" name="password" id="password" required pattern="[a-zA-Z-0-9]+"></label>';
                    //imrpimirmos el error si es que hay
                    echo '<br/>', form_submit($btSubmit);
                    ?>
                    <center><div data-alert class='alert-box alert round' id="error_1">El <b> Correo </b> y la<b> Contraseña </b>no coinciden</div></center>
                </div>
            </div>
        </div>
        </script>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/validacion_contrasena.js"></script>
    </body>
</html>