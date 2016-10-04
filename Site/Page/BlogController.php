<?php
namespace AdminCart\Site\Page;

class BlogController
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->response = $registry->get('load')->cm('core_lib_response');
		$this->document = $registry->get('load')->cm('core_lib_document');
		$this->page = $registry->get('load')->cm('site_page_blog_model');
		$this->image = $registry->get('load')->cm('admin_image_model');
		$this->router = $registry->get('load')->cm('core_router');		
	}
	
	public function index()
	{
		$page_info = $this->page->getPage('9');
		
		$data['media_url'] = URLMEDIA;
		$data['bgclass'] = $page_info['bgclass'];
		$data['pageclass'] = $page_info['pageclass'];
		
		if($page_info['bgimg']){
			$data['bgimg'] = 'background-image: url(' . URLMEDIA . '' . $page_info['bgimg'] . ');';
		} else {
			$data['bgimg'] = '';
		}
		
		$results = $this->page->getBlogs();
		
		foreach ($results as $result) {
			if($result['image']){
				 $image = $this->image->resize($result['image'], 132, 132);
			} else {
				$image = '';
			}
			$data['blogs'][] = array(
				'blog_id' 		=> $result['id'],
				'title'       => $result['title'],
				'intro'       => $result['intro'],
				'date'       => $result['date'],
				'image'       => $image,
				'url_blog'    => $this->router->generate('url_blog_item', array('id' => $result['id']), 'site')
			);
		}		
		
		
		$data['title'] = $page_info['title'];
		$data['meta_title'] = $page_info['meta_title'];

		$this->document->setTitle($data['meta_title']);
		$this->document->setBodyClass('blog-page');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page_blog', $data);
		$this->response->setOutput($template);			
	}
	
	public function item($param)
	{
		$id = $param['id'];
		$page_info = $this->page->getBlog($id);
		
		$data['media_url'] = URLMEDIA;

		$data['title'] = $page_info['title'];
		$data['meta_title'] = $page_info['meta_title'];

		$this->document->setTitle($data['meta_title']);
		$this->document->setBodyClass('blog-item-page');
		
		$data['description'] = html_entity_decode($page_info['description'], ENT_QUOTES, 'UTF-8');
		
		
		$header = $this->registry->get('load')->cm('site_html_header_controller');
		$data['header'] = $header->index();
		
		$footer = $this->registry->get('load')->cm('site_html_footer_controller');
		$data['footer'] = $footer->index();				
		
		$template = $this->registry->get('load')->view('site_page_blog_item', $data);
		$this->response->setOutput($template);		
	}
}