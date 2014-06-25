<!doctype html>
<html class="no-js" lang="en">
    <meta charset="utf-8">
    <title>portalUsuarios</title>
    <!-- Ejemplo font de google -->
    <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
    <!-- Estilos -->
    <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.css" />
    <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
    <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
    <link rel="stt" href="<?php echo base_url() . CSS; ?>web/home.css" />
    <link rel="stylesheet" href="<?php echo base_url() . IMG; ?>web" />
    <!--<meta http-equiv="refresh" content="5">-->
</head>
<body onload = "carga()">
    <div class="top-bar">
        <ul class="title-area">
            <li><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/corazon.png"></a></li>
        </ul>
        <section class="top-bar-section">
            <ul class="left" id="centrar">
                <li class="texto"><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/define.png" class="imagen">Define</a></li>
                <li class="texto"><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/organiza.png" class="imagen">Organiza</a></li>
                <li class="texto"><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/actividades.png" class="imagen">Actividades</a></li>
                <li class="texto"><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/invitation.png" class="imagen">Invitados</a></li>
                <li class="texto"><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/mesa_regalos.png" class="imagen">Mesa de regalos</a></li>
                <li class="texto"><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/message.png" class="imagen">Mensajes</a></li>
            </ul>
            <ul class="right">

                <li><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/config.png" class="imagen">Ajustes</a></li>
                <li><a href="#"><img src="http://localhost/bodas/assets/img/web/dash/salir.png" class="imagen">Salir</a></li>
            </ul>
        </section>
        
    </div>
    <div class="left-bar">
        <div>
            <center>
                <p>Cuenta Regresiva</p>
                <span id="dias">00</span> <span id="horas">00</span> <span id="minutos">00</span><br />
                <span class="font">Dias</span> <span class="font">Horas</span> <span class="font">Minutos</span>
            </center>
        </div>
    </div>