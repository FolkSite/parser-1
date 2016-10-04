<?php
namespace AdminCart\Site\Html;

class MenuController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->router = $registry->get('load')->cm('core_router');
	}
	
	public function index()
	{
		$data['url_site'] = $this->router->generate('url_site', array(), 'site');

		return $this->registry->get('load')->view('site_html_menu', $data);
	}
}