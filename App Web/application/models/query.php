<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class query extends CI_Model{
    
    public function __construct() {
        parent::__construct();
    }
        public function get_persona()
    {
        $query = $this->db->query('SELECT * FROM  `usuarios`');
//        return $query->result_array();
    }
}
