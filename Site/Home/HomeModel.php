<?php 
namespace AdminCart\Site\Home;

class HomeModel
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->db = $registry->get('load')->db();
	}
	
	public function getPage($id)
	{
		$query = $this->db->query("SELECT * FROM `" . DBPREFIX . "page` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}	
	
	public function getActiveReviews()
	{
		$sql = "SELECT * FROM " . DBPREFIX . "reviews WHERE status = '1'";
		
		$sql .= " ORDER BY id DESC LIMIT 2";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}	
	
	
	public function getSlides($id) {
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "page_meta WHERE meta_key = '2' AND page_id = '" . (int)$id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}		
	
	
	public function getUsls($id) {
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "page_meta WHERE meta_key = '3' AND page_id = '" . (int)$id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}		
	
	
	
	
	
	
	
	
	public function getImages($id) {
		$query = $this->db->query("SELECT value as image, sort_order as sort_order FROM " . DBPREFIX . "page_meta WHERE meta_key = '1' AND page_id = '" . (int)$id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}	
	
	public function getAllServices()
	{
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "services WHERE status = '1' ORDER BY sort_order ASC");

		return $query->rows;		
	}
	
	public function getUslugi($service_id)
	{
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "page WHERE status = '1' AND s_service = '" . (int)$service_id . "' ORDER BY sort_order ASC");

		return $query->rows;		
	}	
	
	public function getPricelist($id) {
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "price_cols WHERE price = '" . (int)$id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}	
	
	public function getPrice($id)
	{
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "price WHERE id = '" . (int)$id . "'");

		return $query->row;
	}	

	public function getMenuUslug()
	{
		$query = $this->db->query("SELECT * FROM " . DBPREFIX . "page WHERE parent = '4' AND status = '1' ORDER BY sort_order ASC");

		return $query->rows;		
	}	


	
}