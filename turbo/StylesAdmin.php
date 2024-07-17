<?php

require_once 'api/Turbo.php';

class StylesAdmin extends Turbo
{
	public function fetch(): string
	{
		$dir = $this->request->get('dir');
		if ($dir !== null) {
			$dir = trim($dir, '/');
		} else {
			$dir = '';
		}

		$stylesDir = 'design/' . $this->settings->theme . '/css/' . $dir . '/';
		$mainDir = 'design/' . $this->settings->theme . '/css/';
		$styles = [];
		$folders = [];
		$sort = ['style.css', 'reset.css'];

		if (!is_dir($stylesDir)) {
			mkdir($stylesDir, 0777, true);
		}

		if ($handle = opendir($stylesDir)) {
			$i = count($sort);

			while (false !== ($file = readdir($handle))) {
				if (is_file($stylesDir . $file) && $file[0] != '.' && pathinfo($file, PATHINFO_EXTENSION) == 'css') {
					if (($key = array_search($file, $sort, true)) !== false) {
						$styles[$key] = $file;
					} else {
						$styles[$i++] = $file;
					}
				}
			}
			closedir($handle);
		}

		ksort($styles);

		if ($handle = opendir($mainDir)) {
			while (false !== ($subdir = readdir($handle))) {
				if ($subdir[0] != '.' && is_dir($mainDir . $subdir)) {
					$folders[] = $subdir;
				}
			}
			closedir($handle);
			asort($folders);
		}

		$styleFile = $this->request->get('file');

		if (!empty($styleFile) && pathinfo($styleFile, PATHINFO_EXTENSION) != 'css') {
			exit();
		}

		if (!isset($styleFile)) {
			$styleFile = reset($styles);
		}

		if (empty($styleFile) && isset($_SESSION['last_edited_style'])) {
			$styleFile = $_SESSION['last_edited_style'];
		} elseif (empty($styleFile)) {
			$styleFile = reset($styles);
		}

		$this->design->assign('style_file', $styleFile);

		if (is_readable($stylesDir . $styleFile)) {
			$styleContent = file_get_contents($stylesDir . $styleFile);
			$this->design->assign('style_content', $styleContent);
		}

		if (!empty($styleFile) && !is_writable($stylesDir . $styleFile) && !is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'permissions');
		} elseif (is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'theme_locked');
		} else {
			$_SESSION['last_edited_style'] = $styleFile;
		}

		$this->design->assign('theme', $this->settings->theme);
		$this->design->assign('styles', $styles);
		$this->design->assign('folders', $folders);
		$this->design->assign('dir', $dir);

		return $this->design->fetch('styles.tpl');
	}
}
