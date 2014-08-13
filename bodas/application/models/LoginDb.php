<?php

/**
 * Geekbucket 2014
 * Autor: josé Luis Arrioja Zamudio
 * Verifica un usuarios registrado existente
 * */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
/* Abre la clase del modelo LoginDb */

class LoginDb extends CI_Model {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
    }

    /* inicia la funcion no_existe_cuenta */

    function dontExistMail($sEmail, $sPass = '', $opc = 1) {

        if (empty($sEmail) or empty($opc)) {/* verifica si los parametros estan vacios */
            return true; /* regresa un valor verdadero si alguno de los 2 parametros estan vacios */
        }

        if ($opc == 2) {/* verifica la opcion de funcion */
            // armamos la consulta
            $query = $this->db->query('SELECT email,password FROM usuarios WHERE email=? AND password=?', array($sEmail, $sPass)); /* almacena en la variable $query la sentencia query */
            /* la consulta traducida es "seleccionar los datos email y password de la tabla usuarios donde email y password sean iguales a los parametros" */
        }
        if ($query->num_rows() == 0) {/* con la variable query, ejecuta la funcion num_rows de codeigneiter para saber cuantas filas tiene la consulta */
            return true; /* regresa un valor verdadero */
        } else {
            return false; /* regresa un valor falso */
        }
    }

}
