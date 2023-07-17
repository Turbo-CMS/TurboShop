<?php

require_once 'Turbo.php';

class Translations extends Turbo
{
	private $vars = [];

	public function __construct()
	{
		parent::__construct();
		$this->initTranslations();
	}

	/**
	 * Initializes translations
	 */
	public function initTranslations()
	{
		$langLabel = $_SESSION['lang'] ?? $this->settings->lang_label;
		$language = $this->languages->languages(['id' => $this->languages->langId, 'label' => $langLabel]);

		if ($language) {
			$translations = $this->languages->getTranslations(['lang' => $language->label]);

			if (is_array($translations)) {
				foreach ($translations as $result) {
					$this->vars[$result->label] = $result->value;
				}
			}
		}
	}

	/**
	 * Get translation 
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
}
