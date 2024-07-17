<?php

require_once 'api/Turbo.php';

class TemplatesAdmin extends Turbo
{
	public function fetch(): string
	{
		$dir = $this->request->get('dir');
		if ($dir !== null) {
			$dir = trim($dir, '/');
		} else {
			$dir = '';
		}

		$templatesDir = 'design/' . $this->settings->theme . '/html/' . $dir . '/';
		$mainDir = 'design/' . $this->settings->theme . '/html/';
		$templates = [];
		$folders = [];
		$sort = ['index.tpl'];

		if (!is_dir($templatesDir)) {
			mkdir($templatesDir, 0777, true);
		}

		if ($handle = opendir($templatesDir)) {
			$i = count($sort);

			while (false !== ($file = readdir($handle))) {
				if (is_file($templatesDir . $file) && $file[0] != '.' && pathinfo($file, PATHINFO_EXTENSION) == 'tpl') {
					if (($key = array_search($file, $sort, true)) !== false) {
						$templates[$key] = $file;
					} else {
						$templates[$i++] = $file;
					}
				}
			}
			closedir($handle);
		}

		ksort($templates);

		if ($handle = opendir($mainDir)) {
			while (false !== ($subdir = readdir($handle))) {
				if ($subdir[0] != '.' && is_dir($mainDir . $subdir)) {
					$folders[] = $subdir;
				}
			}
			closedir($handle);
			asort($folders);
		}

		$templateFile = $this->request->get('file');

		if (!empty($templateFile) && pathinfo($templateFile, PATHINFO_EXTENSION) != 'tpl') {
			exit();
		}

		if (!isset($templateFile)) {
			$templateFile = reset($templates);
		}

		if (empty($templateFile) && isset($_SESSION['last_edited_template'])) {
			$templateFile = $_SESSION['last_edited_template'];
		} elseif (empty($templateFile)) {
			$templateFile = reset($templates);
		}

		$this->design->assign('template_file', $templateFile);

		if (is_readable($templatesDir . $templateFile)) {
			$templateContent = file_get_contents($templatesDir . $templateFile);
			$this->design->assign('template_content', $templateContent);
		}

		if (!empty($templateFile) && !is_writable($templatesDir . $templateFile) && !is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'permissions');
		} elseif (is_file($mainDir . '../locked')) {
			$this->design->assign('message_error', 'theme_locked');
		} else {
			$_SESSION['last_edited_template'] = $templateFile;
		}

		$this->design->assign('theme', $this->settings->theme);
		$this->design->assign('templates', $templates);
		$this->design->assign('folders', $folders);
		$this->design->assign('dir', $dir);

		return $this->design->fetch('templates.tpl');
	}
}
