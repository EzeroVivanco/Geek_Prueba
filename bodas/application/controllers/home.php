<?php
/**
 * GeekBucket 2014
 * Author: Alberto Vera Espitia
 * Define el comportamiento de home en la web publica
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL,"es_ES@euro","es_ES","esp");

class Home extends CI_Controller {

    public function __construct(){
        parent::__construct();
    }

    /**
     * Despliega la pantalla del home
     */
    public function index(){
        $this->load->view('web/vwLayout');
    }
    

}