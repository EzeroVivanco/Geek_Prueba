<?php

/**
 * GeekBucket 2014
 * Autor: Alberto Vera
 * Registros de catalogo.
 * */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

Class comercio_db extends CI_MODEL {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Obtiene todos los registros activos del catalogo
     * ejemplo de modelo
     */
    public function get($id) {
        $this->db->from('comercio');
        $this->db->where('id', $id);
        return $this->db->get()->result();
    }

}

//end model