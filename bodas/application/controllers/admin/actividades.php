<?php

/**
 * GeekBucket 2014
<<<<<<< HEAD
 * Author: Alberto Vera Espitia
=======
 * Author: Shary Chuc Ku
 * Controllador para llamar la vista desde el portal
>>>>>>> 42302bffbfd83a2a4ee1664500197976ffb03d1a
 *
 */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

Class Actividades extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {

        $this->load->view('admin/vwActividades');
    }

}
