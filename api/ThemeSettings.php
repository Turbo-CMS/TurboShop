<?php

require_once 'Turbo.php';

class ThemeSettings extends Turbo
{
	private $vars;

	function __construct()
	{
		parent::__construct();

		$this->db->query("SELECT name, value FROM __theme_settings");

		foreach ($this->db->results() as $result) {
			if (!($this->vars[$result->name] = @unserialize($result->value))) {
				$this->vars[$result->name] = $result->value;
			}
		}
	}

	/**
	 * Magic Method Get
	 */
	public function __get($name) 
	{
		if ($res = parent::__get($name)) {
			return $res;
		}

		if (isset($this->vars[$name])) {
			return $this->vars[$name];
		} else {
			return null;
		}
	}

	/**
	 * Magic Method Set
	 */
	public function __set($name, $value)
	{
		$this->vars[$name] = $value;

		if (is_array($value)) {
			$value = serialize($value);
		} else {
			$value = (string) $value;
		}

		$this->db->query("SELECT count(*) AS count FROM __theme_settings WHERE name=?", $name);

		if ($this->db->result('count') > 0) {
			$this->db->query("UPDATE __theme_settings SET value=? WHERE name=?", $value, $name);
		} else {
			$this->db->query("INSERT INTO __theme_settings SET value=?, name=?", $value, $name);
		}
	}

	/**
	 * Get Theme Settings
	 */
	public function getThemeSettings()
	{
		return $this->vars;
	}

	/**
	 * Get Theme Settings XML
	 */
	public function getThemeSettingsXML()
	{
		$themeDir = 'design/' . $this->settings->theme;
		$themes = [];
		$handler = opendir($themeDir);

		while ($dir = readdir($handler)) {
			if (!empty($dir) && $dir != "." && $dir != ".." && is_dir($themeDir . '/' . $dir)) {
				$settingsFilePath = $themeDir . '/settings.xml';

				if (is_readable($settingsFilePath) && $xml = simplexml_load_file($settingsFilePath)) {
					$settingsTranslations = $this->getThemeTranslations($themeDir);

					$theme = new stdClass();
					$theme->name = (string) $xml->name;
					$theme->groups = [];

					foreach ($xml->group as $group) {
						$groupName = (string) $group->name;
						$translationName = preg_replace('~{\$lang->(.+)?}~', '$1', $groupName);
						$groupName = isset($settingsTranslations[$translationName]) ? $settingsTranslations[$translationName] : $groupName;

						$themeGroup = new stdClass();
						$themeGroup->name = $groupName;
						$themeGroup->type = (string) $group['type'];
						$themeGroup->settings = [];

						foreach ($group->settings as $setting) {
							$settingName = (string) $setting->name;
							$translationName = preg_replace('~{\$lang->(.+)?}~', '$1', $settingName);
							$settingName = isset($settingsTranslations[$translationName]) ? $settingsTranslations[$translationName] : $settingName;

							$themeSettings = new stdClass();
							$themeSettings->name = $settingName;
							$themeSettings->variable = (string) $setting->variable;
							$themeSettings->visible = (string) $setting->visible;
							$themeSettings->options = [];

							foreach ($setting->options as $option) {
								$optionName = (string) $option->name;
								$translationName = preg_replace('~{\$lang->(.+)?}~', '$1', $optionName);
								$optionName = isset($settingsTranslations[$translationName]) ? $settingsTranslations[$translationName] : $optionName;

								$optionDetails = new stdClass();
								$optionDetails->name = $optionName;
								$optionDetails->value = (string) $option->value;
								$themeSettings->options[] = $optionDetails;
							}

							$themeGroup->settings[] = $themeSettings;
						}

						$theme->groups[] = $themeGroup;
					}

					$themes[$theme->name] = $theme;
				}
			}
		}

		closedir($handler);

		return $themes;
	}

	/**
	 * Get Theme Translations
	 */
	public function getThemeTranslations($themeDir)
	{
		$langLabel = $this->settings->lang;
		$themeDir = 'design/' . $this->settings->theme;

		$lang = [];

		if (is_file($themeDir . '/lang/' . $langLabel . '.php')) {
			include $themeDir . '/lang/' . $langLabel . '.php';
		}

		return $lang;
	}

	/**
	 * Set Settings
	 */
	public function setSettings()
	{
		$this->db->query("TRUNCATE TABLE __theme_settings");

		$themeDir = 'design/' . $this->settings->theme;
		$filename = $themeDir . '/settings.sql';

		if (file_exists($filename)) {
			$this->db->restore($filename);
		}
	}

	/**
	 * Dump Settings
	 */
	public function dumpSettings()
	{
		$themeDir = 'design/' . $this->settings->theme;

		$filename = $themeDir . '/settings.sql';
		$filename = fopen($filename, 'w');

		$this->db->dumpTable('t_theme_settings', $filename);
	}
}
