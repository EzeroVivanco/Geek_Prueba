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
            <div class="row">
                <div class="small-3 small-centered columns">
                    <h1>Publicidad</h1>
                </div>
            </div>   
        </div>


        <div class="contain-to-grid fond">
            <div class="row small-centered columns">
                <div class="small-2 large-4 columns" id="borde">
                    <img src="<?php echo base_url() . IMG; ?>web/siguenos.png" width="150px" >
                    <a href ='https://www.facebook.com/pages/Geek-Bucket-Fabrica-de-software/165847196760102?fref=ts' ><img src="<?php echo base_url() . IMG; ?>web/facebook.png" width="20px"></a>
                    <a href = "https://twitter.com/" ><img src="<?php echo base_url() . IMG; ?>web/twiter.png" width="35px"></a>
                    <a href = "#" ><img src="<?php echo base_url() . IMG; ?>web/p.png" width="35px"></a>
                    <a href = "http://instagram.com/" ><img src="<?php echo base_url() . IMG; ?>web/instagram.png" width="34px"></a>
                </div>
                <div class="small-4 large-4 columns">
                    <img src="<?php echo base_url() . IMG; ?>web/honeymooners.png">
                </div>
                <div class="small-6 large-4 columns">
                    <div class="row ">
                        <div class="small-10 small-centered columns">
                            <input class="text-center" type="text" id="borde" placeholder="BUSCADOR"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class=" panel">


        </div>

        <div class="contain-to-grid fond">
            <div class="row">
                <div class="small-2 large-4 columns"></div>
                <div class="small-4 large-4 columns"></div>
                <div class="small-6 large-4 columns text-center">
                    <a onclick="location.href = '<?php echo base_url('web/Registro') ?>'"><img src="<?php echo base_url() . IMG; ?>web/registrate_1.png" width="220px"></a>
                </div>
            </div>

        </div>
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <!-- Funcionalidad JS de la pagina -->
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </div>
</body>
</html>