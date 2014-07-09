<?php

/**
 * GeekBucket 2014
 * Author: Alberto Vera Espitia
 * Define el comportamiento del Dashboard en la app
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

Class Bienvenida extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('web/vwBienvenida');
    }

}
