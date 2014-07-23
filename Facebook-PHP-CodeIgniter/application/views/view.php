<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>Facebook</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
    </head>
    <body>  
        <div class="text-center">
            <h1>Facebook</h1>
            <?php if (@$user_profile): ?>
                <pre>
                    <?php echo print_r($user_profile, TRUE) ?>
                </pre>
                <a href="<?= $logout_url ?>">Logout</a>
            <?php else: ?>
                <h2>...Bienvenido...</h2>
                <a href="<?= $login_url ?>" class="">Login</a>
            <?php endif; ?>
        </div>
    </body>
</html>  