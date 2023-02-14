<?php

require_once('api/Turbo.php');

class TemplatesAdmin extends Turbo
{
	public function fetch()
	{
		$main_dir = 'design/' . $this->settings->theme . '/';

		if ($this->request->get("dir")) {
			$subdir = $this->request->get('dir') . "/";
			$templates_dir = 'design/' . $this->settings->theme . '/html/' . $subdir . '/';
		} else {
			$templates_dir = 'design/' . $this->settings->theme . '/html/';
		}

		$templates = array();
		$folders = array();

		// Reading all tpl files
		if ($handle = opendir($templates_dir)) {
			while (false !== ($file = readdir($handle))) {
				if (is_file($templates_dir . $file) && $file[0] != '.'  && pathinfo($file, PATHINFO_EXTENSION) == 'tpl') {
					$templates[] = $file;
				}
			}
			closedir($handle);
			asort($templates);
		}

		// Folders
		if ($handle = opendir($templates_dir)) {
			while (false !== ($dir = readdir($handle))) {
				if (is_dir($templates_dir . $dir) && $dir[0] != '.') {
					$folders[] = $dir;
				}
			}
			closedir($handle);
			asort($folders);
		}

		// Current template
		$template_file = $this->request->get('file');

		if (!empty($template_file) && pathinfo($template_file, PATHINFO_EXTENSION) != 'tpl') {
			exit();
		}

		if (!isset($template_file)) {
			$template_file = reset($templates);
		}

		// Passing the template name to the design
		$this->design->assign('template_file', $template_file);

		// If we can read the file - pass the content to the design
		if (is_readable($templates_dir . $template_file)) {
			$template_content = file_get_contents($templates_dir . $template_file);
			$this->design->assign('template_content', $template_content);
		}

		// If there are no write permissions, we pass a warning to the design
		if (!empty($template_file) && !is_writable($templates_dir . $template_file) && !is_file($main_dir . '/locked')) {
			$this->design->assign('message_error', 'permissions');
		} elseif (is_file($main_dir . '/locked')) {
			$this->design->assign('message_error', 'theme_locked');
		} else {
			// We remember in the session the name of the edited template
			$_SESSION['last_edited_template'] = $template_file;
		}

		$this->design->assign('theme', $this->settings->theme);
		$this->design->assign('folders', $folders);
		$this->design->assign('templates', $templates);
		return $this->design->fetch('templates.tpl');
	}
}
