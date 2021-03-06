<?php

/**
 * GeekBucket 2014
 * Author: Ramón Can Tepal
 * Controlador para la vista de bienvenida del website
 *
 */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
/* Establecer configuración regional al español */
setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");
/* habre la clase del controlador bienvenida */

Class Welcome extends CI_Controller {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
    }

    function index() {/* la funcion index es la predeterminada al ingresar al controlador sin especificar que funcion */
        $this->load->view('web/vwWelcome'); /* manda a visuzalizar la vista vwWelcome */
    }

}
