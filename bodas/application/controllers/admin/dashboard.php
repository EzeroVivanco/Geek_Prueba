<?php

/**
 * GeekBucket 2014
 * Author: Ramón Can Tepal
 * Controllador principal para el portal usuarios
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

Class Dashboard extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('admin/vwPortal');
    }

}
