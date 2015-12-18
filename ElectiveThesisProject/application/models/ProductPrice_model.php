<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class ProductPrice_model extends CI_Model {
	
//	public function get_all(){
//		return $this->db->get('productprice')->result_object();
//	}
//	public function insert($data){
//		$this->db->insert('productprice', $data);
//		$insert_id = $this->db->insert_id();
//		return  $insert_id; 
//	}
//	public function delete($id){
//		return $this->db->delete('productprice',array('id' => $id));
//	}
	public function get_all(){
		return $this->db->get('latestupdates_view')->result_object();
	}
	public function get_latestupdates($id){
		return $this->db->get_where('price_update_view', array('priceupdateheaderID' => $id))->result_object();

	}
	
}