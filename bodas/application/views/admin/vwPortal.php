<!doctype html>
<!-- 
    GeekBucket 2014
    Autor: Ramón Can Tepal
    Vista principal para el administrador
-->
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <title>portalUsuarios</title>
        <!-- Ejemplo font de google -->
        <link href='http://fonts.googleapis.com/css?family=Gilda+Display' rel='stylesheet' type='text/css'>
        <!-- Estilos -->
        <!--Llama a las diferentes hojas de estilo y javascript que se encuentran en la carpeta assets.-->
        <link rel="stylesheet" href="<?php echo base_url() . FOUND; ?>css/foundation.min.css" />
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/vendor/modernizr.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>web/home.css" />
        <link rel="stylesheet" href="<?php echo base_url() . CSS; ?>app/home.css" />
    </head>
    <!--Llama a la funcion Carga() que se encuentra en la carpeta assets/web/home.js.-->
    <body onload = "carga()">
        <!--Cargando a la vista actual la vista de vwHeader que se encuentra en la carperta de admin.-->
        <?php $this->load->view('admin/vwHeader'); ?>
        <!--Contenedor de las pestañas asignadas.-->
        <div id="container">
            <input id="tab-1" type="radio" name="tab-group" checked="checked" />
            <label for="tab-1">Ubicacion</label>
            <input id="tab-2" type="radio" name="tab-group" />
            <label for="tab-2">Informacion</label>
            <input id="tab-3" type="radio" name="tab-group" />
            <label for="tab-3">Proveedores</label>
            <!--Contenido de las pestañas-->
            <div id="content">
                <div id="content-1">
                    <!--En este apartado se puede modificar la informacion.-->
                    <p class="left">Lorem ipsum dolor sit amet, consectetur adipisicing elit, Voluptamum sit reprehenderit iusto harum  minima. Assemenda, accusamus, perspiciatis inventore tempora quipariatur quismam? Deleniti, placeat ea nostrum officiil obcaecati temporibus quop. Ullam, in adipisci autem at fugit ab tempore enim raione nesciunt alias corporis vitae quo quod nostrim itaque vero iure?</p>
                </div>

                <div id="content-2">
                    <!--En este apartado se puede modificar la informacion.-->
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, Voluptamum sit reprehenderit iusto harum  minima. Assemenda, accusamus, perspiciatis inventore tempora quipariatur quismam? Deleniti, placeat ea nostrum officiil obcaecati temporibus quop. Ullam, in adipisci autem at fugit ab tempore enim raione nesciunt alias corporis vitae quo quod nostrim itaque vero iure?
                    </p>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, Voluptamum sit reprehenderit iusto harum  minima. Assemenda, accusamus, perspiciatis inventore tempora quipariatur quismam? Deleniti, placeat ea nostrum officiil obcaecati temporibus quop. Ullam, in adipisci autem at fugit ab tempore enim raione nesciunt alias corporis vitae quo quod nostrim itaque vero iure?
                    </p>
                </div>
                <div id="content-3">
                    <!--En este apartado se puede modificar la informacion.-->
                    <p> Contenido de los proveedores
                    </p>
                </div>
            </div>
        </div>
        <!--Fin-->
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . FOUND; ?>js/foundation.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url() . JS; ?>web/home.js"></script>
    </body>
</html>