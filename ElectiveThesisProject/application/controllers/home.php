<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class home extends CI_Controller {
 
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()
    {
        parent::__construct();

        $this->load->library('form_validation');
        $this->load->model('ProductPriceUpdates_model');
        $this->load->model('ProductPrice_model');
    }
	public function index()
	{
		$this->load->view('layout/header');
		$this->load->view('layout/navigation');
		$this->load->view('sample');
		$this->load->view('layout/footer');
	}
	 public function PriceUpdate()
    {
        $this->load->view('layout/header',['title' => 'Update Price']);
        $this->load->view('layout/navigation');
		$data = $this->ProductPriceUpdates_model->get_place();
		$dataproduct = $this->ProductPriceUpdates_model->get_product();
		$datauom = $this->ProductPriceUpdates_model->get_unitofmeasure();
        $this->load->view('price/update',
        	array('place' => $data,
        		'product' =>$dataproduct,
        		'uom' =>$datauom
        		)
        	);
        $this->load->view('layout/footer');
    }
    public function Tables()
	{
		$this->load->view('layout/header');
		$this->load->view('layout/navigation');
		$datauom = $this->ProductPriceUpdates_model->get_unitofmeasure();
		$this->load->view('price/table',
        	array('uom' =>$datauom
        		)
        	);
		$this->load->view('layout/footer');
	}
	public function newUOM()
    {
        // Remove form validation error message delimeter
        $this->form_validation->set_error_delimiters('', '');

        if ($this->form_validation->run('unitofmeasure') === FALSE) {
            echo json_encode(
                array(
                    'notification' => 'Validation error',
                    							'error' => array(
                        					'unitofmeasure' 	=> form_error('unitofmeasure')
                    )
                )
            );
        } else {
            $dta = $this->ProductPriceUpdates_model->saveUOM('unitofmeasure',
                array(
                    'unitofmeasure'  => $this->input->post('unitofmeasure', TRUE),
                    )
            );
            
            echo ($dta) ? json_encode(array('notification' => 'Successfully Filled a Loan')) : json_encode(array('notification' => 'Failed to Filled a Loan'));
            
        }
    }
    public function latestUpdates(){
        $newUpdateID = $this->ProductPrice_model->get_latestIDupdates();
        var_dump($newUpdateID);
       foreach ($newUpdateID as $row)
            {
               $idupdate = $row->LAST_INSERT_ID(priceupdateheaderID);
            }
           $data = $this->ProductPrice_model->get_latestupdates('1');
           var_dump($data);
      
    }
}	
