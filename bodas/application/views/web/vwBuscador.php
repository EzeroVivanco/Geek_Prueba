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
        <div class="text-center" id="centrar">
            <script>
                (function() {
                    var cx = '007105476985655273527:kfjjxtmiojy';
                    var gcse = document.createElement('script');
                    gcse.type = 'text/javascript';
                    gcse.async = true;
                    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
                            '//www.google.com/cse/cse.js?cx=' + cx;
                    var s = document.getElementsByTagName('script')[0];
                    s.parentNode.insertBefore(gcse, s);
                })();
            </script>
            <gcse:search></gcse:search>

        </div>
    </div>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation/foundation.reveal.js"></script>
    <!-- Funcionalidad JS de la pagina -->
    <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/validacion_contrasena.js"></script>
    <script src="<?php echo base_url() . FOUND; ?>js/foundation/foundation.js"></script>
    <script src="<?php echo base_url() . FOUND; ?>js/foundation/foundation.abide.js"></script>
    <script>$(document).foundation();</script>
</body>
</html>