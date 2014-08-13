<?php

/**
 * GeekBucket 2014
 * Autor: josé Luis Arrioja Zamudio
 * Crea nuevos usuarios.
 * */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

/* Abre la clase del modelo RegistrationDb */

class RegistrationDb extends CI_Model {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
    }

    /* inicia la funcion nueva_cuenta */

    function nueva_cuenta($sEmail, $sPass = '') {
        $datos = array(
            'email' => $sEmail,
            'password' => $sPass
        ); /* almacena los parematros del email y el password */
        $this->db->insert('usuarios', $datos); /* con la funcion de insert de codeigneiter se insertan los datos del array */
    }

    /* inicia la funcion no_existe_cuenta */

    function no_existe_cuenta($sEmail) {
        // armamos la consulta
        $query = $this->db->query('SELECT email FROM usuarios WHERE email=?', array($sEmail)); /* se almacena la sentencia del query en la variable $query */
        /* la consulta traducida es "seleccionar los datos email de la tabla usuarios donde email sea igual al parametro" */
        if ($query->num_rows() == 0) {/* con la funcion de codeigneiter de num_rows regresa la cantidad de filas que dia de respuesta */
            return true; /* regresa un valor verdadero */
        } else {
            return false; /* regresa un valor falso */
        }
        return $query;
    }

    /* inica la funcion insertar_pareja */

    function insertar_pareja($contenido) {
        $this->db->update('usuarios', $contenido); /* con la funcion update de codeigneiter se actuliza la tabla con los datos de las parejas */
        return $this->db->insert_id(); /* regresa el id de la insercion */
    }

}
