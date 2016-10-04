<?php
namespace AdminCart\Site\Page;

class ServiceController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->page = $registry->get('load')->cm('site_page_model');
		$this->router = $registry->get('load')->cm('core_router');	
		$this->image = $registry->get('load')->cm('admin_image_model');		
	}
	
	
	public function index()
	{
		$page_info = $this->page->getPage('4');
		
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
		$this->document->setBodyClass('service');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		
		$uslugi_menu = $this->page->getMenuUslug();

		$data['uslugi_menu'] = array();
		
		foreach ($uslugi_menu as $menu) {
			$data['uslugi_menu'][] = array(
				'id' => $menu['id'],
				'url' => $this->router->generate('url_uslugi_item', array('id' => $menu['id']), 'site'),
				'name'       => $menu['title']
			);			
		}		
		

		
		
		
		$service_array = $this->page->getAllServices();
		
		$data['services'] = array();
		
		foreach ($service_array as $service_item) {
			
			$uslugi = array();
			
			$uslugi_array = $this->page->getUslugi($service_item['id']);
			
			if($uslugi_array){

				foreach($uslugi_array as $uslugi_item){
					
			
					$uslugi[] = array(
						'name' => $uslugi_item['title'],
						'intro' => $uslugi_item['intro'],
						'image' => $this->image->resize($uslugi_item['image'], 132, 132),
						'url' => $this->router->generate('url_uslugi_item', array('id' => $uslugi_item['id']), 'site')
					);
				}
			
			}


			
			$data['services'][] = array(
				'service_id' => $service_item['id'],
				'uslugi' => $uslugi,
				'name'       => $service_item['name']
			);			
		}		
		
		
		
		
		
		
		
		
		
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page_service', $data);
		$this->response->setOutput($template);			
	}
	
	
	public function item($param)
	{
		$id = $param['id'];
		
		$page_info = $this->page->getPage($id);
		
		$data['media_url'] = URLMEDIA;
		$data['bgclass'] = 'bgclass';
		$data['pageclass'] = 'pageservice-item bminheight';
		
		if($page_info['bgimg']){
			$data['bgimg'] = 'background-image: url(' . URLMEDIA . '' . $page_info['bgimg'] . ');';
		} else {
			$data['bgimg'] = '';
		}
		
		
		$price_item = $this->page->getPrice($page_info['s_price']);
		
		$data['columns'] = $price_item['columns'];
		
		
		$data['pricelist'] = $this->page->getPricelist($page_info['s_price']);
		
		
		$data['title'] = $page_info['title'];
		$data['meta_title'] = $page_info['meta_title'];

		$this->document->setTitle($data['meta_title']);
		$this->document->setBodyClass('home');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page_usluga', $data);
		$this->response->setOutput($template);			
	}	
	
}