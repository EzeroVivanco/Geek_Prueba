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
    <style type="text/css">
    .left-bar{
    width: 10%;
    height: 100%;   
    background: #288D6D;
    color: white;
    }
    .font{
        font-size: 10px;
        color: white;
        background: #288D6D;
    }
    span{
        font-size: 30px;
        color: white;
        width: 10px;
        background: rgb(33,165,92); /* Old browsers */
background: -moz-linear-gradient(top,  rgba(33,165,92,1) 0%, rgba(25,109,20,1) 50%, rgba(29,107,17,1) 51%, rgba(33,165,92,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(33,165,92,1)), color-stop(50%,rgba(25,109,20,1)), color-stop(51%,rgba(29,107,17,1)), color-stop(100%,rgba(33,165,92,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  rgba(33,165,92,1) 0%,rgba(25,109,20,1) 50%,rgba(29,107,17,1) 51%,rgba(33,165,92,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  rgba(33,165,92,1) 0%,rgba(25,109,20,1) 50%,rgba(29,107,17,1) 51%,rgba(33,165,92,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  rgba(33,165,92,1) 0%,rgba(25,109,20,1) 50%,rgba(29,107,17,1) 51%,rgba(33,165,92,1) 100%); /* IE10+ */
background: linear-gradient(to bottom,  rgba(33,165,92,1) 0%,rgba(25,109,20,1) 50%,rgba(29,107,17,1) 51%,rgba(33,165,92,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#21a55c', endColorstr='#21a55c',GradientType=0 ); /* IE6-9 */

        border-top: -40px;
    }
    </style>
    <script type="text/javascript">
    //Esta funcion de javascript hara que en el cronometro surgan cambios.
        function carga(){

            contador_s = 0;
            contador_m = 0;
            contador_h = 22;
            contador_d = 0;
            s = 0; //Inicio el segundo para comenzar a contar el tiempo
            m = document.getElementById("minutos");
            h = document.getElementById("horas");
            d = document.getElementById("dias");

            window.setInterval(
                function()
                {
                    
                    
                    if(contador_s ==  60){
                        contador_s = 0;
                        contador_m++;
                        if(contador_m == 60){
                            contador_m = 0;
                            contador_h++;
                            if(contador_h == 24){
                                contador_h = 0;
                                contador_d++;
                                d.innerHTML = contador_d;
                            }
                            m.innerHTML = "0" + contador_m;
                            if(contador_h < 10){
                                h.innerHTML = "0"+  contador_h;
                            }else{
                                h.innerHTML = contador_h;
                            }

                        }else{
                            if(contador_m < 10){
                            m.innerHTML = "0"+contador_m;
                        }else{
                            m.innerHTML = contador_m;
                        }
                        }
                    }
                    
                    
                    contador_s++;
                }
                ,1);
        }
    </script>
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