<?php 
namespace AdminCart\Site\Page;

class BlogModel
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

	public function getBlog($id)
	{
		$query = $this->db->query("SELECT * FROM `" . DBPREFIX . "page` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}	
	
	public function getBlogs()
	{
		$sql = "SELECT * FROM " . DBPREFIX . "page WHERE parent = '9' AND status = '1'";
		
		$sql .= " ORDER BY id DESC";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}	
	
}