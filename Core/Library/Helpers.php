<?php
namespace AdminCart\Core\Library;

class Helpers
{
	public function __construct($registry)
	{
		mb_internal_encoding('UTF-8');
	}
	
	public function utf8_strlen($string)
	{
		return mb_strlen($string);
	}

	public function utf8_strpos($string, $needle, $offset = 0)
	{
		return mb_strpos($string, $needle, $offset);
	}

	public function utf8_strrpos($string, $needle, $offset = 0)
	{
		return mb_strrpos($string, $needle, $offset);
	}

	public function utf8_substr($string, $offset, $length = null)
	{
		if ($length === null) {
			return mb_substr($string, $offset, $this->utf8_strlen($string));
		} else {
			return mb_substr($string, $offset, $length);
		}
	}

	public function utf8_strtoupper($string)
	{
		return mb_strtoupper($string);
	}

	public function utf8_strtolower($string)
	{
		return mb_strtolower($string);
	}

	public function token($length = 32)
	{
		// Create token to login with
		$string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		
		$token = '';
		
		for ($i = 0; $i < $length; $i++) {
			$token .= $string[mt_rand(0, strlen($string) - 1)];
		}	
		
		return $token;
	}	
}