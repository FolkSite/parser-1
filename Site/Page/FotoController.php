<?php
namespace AdminCart\Site\Page;

class FotoController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->page = $registry->get('load')->cm('site_page_model');
		$this->image = $registry->get('load')->cm('admin_image_model');
	}
	
	public function index()
	{
		$id = 3;
		$page_info = $this->page->getPage($id);
		
		$data['media_url'] = URLMEDIA;
		
		$data['pageclass'] = $page_info['pageclass'];
		
		$data['title'] = $page_info['title'];
		$data['meta_title'] = $page_info['meta_title'];

		$this->document->setTitle($data['meta_title']);
		$this->document->setBodyClass('home');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		
		$data['images'] = array();

		$results = $this->page->getImages($id);

		foreach ($results as $result) {
			$data['images'][] = array(
				'popup' => $this->image->resize($result['image'], '1200', '800'),
				'thumb' => $this->image->resize($result['image'], '400', '300')
			);
		}		
		
	
		
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page_foto', $data);
		$this->response->setOutput($template);			
	}
}