<?php

/**
 * GeekBucket 2014
 * Author: Ramón Can Tepal
 * Llama a la vista para crear boda
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

Class CrearBoda extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('web/vwCrearBoda');
    }
    public function informacion() {
        $this->load->view('web/vwInformacion');
    }

}
