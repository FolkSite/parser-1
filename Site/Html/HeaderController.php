<?php
namespace AdminCart\Site\Html;

class HeaderController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->router = $registry->get('load')->cm('core_router');
	}
	
	public function index()
	{
		$data['title'] = $this->document->getTitle();
		$data['body_class'] = $this->document->getBodyClass();
		
		$data['static_url'] = URLSTATIC;	
		$data['media_url'] = URLMEDIA;
		
		$data['url_site'] = $this->router->generate('url_site', array(), 'site');
		
		return $this->registry->get('load')->view('site_html_header', $data);
	}
}