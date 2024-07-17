<?php

require_once 'api/Turbo.php';

class ScriptsAdmin extends Turbo
{
	public function fetch(): string
	{
		$dir = $this->request->get('dir');
		if ($dir !== null) {
			$dir = trim($dir, '/');
		} else {
			$dir = '';
		}

		$scriptsDir = 'design/' . $this->settings->theme . '/js/' . $dir . '/';
		$mainDir = 'design/' . $this->settings->theme . '/js/';
		$scripts = [];
		$folders = [];
		$sort = ['turbo.js'];

		if (!is_dir($scriptsDir)) {
			mkdir($scriptsDir, 0777, true);
		}

		if ($handle = opendir($scriptsDir)) {
			$i = count($sort);

			while (false !== ($file = readdir($handle))) {
				if (is_file($scriptsDir . $file) && $file[0] != '.' && pathinfo($file, PATHINFO_EXTENSION) == 'js') {
					if (($key = array_search($file, $sort, true)) !== false) {
						$scripts[$key] = $file;
					} else {
						$scripts[$i++] = $file;
					}
				}
			}
			closedir($handle);
		}

		ksort($scripts);

		if ($handle = opendir($mainDir)) {
			while (false !== ($subdir = readdir($handle))) {
				if ($subdir[0] != '.' && is_dir($mainDir . $subdir)) {
					$folders[] = $subdir;
				}
			}
			closedir($handle);
			asort($folders);
		}

		$scriptFile = $this->request->get('file');

		if (!empty($scriptFile) && pathinfo($scriptFile, PATHINFO_EXTENSION) != 'js') {
			exit();
		}

		if (!isset($scriptFile)) {
			$scriptFile = reset($scripts);
		}

		if (empty($scriptFile) && isset($_SESSION['last_edited_script'])) {
			$scriptFile = $_SESSION['last_edited_script'];
		} elseif (empty($scriptFile)) {
			$scriptFile = reset($scripts);
		}

		$this->design->assign('script_file', $scriptFile);

		if (is_readable($scriptsDir . $scriptFile)) {
			$scriptContent = file_get_contents($scriptsDir . $scriptFile);
			$this->design->assign('script_content', $scriptContent);
		}

		if (!empty($scriptFile) && !is_writable($scriptsDir . $scriptFile) && !is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'permissions');
		} elseif (is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'theme_locked');
		} else {
			$_SESSION['last_edited_script'] = $scriptFile;
		}

		$this->design->assign('theme', $this->settings->theme);
		$this->design->assign('scripts', $scripts);
		$this->design->assign('folders', $folders);
		$this->design->assign('dir', $dir);

		return $this->design->fetch('scripts.tpl');
	}
}
