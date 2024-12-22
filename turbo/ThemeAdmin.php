<?php

require_once 'api/Turbo.php';

class ThemeAdmin extends Turbo
{
	private $themesDir = 'design/';
	private $compiledDir = 'compiled/';

	public function fetch()
	{
		if ($this->request->method('post')) {
			$this->dirDelete($this->compiledDir, false);
			$oldNames = $this->request->post('old_name');
			$newNames = $this->request->post('new_name');

			if (is_array($oldNames)) {
				foreach ($oldNames as $i => $oldName) {
					$newName = preg_replace("/[^a-zA-Z0-9\-\_]/", "", $newNames[$i]);

					if (is_writable($this->themesDir) && is_dir($this->themesDir . $oldName) && !is_file($this->themesDir . $newName) && !is_dir($this->themesDir . $newName)) {
						rename($this->themesDir . $oldName, $this->themesDir . $newName);

						if ($this->settings->theme == $oldName) {
							$this->settings->theme = $newName;
						}
					} elseif (is_file($this->themesDir . $newName) && $newName != $oldName) {
						$messageError = 'name_exists';
					}
				}
			}

			$action = $this->request->post('action');
			$actionTheme  = $this->request->post('theme');

			switch ($action) {
				case 'set_main_theme': {
						$this->settings->theme = $actionTheme;
						$this->languages->setTranslation();
						$this->themeSettings->setSettings();
						break;
					}
				case 'clone_theme': {
						$newName = $this->settings->theme;

						while (is_dir($this->themesDir . $newName) || is_file($this->themesDir . $newName)) {
							if (preg_match('/(.+)_([0-9]+)$/', $newName, $parts)) {
								$newName = $parts[1] . '_' . ($parts[2] + 1);
							} else {
								$newName = $newName . '_1';
							}
						}

						$this->dirCopy($this->themesDir . $this->settings->theme, $this->themesDir . $newName);
						@unlink($this->themesDir . $newName . '/locked');
						$this->settings->theme = $newName;
						break;
					}
				case 'delete_theme': {
						$this->dirDelete($this->themesDir . $actionTheme);

						if ($actionTheme == $this->settings->theme) {
							$t = current($this->getThemes());
							$this->settings->theme = $t->name;
						}

						break;
					}
			}
		}

		$themes = $this->getThemes();

		if (!is_writable($this->themesDir)) {
			$this->design->assign('message_error', 'permissions');
		}

		$currentTheme = new stdClass();
		$currentTheme->name = $this->settings->theme;
		$currentTheme->locked = is_file($this->themesDir . $currentTheme->name . '/locked');

		$this->design->assign('theme', $currentTheme);
		$this->design->assign('themes', $themes);
		$this->design->assign('themes_dir', $this->themesDir);

		return $this->design->fetch('theme.tpl');
	}

	private function dirCopy($src, $dst)
	{
		if (is_dir($src)) {
			mkdir($dst, 0777);
			$files = scandir($src);

			foreach ($files as $file) {
				if ($file != "." && $file != "..") $this->dirCopy("$src/$file", "$dst/$file");
			}
		} elseif (file_exists($src)) {
			copy($src, $dst);
		}

		chmod($dst, 0777);
	}

	private function dirDelete($path, $deleteSelf = true)
	{
		if (!$dh = opendir($path)) {
			return;
		}

		while (false !== ($obj = readdir($dh))) {
			if ($obj == '.' || $obj == '..') {
				continue;
			}

			$fullPath = $path . '/' . $obj;

			if (is_dir($fullPath)) {
				$this->dirDelete($fullPath, true);
			} else {
				@unlink($fullPath);
			}
		}

		closedir($dh);

		if ($deleteSelf) {
			rmdir($path);
		}

		return;
	}

	private function getThemes()
	{
		if ($handle = opendir($this->themesDir)) {
			while (false !== ($file = readdir($handle))) {
				if (is_dir($this->themesDir . '/' . $file) && $file[0] != '.') {
					$theme = new stdClass();
					$theme->name = $file;
					$theme->locked = is_file($this->themesDir . $file . '/locked');
					$themes[] = $theme;
				}
			}

			closedir($handle);
			sort($themes);
		}

		return $themes;
	}
}
