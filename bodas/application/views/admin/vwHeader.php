<div class="fixed">
    <nav class="top-bar" data-topbar>
        <ul class="title-area left">
            <li><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/corazon.png" class="imagen1"></a></li>
        </ul>
        <section class="top-bar-section">
            <ul class="left">
                <li class="texto"><a onclick="location.href = '<?php echo base_url('admin/definir/index') ?>'"><img src="<?php echo base_url() . IMG; ?>web/dash/define.png" class="imagen" >Define</a></li>
                <li class="texto"><a onclick="location.href = '<?php echo base_url('admin/organiza/index') ?>'"><img src="<?php echo base_url() . IMG; ?>web/dash/organiza.png" class="imagen">Organiza</a></li>
                <li class="texto"><a onclick="location.href = '<?php echo base_url('admin/actividades/index') ?>'"><img src="<?php echo base_url() . IMG; ?>web/dash/actividades.png" class="imagen">Actividades</a></li>
                <li class="texto"><a onclick="location.href = '<?php echo base_url('admin/invitados/index') ?>'"><img src="<?php echo base_url() . IMG; ?>web/dash/invitation.png" class="imagen">Invitados</a></li>
                <li class="texto"><a onclick="location.href = '<?php echo base_url('admin/regalos/index') ?>'"><img src="<?php echo base_url() . IMG; ?>web/dash/mesa_regalos.png" class="imagen">Mesa de regalos</a></li>
                <li class="texto"><a onclick="location.href = '<?php echo base_url('admin/mensajes/index') ?>'"><img src="<?php echo base_url() . IMG; ?>web/dash/message.png" class="imagen">Mensajes</a></li>
            </ul>
            <ul class="right">
                <li><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/config.png" class="imagen">Ajustes</a></li>
                <li><a href="#"><img src="<?php echo base_url() . IMG; ?>web/dash/salir.png" class="imagen">Salir</a></li>
            </ul>
        </section>
    </nav>
</div>
<div class="left-bar">
    <div>
        <center>
            <br/>
            <br/>
            <br />
            <p>Cuenta Regresiva</p>
            <span id="dias">00</span> <span id="horas">00</span> <span id="minutos">00</span><br />
            <span class="font">Dias</span> <span class="font">Horas</span> <span class="font">Minutos</span>
        </center>
    </div>
</div>