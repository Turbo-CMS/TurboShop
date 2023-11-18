<?php

require_once 'api/Turbo.php';

class ThemeSettingsAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$themeSettings = $this->request->post('theme_settings');

			foreach ($themeSettings as $name => $value) {
				$this->themeSettings->{$name} = $value;
			}

			$this->design->assign('message_success', 'saved');
		}

		$themeSettingsXLM = $this->themeSettings->getThemeSettingsXML();
		$this->design->assign('theme_settings_xml', $themeSettingsXLM);

		$themeSettings = $this->themeSettings->getThemeSettings();
        $this->design->assign('theme_settings', $themeSettings);

		$this->design->assign('theme', $this->settings->theme);

		return $this->design->fetch('theme_settings.tpl');
	}
}
