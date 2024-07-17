<?php

require_once 'api/Turbo.php';

class ThemeSettingsAdmin extends Turbo
{
	public function fetch()
	{
		$lockedTheme = is_file('design/' . $this->settings->theme . '/locked');
		$this->design->assign('locked_theme', $lockedTheme);

		if (!$lockedTheme && $this->request->isMethod('post')) {
			$themeSettings = $this->request->post('theme_settings');

			foreach ($themeSettings as $name => $value) {
				$this->themeSettings->{$name} = $value;
			}

			$this->themeSettings->dumpSettings();
			$this->design->assign('message_success', 'saved');
		}

		$themeSettingsXML = $this->themeSettings->getThemeSettingsXML();
		$this->design->assign('theme_settings_xml', $themeSettingsXML);

		$themeSettings = $this->themeSettings->getThemeSettings();
		$this->design->assign('theme_settings', $themeSettings);

		$this->design->assign('theme', $this->settings->theme);

		return $this->design->fetch('theme_settings.tpl');
	}
}
