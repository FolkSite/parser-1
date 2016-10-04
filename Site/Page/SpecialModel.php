<?php 
namespace AdminCart\Site\Page;

class SpecialModel
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

	public function getSpecial($id)
	{
		$query = $this->db->query("SELECT * FROM `" . DBPREFIX . "page` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}	
	
	public function getSpecials()
	{
		$sql = "SELECT * FROM " . DBPREFIX . "page WHERE parent = '5' AND status = '1'";
		
		$sql .= " ORDER BY id DESC";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}	
	
}