<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class registro_db extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

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
        echo $query->num_rows();
        if ($query->num_rows() == 0) {
            return true;
        } else {
            return false;
        }
    }

}
