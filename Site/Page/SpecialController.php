<?php
namespace AdminCart\Site\Page;

class SpecialController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->page = $registry->get('load')->cm('site_page_special_model');
		$this->image = $registry->get('load')->cm('admin_image_model');
		$this->router = $registry->get('load')->cm('core_router');		
	}
	
	public function index()
	{
		$page_info = $this->page->getPage('5');
		
		$data['media_url'] = URLMEDIA;
		$data['bgclass'] = $page_info['bgclass'];
		$data['pageclass'] = $page_info['pageclass'];
		
		if($page_info['bgimg']){
			$data['bgimg'] = 'background-image: url(' . URLMEDIA . '' . $page_info['bgimg'] . ');';
		} else {
			$data['bgimg'] = '';
		}
		
		$results = $this->page->getSpecials();
		
		foreach ($results as $result) {
			if($result['image']){
				 $image = $this->image->resize($result['image'], 470, 350);
			} else {
				$image = '';
			}
			$data['specials'][] = array(
				'special_id' 		=> $result['id'],
				'title'       => $result['title'],
				'intro'       => $result['intro'],
				'date'       => $result['date'],
				'image'       => $image,
				'url_special'    => $this->router->generate('url_special_item', array('id' => $result['id']), 'site')
			);
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
		
		$template = $this->registry->get('load')->view('site_page_special', $data);
		$this->response->setOutput($template);			
	}
	
	public function item($param)
	{
		$id = $param['id'];
		$page_info = $this->page->getSpecial($id);
		
		$data['media_url'] = URLMEDIA;

		$data['title'] = $page_info['title'];
		$data['meta_title'] = $page_info['meta_title'];

		$this->document->setTitle($data['meta_title']);
		$this->document->setBodyClass('home');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page_special_item', $data);
		$this->response->setOutput($template);		
	}
}