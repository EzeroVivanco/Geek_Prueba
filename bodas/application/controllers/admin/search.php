<?php

/**
 * GeekBucket 2014
 * Author: Shary Chuc Ku
 * Define el comportamiento del Dashboard en la app
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/* Establecer configuración regional al español */
setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");
/* habre la clase del controlador buscador */

Class Search extends CI_Controller {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
    }

    function index() {/* la funcion index es la predeterminada al ingresar al controlador sin especificar que funcion */
        $this->load->view('web/vwSearch'); /* manda a visuzalizar la vista vwSearch */
    }

}
