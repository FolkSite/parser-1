<?php
namespace AdminCart\Site\Page;

class AboutController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->page = $registry->get('load')->cm('site_page_model');
	}
	
	public function index()
	{
		$page_info = $this->page->getPage('1');
		
		$data['media_url'] = URLMEDIA;
		$data['bgclass'] = $page_info['bgclass'];
		$data['pageclass'] = $page_info['pageclass'];
		
		if($page_info['bgimg']){
			$data['bgimg'] = 'background-image: url(' . URLMEDIA . '' . $page_info['bgimg'] . ');';
		} else {
			$data['bgimg'] = '';
		}
		
		$data['title'] = $page_info['title'];
		$data['meta_title'] = $page_info['meta_title'];

		$this->document->setTitle($data['meta_title']);
		$this->document->setBodyClass('home');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page', $data);
		$this->response->setOutput($template);			
	}
}