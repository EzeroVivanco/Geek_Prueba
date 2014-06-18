<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

class Registro extends CI_controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('form');
        $this->load->library('form_validation');
        $this->load->model('login_db');
        $this->load->model('registro_db');
    }

    public function index() {
        $this->load->view('web/vwRegistro');
    }
    public function registro_() {
        if ($this->input->post('username')) {
            $sEmail = $this->input->post('username');
            $sPassword = $this->input->post('password');
            //hashteamos la contraseña
            if (!empty($sPassword))
                $sPass = md5($sPassword);
            if (!$this->registro_db->no_existe_cuenta($sEmail)) {
                $this->_cargar_registro_vista('<FONT COLOR=red>*</FONT>El correo <b>' . $sEmail . '</b> ya esta registrado');
            } else {
                $this->registro_db->nueva_cuenta($sEmail, $sPass);
                $this->_generar_sesion($sEmail);
                $this->load->view('web/vwLogin');
            }
        } else {
            $this->_cargar_registro_vista('<FONT COLOR=red>*</FONT> algo paso');
        }
    }

    function _cargar_registro_vista($sMsjError = '') {
        if (!empty($sMsjError)) {
            $datos['sMsjError'] = $sMsjError;
        }
        // cargamos  la interfaz
        $this->load->view('web/vwRegistro', $datos);
    }

    function _generar_sesion($sEmail = '[desconocido]', $SesLimite = 1) {
        // armamos un array con los datos de la sesion
        $arrSesion = array(
            'is_logged' => true,
            'email' => $sEmail,
            'seslimite' => time() + ($SesLimite * 60)// limite en minutos
        );
        // se establece la sesion
        $this->session->set_userdata('sesion_usuario', $arrSesion);
    }

}
