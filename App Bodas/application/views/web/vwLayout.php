<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>layout</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
    </head>
    <body>
        <!--Header-->
        <div class="panel">
            <center>
                <h1>Publicidad</h1>
            </center>
        </div>
        <div class="panel">
            <div class="panel-layout">
                <center>
                    <h5>SIGUENOS 
                        <a href ='https://www.facebook.com/pages/Geek-Bucket-Fabrica-de-software/165847196760102?fref=ts' ><img src="<?php echo base_url() . IMG; ?>web/facebook.png" width="20" ></a>
                        <a href = "https://twitter.com/" ><img src="<?php echo base_url() . IMG; ?>web/twiter.png" width="35"></a>
                        <a href = "#" ><img src="<?php echo base_url() . IMG; ?>web/p.png" width="35"></a>
                        <a href = "http://instagram.com/" ><img src="<?php echo base_url() . IMG; ?>web/instagram.png" width="30"></a>
                        <img src="<?php echo base_url() . IMG; ?>web/honeymooners.png" width="400">
                 
                    </h5>
                       <div class="search-label right-align">
                            <input type="text" placeholder="BUSCAR">			
                        </div>	
                </center>
            </div>
            <a onclick="location.href = '<?php echo base_url('web/Registro') ?>'" id="boton" class="button right" >Registrate</a>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>