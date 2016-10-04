<?php
namespace AdminCart\Site\Home;

class HomeController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->model = $registry->get('load')->cm('site_home_model');
		$this->router = $registry->get('load')->cm('core_router');	
		$this->image = $registry->get('load')->cm('admin_image_model');	
	}
	
	public function index()
	{
		$data['media_url'] = URLMEDIA;
		

		
		
		$about_info = $this->model->getPage('1');
		$contact_info = $this->model->getPage('8');
		$home_info = $this->model->getPage('44');
		
		$data['home_info'] = array(
			'meta_title' => $home_info['meta_title'],
			'description' => html_entity_decode($home_info['description'], ENT_QUOTES, 'UTF-8')
		);
		
		$data['about_info'] = array(
		'title' => $about_info['title'],
		'description' => html_entity_decode($about_info['description'], ENT_QUOTES, 'UTF-8')
		);
		
		$data['contact_info'] = array(
		'title' => $contact_info['title'],
		'description' => html_entity_decode($contact_info['description'], ENT_QUOTES, 'UTF-8')	
		);
		
		
		
		
		$data['title'] = $home_info['meta_title'];
		$this->document->setTitle($data['title']);
		$this->document->setBodyClass('home');		
		
		
		$data['reviews'] = array();
		
		$results = $this->model->getActiveReviews();
		
		foreach ($results as $result) {
			$data['reviews'][] = array(
				'fname' 				=> mb_substr($result['name'], 0, 1,'UTF-8'),
				'name'          => $result['name'],
				'text'          => $result['text'],
				'ratingw'          => (int)$result['rating']*20,
				'date'          => $result['date']
			);
		}	



		$data['slides'] = array();

		$slides = $this->model->getSlides('44');

		foreach ($slides as $slide) {
			$data['slides'][] = array(
				'image' => $this->image->resize($slide['value'], '1900', '750'),
				'link' => $slide['value2'],
				'text' => $slide['value3'],
			);
		}		
		

		$data['topusls'] = array();

		$topusls = $this->model->getUsls('44');

		foreach ($topusls as $topusl) {
			$data['topusls'][] = array(
				'image' => $this->image->resize($topusl['value'], '165', '165'),
				'link' => $topusl['value2'],
				'text' => $topusl['value3'],
			);
		}			
		
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_home', $data);
		$this->response->setOutput($template);			
	}
}