<?php // if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Prueba extends CI_Controller {
    
    public function __contruct(){
        parent::controller();
        
    }
    public function index()
    {
        $this->load->database();
        $query = $this->db->query('SELECT * FROM  `usuarios`');
        $data['consulta']=$query;
        $this->load->view('peticion', $data);
    }
}
