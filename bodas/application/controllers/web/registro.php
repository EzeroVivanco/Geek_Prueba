<?php

/**
* GeekBucket 2014
* Autor: José Luis Arrioja Zamudio
* Controllador para los metodos del registro
**/

if (!defined('BASEPATH'))
{
   exit('No direct script access allowed');
}
/* Establecer configuración regional al español*/
setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");
/* habre la clase del controlador registro */
class Registro extends CI_controller {

    public function __construct() {/* un constructor en la clase que extiende el constructor padre */
        parent::__construct();
        $this->load->model('login_db');/* cargando el archivo del modelo de login*/
        $this->load->model('registro_db');/* cargando el archivo del modelo de registro */
    }

    public function index() {/* la funcion index es la predeterminada al ingresar al controlador sin especificar que funcion */
     return $this->load->view('web/vwRegistro');/* manda a vizualizar la vista vwRegistro */
 }
 /* inicia la funcion index2 */
 public function index2() {
    $this->load->view('web/vwCrearBoda');/* manda a vizualizar la vista vwCrearBoda*/
}
/* inicia la funcion registro_ */
public function registro_() {
    if($this->input->is_ajax_request()){/* condiciona si la llamada de la funcion es atraves de una funcion ajax */
        /* carga los datos a las variables de email y password */
        $sEmail = $this->input->post('email');/* carga el post email en la variable $sEmail */
        $sPassword = $this->input->post('password');/* carga el post password en la variable $sPassword */
        if (!empty($sPassword)){/* verifica si la variable $sPassword esta vacia */
            $sPass = md5($sPassword);/* asigna a la variable $sPass el hashing MD5 de la variable $sPassword */
        }
        if (!$this->registro_db->no_existe_cuenta($sEmail)) {/* llamados a la funcion de no_existe_cuenta para saber si esta el correo en la base de datos */
            $data=false;
            $this->output->set_output(json_encode($data));/* se regresa el valor falso atraves de ajax */
        } 
        else{
            $this->registro_db->nueva_cuenta($sEmail, $sPass);/* llama a la funcion nueva cuenta en el modelo de registro para insertar los datos en la base de datos */
            $this->_generar_sesion($sEmail); /*llama a la funcion _generar_sesion para generar la variable de sesion */
            $data=true;
            $this->output->set_output(json_encode($data));/* se regresa el valor verdadero atraves de ajax */
        }
    }
    else{
        $this->load->view('web/vwRegistro');/* manda a visualizar la vista vwRegistro */
    }
}
/* inicia la funcion generar_sesion */
function _generar_sesion($sEmail = '[desconocido]', $SesLimite = 1) {
    $arrSesion = array(/* tomamos los parametros de la funcion como el correo y el tiempo de sesion */
        'is_logged' => true,
        'email' => $sEmail,
        'seslimite' => time() + ($SesLimite * 60)// limite en minutos
        );
    $this->session->set_userdata('sesion_usuario', $arrSesion);/* crea la variable de sesion con los datos del array $arrSesion */
}
/* inicia la funcion de error */
function _cargar_error($sMsjError = '') {
    if (!empty($sMsjError)) {/* verifica que el parametro de $sMsjError no este vacio */
        $datos['sMsjError'] = $sMsjError; /* carga el string del error en una array de $datos */
    }
    $this->load->view('web/vwCrearBoda', $datos);/* manda a visualizar la vista vwCrearBoda, con el parametro de $datos */
}

/* inicia la funcion nueva_pareja */
function nueva_pareja() {
    if (!empty($_POST['nombre']) && !empty($_POST['nombre_pareja'])) {/* verifica si el post de nombre y de nombre_pareja estan vacios */

        $contenido = array(
            'nombre' => $_POST['nombre'],
            'nombre_pareja' => $_POST['nombre_pareja']
            );/* en el array $contenido almacena los post de nombre y nombre_pareja */
        $this->registro_db->insertar_pareja($contenido);/* se llama a la funcion insertar_pareja para ingresar en la base de datos los nombre de la parejas */
        redirect(base_url() . 'admin/dashboard/');/* redirecciona a la vista dashboard */
    } else {
        $this->_cargar_error('Celda (s) vacia (s)'); /* llama a la funcion _cargar_error para marcar en la vista el error */
    }
}

}
