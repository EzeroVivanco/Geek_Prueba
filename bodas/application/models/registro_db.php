<?php
<<<<<<< HEAD

if (!defined('BASEPATH')) {
=======
/**
* GeekBucket 2014
* Autor: josé Luis Arrioja Zamudio
* Crea nuevos usuarios.
**/
if (!defined('BASEPATH'))
>>>>>>> 42302bffbfd83a2a4ee1664500197976ffb03d1a
    exit('No direct script access allowed');
}

class registro_db extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    //Crea una nueva cuenta
    function nueva_cuenta($sEmail, $sPass = '') {
        $datos = array(
            'email' => $sEmail,
            'password' => $sPass
        );
        $this->db->insert('usuarios', $datos);
    }

    function no_existe_cuenta($sEmail) {
        // armamos la consulta
        $query = $this->db->query('SELECT email FROM usuarios WHERE email=?', array($sEmail));
        if ($query->num_rows() == 0) {
            return true;
        } else {
            return false;
        }
        return $query;
    }

    //Insercion de pareja
    function insertar_pareja($contenido) {
        $this->db->update('usuarios', $contenido);
        return $this->db->insert_id();
    }

}
