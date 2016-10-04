<?php
namespace AdminCart\Core;

final class Loader
{
	protected $registry;
	protected $classmap = array();
	protected $viewmap = array();
	
	public function __construct($registry)
	{
		$this->registry = $registry;
	}
	
	public function loadClassmap($filename)
	{
		$file = PATHVAR . 'config/classmap/' . $filename . '.php';
		if (file_exists($file)) {
			$cm = array();
			require($file);
			$this->classmap = array_merge($this->classmap, $cm);
		} else {
			trigger_error('Error: Could not load config ' . $filename . '!');
			exit();
		}		
	}
	
	public function cm($key)
	{
		if(isset($this->classmap[$key])) {
			$class = $this->classmap[$key];
			
			if (!$this->registry->has($key)) {
				$this->registry->set($key, new $class($this->registry));
			}
		}
		
		return $this->registry->get($key);				
	}
	
	public function db()
	{
		$dbname = 'db_default';
		
		if (!$this->registry->has($dbname)) {
			$this->registry->set($dbname, new \AdminCart\Core\Library\DB\MySQLi(DBHOSTNAME, DBUSERNAME, DBPASSWORD, DBDATABASE, DBPORT));
		}				
		
		return $this->registry->get($dbname);		
	}	
	
	public function loadViewmap($filename)
	{
		$file = PATHVAR . 'config/viewmap/' . $filename . '.php';
		if (file_exists($file)) {
			$vm = array();
			require($file);
			$this->viewmap = array_merge($this->viewmap, $vm);
		} else {
			trigger_error('Error: Could not load config ' . $filename . '!');
			exit();
		}		
	}
	
	public function view($key, $data)
	{
		if(isset($this->viewmap[$key])) {
			$template = $this->viewmap[$key];
			$file = PATHSRC . $template . '.tpl';

			if (file_exists($file)) {
				extract($data);

				ob_start();

				require($file);

				$output = ob_get_contents();

				ob_end_clean();
			} else {
				trigger_error('Error: Could not load template ' . $file . '!');
				exit();
			}

			return $output;
		}
	}
}