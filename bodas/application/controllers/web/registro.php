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

    public function index2() {
        $this->load->view('web/vwCrearBoda');
    }

    public function registro_() {
        if($this->input->is_ajax_request()){
            $sEmail = $this->input->post('email');
            $sPassword = $this->input->post('password');
            //hashteamos la contraseña
            if (!empty($sPassword)){
                    $sPass = md5($sPassword);
                }
            if (!$this->registro_db->no_existe_cuenta($sEmail)) {
                $data=false;
                $this->output->set_output(json_encode($data));
            } 
            else{
                $this->registro_db->nueva_cuenta($sEmail, $sPass);
                $this->_generar_sesion($sEmail);
                $data=true;
                $this->output->set_output(json_encode($data));
            }
        }
        else{
            $this->load->view('web/vwRegistro');
        }
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

    function _cargar_error($sMsjError = '') {
        if (!empty($sMsjError)) {
            $datos['sMsjError'] = $sMsjError;
        }
        // cargamos  la interfaz
        $this->load->view('web/vwCrearBoda', $datos);
    }

    //Creamos pareja nueva
    function nueva_pareja() {

        if (!empty($_POST['nombre']) && !empty($_POST['nombre_pareja'])) {
            $contenido = array(
                'nombre' => $_POST['nombre'],
                'nombre_pareja' => $_POST['nombre_pareja']
            );
            $this->registro_db->insertar_pareja($contenido);
            redirect(base_url() . 'admin/dashboard/');
        } else {
            $this->_cargar_error('Celda (s) vacia (s)');
        }
    }

}
