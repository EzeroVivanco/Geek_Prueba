<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
Class bodas_db extends CI_MODEL
{
 
    public function __construct(){
        parent::__construct();
    }
 
    /**
     * Obtiene todos los registros activos del catalogo
     */
    public function get($id){
        $this->db->from('usuarios');
        $this->db->where('id', $id);
        return  $this->db->get()->result();
    }


}
//end model