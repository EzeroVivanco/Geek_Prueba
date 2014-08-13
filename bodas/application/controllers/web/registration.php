<?php

/**
 * GeekBucket 2014
 * Autor: José Luis Arrioja Zamudio
 * Controllador para los metodos del registro
 * */
if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}
/* Establecer configuración regional al español */
setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");
/* habre la clase del controlador registro */

class Registration extends CI_controller {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
        $this->load->model('LoginDb'); /* cargando el archivo del modelo de login */
        $this->load->model('RegistrationDb'); /* cargando el archivo del modelo de registro */
    }

    public function index() {/* la funcion index es la predeterminada al ingresar al controlador sin especificar que funcion */
        return $this->load->view('web/vwRegistration'); /* manda a vizualizar la vista vwRegistration */
    }

    /* inicia la funcion index2 */

    public function index2() {
        $this->load->view('web/vwWedding'); /* manda a vizualizar la vista vwWedding */
    }

    /* inicia la funcion registro_ */

    public function register() {
        if ($this->input->is_ajax_request()) {/* condiciona si la llamada de la funcion es atraves de una funcion ajax */
            /* carga los datos a las variables de email y password */
            $sEmail = $this->input->post('email'); /* carga el post email en la variable $sEmail */
            $sPassword = $this->input->post('password'); /* carga el post password en la variable $sPassword */
            if (!empty($sPassword)) {/* verifica si la variable $sPassword esta vacia */
                $sPass = md5($sPassword); /* asigna a la variable $sPass el hashing MD5 de la variable $sPassword */
            }
            if (!$this->RegistrationDb->dontExisMail($sEmail)) {/* llamados a la funcion de no_existe_cuenta para saber si esta el correo en la base de datos */
                $data = false;
                $this->output->set_output(json_encode($data)); /* se regresa el valor falso atraves de ajax */
            } else {
                $this->RegistrationDb->newAccount($sEmail, $sPass); /* llama a la funcion nueva cuenta en el modelo de registro para insertar los datos en la base de datos */
                $this->createSesion($sEmail); /* llama a la funcion _generar_sesion para generar la variable de sesion */
                $data = true;
                $this->output->set_output(json_encode($data)); /* se regresa el valor verdadero atraves de ajax */
            }
        } else {
            $this->load->view('web/vwRegistration'); /* manda a visualizar la vista vwRegistration */
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

    /* inicia la funcion de error */

    function loadError($smsjError = '') {
        if (!empty($smsjError)) {/* verifica que el parametro de $sMsjError no este vacio */
            $data['smsjError'] = $smsjError; /* carga el string del error en una array de $datos */
        }
        $this->load->view('web/vwWedding', $data); /* manda a visualizar la vista vwWedding, con el parametro de $datos */
    }

    /* inicia la funcion nueva_pareja */

    function newCouple() {
        if (!empty($_POST['name']) && !empty($_POST['name_couple'])) {/* verifica si el post de nombre y de nombre_pareja estan vacios */

            $content = array(
                'name' => $_POST['name'],
                'name_couple' => $_POST['name_couple']
            ); /* en el array $contenido almacena los post de nombre y nombre_pareja */
            $this->RegistrationDb->insertCouple($content); /* se llama a la funcion insertar_pareja para ingresar en la base de datos los nombre de la parejas */
            redirect(base_url() . 'admin/dashboard/'); /* redirecciona a la vista dashboard */
        } else {
            $this->loadError('Celda (s) vacia (s)'); /* llama a la funcion _cargar_error para marcar en la vista el error */
        }
    }

}
