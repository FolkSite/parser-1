<?php
namespace AdminCart\Site\Html;

class FooterController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
	}
	
	public function index()
	{
		$data['static_url'] = URLSTATIC;
		$data['media_url'] = URLMEDIA;
		
		return $this->registry->get('load')->view('site_html_footer', $data);
	}
}