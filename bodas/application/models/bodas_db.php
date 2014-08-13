
<?php 
/**
* GeekBucket 2014
* Autor: José Luis Arrioja Zamudio
* Consulta de usuarios.
**/
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
Class bodas_db extends CI_MODEL
{
 
    public function __construct(){
        parent::__construct();
    }
 
    
    public function get($id){
>>>>>>> 42302bffbfd83a2a4ee1664500197976ffb03d1a
        $this->db->from('usuarios');
        $this->db->where('id', $id);
        return $this->db->get()->result();
    }

}

//end model