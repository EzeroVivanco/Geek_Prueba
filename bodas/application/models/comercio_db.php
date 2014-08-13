<?php 
/**
* GeekBucket 2014
* Autor: José Luis Arrioja Zamudio
* Registros de catalogo.
**/
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
Class comercio_db extends CI_MODEL
{
 
    public function __construct(){
        parent::__construct();
    }
 

    public function get($id){
        $this->db->from('comercio');
        $this->db->where('id', $id);
        return  $this->db->get()->result();
    }


}
//end model