<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class ProductPriceUpdates_model extends CI_Model {
	
	public function get_place(){
		return $this->db->get('place')->result_object();
	}
	public function get_product(){
		return $this->db->get('product')->result_object();
	}
	public function get_unitofmeasure(){
		return $this->db->get('unitofmeasure')->result_object();
	}

	///Save data and return last Id inserted
    public function saveUOM($table,$data)
    {
        $this->db->insert($table, $data);

    }	
	
 
    
}