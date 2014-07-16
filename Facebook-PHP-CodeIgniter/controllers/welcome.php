<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {
    
     public function index() {
        // Cargamos la librería
        $this->load->library('fbconnect');

        // Hizo el login con facebook?
        if($this->fbconnect->isLogedIn()) {
            // Mostramos primer nombre
            echo 'Hola ' . $this->fbconnect->userData()->first_name . '<br />';
            
            // Mostramos foto de perfil
            echo '<img src="' . $this->fbconnect->profilePic() . '" /><br />';
            
            // Mostramos el resto de los datos que nos entrega facebook
            echo '<pre>';
            print_r($this->fbconnect->userData());
            echo '</pre>';
        }
        // Si no ha hecho el login le mostramos el link
        else {
            echo anchor('/welcome/fblogin', 'Login con facebook');
        }
    }
    
    public function fblogin() {
        // Cargamos la librería
        $this->load->library('fbconnect');
        
        // Se hace el login, primer parámetro la dirección donde los devolverá y el segundo los "scopes" (Info adicional que queremos pedirle a facebook)
        $this->fbconnect->doLogin(site_url('/welcome'), 'email,user_birthday,user_location');
    }  
    
}

//	public function __construct(){
//		parent::__construct();
//
//        // To use site_url and redirect on this controller.
//        $this->load->helper('url');
//	}
//
//	public function login(){
//
//		$this->load->library('facebook'); // Automatically picks appId and secret from config
//        // OR
//        // You can pass different one like this
//        //$this->load->library('facebook', array(
//        //    'appId' => 'APP_ID',
//        //    'secret' => 'SECRET',
//        //    ));
//
//		$user = $this->facebook->getUser();
//        
//        if ($user) {
//            try {
//                $data['user_profile'] = $this->facebook->api('/me');
//            } catch (FacebookApiException $e) {
//                $user = null;
//            }
//        }else {
//            $this->facebook->destroySession();
//        }
//
//        if ($user) {
//
//            $data['logout_url'] = site_url('welcome/logout'); // Logs off application
//            // OR 
//            // Logs off FB!
//            // $data['logout_url'] = $this->facebook->getLogoutUrl();
//
//        } else {
//            $data['login_url'] = $this->facebook->getLoginUrl(array(
//                'redirect_uri' => site_url('welcome/login'), 
//                'scope' => array("email") // permissions here
//            ));
//        }
//        $this->load->view('login',$data);
//
//	}
//
//    public function logout(){
//
//        $this->load->library('facebook');
//
//        // Logs off session from website
//        $this->facebook->destroySession();
//        // Make sure you destory website session as well.
//
//        redirect('welcome/login');
//    }
//
//}
//
