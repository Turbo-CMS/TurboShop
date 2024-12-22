<?php

require_once 'api/Turbo.php';

class ImagesAdmin extends Turbo
{
	public function fetch()
	{
		$dir = $this->request->get('dir') ?? '';
		$dir = trim($dir, '/');
		$imagesDir = 'design/' . $this->settings->theme . '/images/' . $dir . '/';
		$mainDir = 'design/' . $this->settings->theme . '/images/';

		if (!is_dir($imagesDir)) {
			mkdir($imagesDir, 0777, true);
		}

		$allowedExtensions = ['png', 'gif', 'jpg', 'jpeg', 'ico', 'svg'];
		$images = [];
		$folders = [];

		if ($handle = opendir('design/' . $this->settings->theme . '/images/')) {
			while (false !== ($file = readdir($handle))) {
				if ($file[0] != '.' && is_dir('design/' . $this->settings->theme . '/images/' . $file)) {
					$folders[] = $file;
				}
			}
			closedir($handle);
		}

		if ($this->request->method('post') && !is_file($imagesDir . '../locked')) {
			$oldNames = $this->request->post('old_name');
			$newNames = $this->request->post('new_name');

			if (is_array($oldNames)) {
				foreach ($oldNames as $i => $oldName) {
					$newName = $newNames[$i];
					$newName = trim(pathinfo($newName, PATHINFO_FILENAME) . '.' . pathinfo($oldName, PATHINFO_EXTENSION), '.');

					if (is_writable($imagesDir) && is_file($imagesDir . $oldName) && !is_file($imagesDir . $newName)) {
						rename($imagesDir . $oldName, $imagesDir . $newName);
					} elseif (is_file($imagesDir . $newName) && $newName !== $oldName) {
						$messageError = 'name_exists';
					}
				}
			}

			$deleteImage = trim($this->request->post('delete_image'), '.');

			if (!empty($deleteImage)) {
				@unlink($imagesDir . $deleteImage);
			}

			if ($images = $this->request->files('upload_images')) {
				for ($i = 0; $i < count($images['name']); $i++) {
					$name = trim($images['name'][$i], '.');
					if (in_array(strtolower(pathinfo($name, PATHINFO_EXTENSION)), $allowedExtensions)) {
						move_uploaded_file($images['tmp_name'][$i], $imagesDir . $name);
					}
				}
			}

			if (!isset($messageError)) {
				header('Location: ' . $_SERVER['REQUEST_URI']);
				exit();
			} else {
				$this->design->assign('message_error', $messageError);
			}
		}

		if ($handle = opendir($imagesDir)) {
			while (false !== ($file = readdir($handle))) {
				if (is_file($imagesDir . $file) && $file[0] != '.' && in_array(pathinfo($file, PATHINFO_EXTENSION), $allowedExtensions)) {
					$image = new stdClass;
					$image->name = $file;
					$image->size = filesize($imagesDir . $file);
					list($image->width, $image->height) = getimagesize($imagesDir . $file);
					$images[$file] = $image;
				}
			}

			closedir($handle);
			ksort($images);
		}

		if (!is_writable($imagesDir)) {
			$this->design->assign('message_error', 'permissions');
		} elseif (is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'theme_locked');
		}

		$locked = is_file($mainDir . '../locked');

		$this->design->assign('locked', $locked);
		$this->design->assign('theme', $this->settings->theme);
		$this->design->assign('images', $images);
		$this->design->assign('images_dir', $imagesDir);
		$this->design->assign('dir', $dir);
		$this->design->assign('folders', $folders);

		return $this->design->fetch('images.tpl');
	}
}
