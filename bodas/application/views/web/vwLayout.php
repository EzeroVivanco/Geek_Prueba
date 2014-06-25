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
            <div class="row text-center">
                <div class="large-centered">
                    <h1>Publicidad</h1>
                </div>
            </div>   
        </div>
        <div class="panel">
            <div class="row">
                <div class="large-3 columns">
                    <div class="large-centered small-block-grid-1">
                        <h6>Siguenos
                            <a href ='https://www.facebook.com/pages/Geek-Bucket-Fabrica-de-software/165847196760102?fref=ts' ><img src="<?php echo base_url() . IMG; ?>web/facebook.png" width="20px" ></a>
                            <a href = "https://twitter.com/" ><img src="<?php echo base_url() . IMG; ?>web/twiter.png" width="35px"></a>
                            <a href = "#" ><img src="<?php echo base_url() . IMG; ?>web/p.png" width="35px"></a>
                            <a href = "http://instagram.com/" ><img src="<?php echo base_url() . IMG; ?>web/instagram.png" width="30px"></a>
                        </h6>
                    </div>
                </div>

                <div class="large-5 columns">
                    <div class="large-centered">
                        <img src="<?php echo base_url() . IMG; ?>web/honeymooners.png" width="400px">
                    </div> 
                </div>

                <div class="large-3 columns">
                    <div class="large-centered">
                        <div class="row">
                            <div class="small-10 columns">
                                <input class="small-2 columns text-center" type="text" placeholder="BUSCAR"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="small-10 columns">
                                <a onclick="location.href = '<?php echo base_url('web/Registro') ?>'" id="boton" class="button right" >Registrate</a>
                            </div>
                        </div>
                    </div>

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