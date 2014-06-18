<!doctype html>
<html class="no-js" lang="en">
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
                    echo form_open('web/Login/validar_form', array('id' => 'formlogin'));
                    $btSubmit = array(
                        'name' => 'btSubmit',
                        'id' => 'btSubmit',
                        'value' => 'Iniciar sesión',
                        'class' => 'button expand',
                    );
                    //imprimimos por php para tomar el nombre de las variables
                    echo '<label>Correo Electronico<input type="email" name="username" id="username"></label>';
                    echo '<label>Contraseña<input type="password" name="password" id="username" required pattern="[a-zA-Z-0-9]+"></label>';
                    //imrpimirmos el error si es que hay
                    if (!empty($sMsjError))
                        echo "<div class='div_error'>$sMsjError</div>";
                    echo '<br/>', form_submit($btSubmit);
                    echo form_close();
                    ?>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>