<?php
<<<<<<< HEAD

if (!defined('BASEPATH')) {
=======
/**
* Geekbucket 2014
* Autor: josé Luis Arrioja Zamudio
* Verifica un usuarios registrado existente
**/
if (!defined('BASEPATH'))
>>>>>>> 42302bffbfd83a2a4ee1664500197976ffb03d1a
    exit('No direct script access allowed');
}

class login_db extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    function no_existe_cuenta($sEmail, $sPass = '', $opc = 1) {
        if (empty($sEmail) or empty($opc)) {
            return true;
        }

        if ($opc == 2) {
            // armamos la consulta
            $query = $this->db->query('SELECT email,password FROM usuarios WHERE email=? AND password=?', array($sEmail, $sPass));
        }
        if ($query->num_rows() == 0) {
            return true;
        } else {
            return false;
        }
    }

}
