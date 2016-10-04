<?php
namespace AdminCart\Site\Page;

class ReviewsModel
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->db = $registry->get('load')->db();
	}	
	

	public function getActiveReviews()
	{
		$sql = "SELECT * FROM " . DBPREFIX . "reviews WHERE status = '1'";
		
		$sql .= " ORDER BY id DESC";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}	
	
}