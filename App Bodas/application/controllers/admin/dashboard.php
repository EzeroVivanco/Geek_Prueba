<?php
	Class Dashboard extends CI_Controller{
		function index(){
			$this->load->view('admin/vwHeader');
			$this->load->view('admin/vwPortal');
			$this->load->view('admin/vwFooter');
		}

		public function define(){
			$this->load->view('admin/vwHeader');
			$this->load->view('admin/vwDefine');
			$this->load->view('admin/vwFooter');	
			
		}

		function organiza(){
			$this->load->view('admin/vwHeader');
			$this->load->view('admin/vwOrganiza');
			$this->load->view('admin/vwFooter');	
		}

		function invitados(){
			$this->load->view('admin/vwHeader');
			$this->load->view('admin/vwInvitados');
			$this->load->view('admin/vwFooter');	
		}

		function mesaregalos(){
			$this->load->view('admin/vwHeader');
			$this->load->view('admin/vwMesaRegalos');
			$this->load->view('admin/vwFooter');	
		}

		function mensajes(){
			$this->load->view('admin/vwHeader');
			$this->load->view('admin/vwMensajes');
			$this->load->view('admin/vwFooter');	
		}
	}