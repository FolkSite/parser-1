<?php
namespace AdminCart\Site\Tool;

class ImageModel
{
	public $registry;
	
	public function __construct($registry)
	{
		$this->registry = $registry;
		$this->helpers = $registry->get('load')->cm('core_lib_helpers');
	}	
	
	public function resize($filename, $width, $height)
	{
		if (!is_file(PATHMEDIA . $filename)) {
			return;
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$old_image = $filename;
		$new_image = 'cache/' . $this->helpers->utf8_substr($filename, 0, $this->helpers->utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

		if (!is_file(PATHMEDIA . $new_image) || (filectime(PATHMEDIA . $old_image) > filectime(PATHMEDIA . $new_image))) {
			$path = '';

			$directories = explode('/', dirname(str_replace('../', '', $new_image)));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(PATHMEDIA . $path)) {
					@mkdir(PATHMEDIA . $path, 0777);
				}
			}

			list($width_orig, $height_orig) = getimagesize(PATHMEDIA . $old_image);

			if ($width_orig != $width || $height_orig != $height) {
				$image = new \AdminCart\Core\Library\Image(PATHMEDIA . $old_image);
				$image->resize($width, $height);
				$image->save(PATHMEDIA . $new_image);
			} else {
				copy(PATHMEDIA . $old_image, PATHMEDIA . $new_image);
			}
		}

		return URLMEDIA . '' . $new_image;
	}
}