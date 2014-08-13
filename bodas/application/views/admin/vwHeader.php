<!--
    GeekBucket 2014
    Autor: Ramón Can Tepal.
    Contenido de la cabezera del documento del Administrador
-->
<!--Cabecera de la vista vwPortal, aqui se cargan las imagenes que contiene cada pestaña del menu.-->
<div class="fixed">
    <nav class="top-bar" data-topbar>
        <ul class="title-area left">
            <li><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/corazon.png" class="imagen1"></a></li>
        </ul>
        <section>
            <ul class="list-menu-left">
                <li class="item"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/define.png" class="imagen"><br />Define</a></li>
                <li class="item"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/organiza.png" class="imagen"><br />Organiza</a></li>
                <li class="item"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/actividades.png" class="imagen"><br/>Actividades</a></li>
                <li class="item"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/invitation.png" class="imagen"><br/>invitados</a></li>
                <li class="item"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/mesa_regalos.png" class="imagen"><br/>Mesa de regalos</a></li>
                <li class="item"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/message.png" class="imagen"><br />Mensajes</a></li>

            </ul>
            <ul class="list-menu-right">
                <li class="item-right"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/config.png" class="imagen-right"><br />Ajustes</a></li>
                <li class="item-right"><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/salir.png" class="imagen-right"><br />Salir</a></li>
            </ul>


        </section>
    </nav>
</div>
<!--Diseño de la barra del lado izquierdo donde se hace el cronometro de conteo de la fecha actual a la fecha de la boda.-->
<div class="left-bar">
    <div>
        <center>
            <br/>
            <br/>
            <br/>
            <p>Cuenta Regresiva</p>
            <span id="days">00</span> <span id="hours">00</span> <span id="minutes">00</span><br />
            <span class="font">Dias</span> <span class="font">Horas</span> <span class="font">Minutos</span>
        </center>
    </div>
</div>
<div class="row">
</div>