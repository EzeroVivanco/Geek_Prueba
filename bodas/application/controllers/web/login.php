<?php

/**
 * GeekBucket 2014
 * Author: Jose Luis Arrioja Zamudio
 * Define la adaptacion de los formatos para ingrear
 *
 */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
/* Establecer configuración regional al español */
setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");
/* habre la clase del controlador login */

class Login extends CI_Controller {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
        $this->load->model('LoginDb'); /* cargando el archivo del modelo */
    }

    public function index() {/* la funcion index es la predeterminada al ingresar al controlador sin especificar que funcion */
        if ($this->input->is_ajax_request()) {/* condiciona si la llamada de la funcion es atraves de una funcion ajax */
            if ($this->session->userdata('sesionUser')) {/* verifica si hay una variable de sesion llamada sesion_usuario */
                return false; /* retorna la condicion de la funcion a la funcion ajax */
            } else {
                $this->load->view('web/vwLogin'); /* manda a vizualizar la vista vwLogin */
            }
        }
    }

    /* inicia funcion sesion */

    public function sesion() {
        if ($this->session->userdata('sesionUser')) {/* verifica si hay una variable de sesion llamada sesion_usuario */
            $this->load->view('admin/vwPortal'); /* manda a vizualizar la vista vwPortal */
        }
    }

    /* inicia funcion logout */

    public function logout() {
        if ($this->input->is_ajax_request()) {/* condiciona si la llamada de la funcion es atraves de una funcion ajax */
            $this->session->unset_userdata('sesionUser'); /* manda a destruir a variable de sesion llamada sesion_usuario */
        }
    }

    /* inicia funcion validar_form  */

    public function validateForm() {

        if ($this->input->is_ajax_request()) {/* condiciona si la llamada de la funcion es atraves de una funcion ajax */
            /* carga los datos a las variables de email y password */
            $sEmail = $this->input->post('email'); /* carga el post email en la variable $sEmail */
            $sPassword = $this->input->post('password'); /* carga el post password en la variable $sPassword */
            if (!empty($sPassword)) {/* verifica si la variable $sPassword esta vacia */
                $sPass = md5($sPassword); /* asigna a la variable $sPass el hashing MD5 de la variable $sPassword */
            }
            $sesLimit = 1; //limite de tiempo para la sesion
            if ($this->LoginDb->dontExistMail($sEmail, $sPass, 2)) {/* llamados a la funcion de  no_existe_cuenta para saber si esta el correo en la base de datos */
                $data = false;
                $this->output->set_output(json_encode($data)); /* se regresa el valor falso atraves de ajax */
            } else {
                $this->createSesion($sEmail, $sesLimit); /* llamamos a la funcion _generar_sesion() */
                $data = true;
                $this->output->set_output(json_encode($data)); /* se regresa el valor verdadero atraves de ajax */
            }
        } else {
            $this->load->view('web/vwLogin'); /* manda a vizualizar la vista vwLogin */
        }
    }

    /* inicia la funcion generar_sesion */

    function createSesion($sEmail = '[unknown]', $sesLimit = 1) {
        $arrSesion = array(/* tomamos los parametros de la funcion como el correo y el tiempo de sesion */
            'isLogged' => true,
            'email' => $sEmail,
            'sesLimit' => time() + ($sesLimit * 60)// limite en minutos
        );
        $this->session->set_userdata('sesionUser', $arrSesion); /* crea la variable de sesion con los datos del array $arrSesion */
    }

}
