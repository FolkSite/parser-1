<?php
namespace AdminCart\Site\Page;

class PriceController
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
		$page_info = $this->page->getPage('6');
		
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
		
		
		
		$service_array = $this->page->getAllServices();
		
		$data['services'] = array();
		
		foreach ($service_array as $service_item) {
			
			$uslugi = array();
			$uslugi_array = $this->page->getUslugi($service_item['id']);
			
			if($uslugi_array){

				foreach($uslugi_array as $uslugi_item){
					
					$price_item = $this->page->getPrice($uslugi_item['s_price']);

					$pricelist = $this->page->getPricelist($price_item['id']);
					
					$uslugi[] = array(
						'name' => $uslugi_item['title'],
						'columns' => $price_item['columns'],
						'pricelist' => $pricelist
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
		
		$template = $this->registry->get('load')->view('site_page_price', $data);
		$this->response->setOutput($template);			
	}
}