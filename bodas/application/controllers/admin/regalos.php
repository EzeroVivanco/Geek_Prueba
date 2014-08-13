<?php

/**
 * GeekBucket 2014
 * Author: Shary Chuc Ku
 * Controllador para llamar la vista desde el portal
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

Class Regalos extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->view('admin/vwMesaRegalos');
    }

}
