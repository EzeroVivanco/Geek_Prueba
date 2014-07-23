<?php

/**
 * GeekBucket 2014
 * Author: Alberto Vera Espitia
 * Define el comportamiento de home en la web publica
 *
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

setlocale(LC_ALL, "es_ES@euro", "es_ES", "esp");

class Example extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    /**
     * Despliega la pantalla del home
     */
    public function index() {
        $fb_config = array(
            'appId' => '669372229794817',
            'secret' => '25610df257acf12ccb5373b87f8727f8'
        );

        $this->load->library('facebook', $fb_config);

        $user = $this->facebook->getUser();

        if ($user) {
            try {
                $data['user_profile'] = $this->facebook
                        ->api('/me');
            } catch (FacebookApiException $e) {
                $user = null;
            }
        }
        if ($user) {
            $data['logout_url'] = $this->facebook
                    ->getLogoutUrl();
        } else {
            $data['login_url'] = $this->facebook
                    ->getLoginUrl();
        }
        $this->load->view('view', $data);
    }

}
