<?php

require_once('api/Turbo.php');

class StylesAdmin extends Turbo
{
	public function fetch()
	{
		$styles_dir = 'design/' . $this->settings->theme . '/css/';
		$styles = array();

		// File order in the menu
		$sort = array('style.css', 'reset.css');

		// Reading all css files
		if ($handle = opendir($styles_dir)) {
			$i = count($sort);
			while (false !== ($file = readdir($handle))) {
				if (is_file($styles_dir . $file) && $file[0] != '.'  && pathinfo($file, PATHINFO_EXTENSION) == 'css') {
					if (($key = array_search($file, $sort)) !== false)
						$styles[$key] = $file;
					else
						$styles[$i++] = $file;
				}
			}
			closedir($handle);
		}
		ksort($styles);

		// Current template
		$style_file = $this->request->get('file');

		if (!empty($style_file) && pathinfo($style_file, PATHINFO_EXTENSION) != 'css')
			exit();

		// If not specified - recall it from the session
		if (empty($style_file) && isset($_SESSION['last_edited_style']))
			$style_file = $_SESSION['last_edited_style'];
		// Otherwise, take the first file from the list
		elseif (empty($style_file))
			$style_file = reset($styles);

		// Passing the template name to the design
		$this->design->assign('style_file', $style_file);

		// If we can read the file - pass the content to the design
		if (is_readable($styles_dir . $style_file)) {
			$style_content = file_get_contents($styles_dir . $style_file);
			$this->design->assign('style_content', $style_content);
		}

		// If there are no write permissions, we pass a warning to the design
		if (!empty($style_file) && !is_writable($styles_dir . $style_file) && !is_file($styles_dir . '../locked')) {
			$this->design->assign('message_error', 'permissions');
		} elseif (is_file($styles_dir . '../locked')) {
			$this->design->assign('message_error', 'theme_locked');
		} else {
			// We remember in the session the name of the edited template
			$_SESSION['last_edited_style'] = $style_file;
		}

		$this->design->assign('theme', $this->settings->theme);
		$this->design->assign('styles', $styles);
		return $this->design->fetch('styles.tpl');
	}
}
