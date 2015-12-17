<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class ProductPrice extends REST_Controller {
/*
	function __construct() {

		header('Access-Control-Allow-Origin: *');
		header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
		header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
		$method = $_SERVER['REQUEST_METHOD'];
		if($method == "OPTIONS") {
			die();
		}
		parent::__construct();
	}
*/	

		
	
	public function index_options(){
		die();
	}
	public function index_get()
	{	

		$this->load->model('ProductPrice_model','get_latestIDupdates');
		$newUpdateID = $this->get_latestIDupdates->get_all();
		$this->load->model('ProductPrice_model','get_latestupdates');
		$data = $this->get_latestupdates($newUpdateID);
		$this->response($data, 200);
		
	
	}
	
	public function index_post()
	{
		$data = $this->post();
		$this->load->model('ProductPrice_model','productprice');
		$id = $this->productprice->insert($data);
				
		$this->response(array('id' => $id), 200);
	}
	public function index_delete()
	{
		$id = (int) $this->get('id');
		$data = $this->post();
		$this->load->model('ProductPrice_model','productprice');
		if($this->productprice->delete($id))
			$this->response(array('ok' => 'Deleted'), 200);
		else
			$this->response(array('error' => 'Not deleted'), 400);
		
	}
	public function index()
	{
		$this->load->view('index');
	}

}