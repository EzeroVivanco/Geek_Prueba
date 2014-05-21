<?php // if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Prueba extends CI_Controller {
    
    public function __contruct(){
        parent::controller();
        
    }
    public function index()
    {
        $this->load->model('query');
        $data = array(
            'persona' => $this->model->query->get_persona()
                );
        $this->load->view('peticion',$data);
    }
}
