
<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class login_db extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    function no_existe_cuenta($sEmail, $sPass = '', $opc = 1) {
        if (empty($sEmail) or empty($opc)) {
            return true;
        }
        // no se puede validar
        if ($opc == 1) {
            // armamos la consulta
            $query = $this->db->query('SELECT email FROM usuarios WHERE username=?', array($sEmail));
        } elseif ($opc == 2) {
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
