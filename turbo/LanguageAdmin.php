<?php

require_once 'api/Turbo.php';

class LanguageAdmin extends Turbo
{
	public function fetch(): string
	{
		$langList = $this->languages->langList();
		$language = new stdClass();

		if ($this->request->method('post')) {
			$lang = $langList[$this->request->post('lang')];
			$language->id = $this->request->post('id', 'integer');
			$language->enabled = $this->request->post('enabled', 'boolean');
			$language->name = $lang->name;
			$language->label = $lang->label;

			$this->db->query("SELECT * FROM __languages WHERE label=? LIMIT 1", $language->label);
			$existLabel = $this->db->result();

			if (!$language->label) {
				$this->design->assign('message_error', 'label_empty');
			} elseif ($existLabel && $existLabel->id != $language->id) {
				$this->design->assign('message_error', 'label_exists');
			} else {
				if (empty($language->id)) {
					$language->id = $this->languages->addLanguage($language);
					$this->design->assign('message_success', 'added');
				} else {
					$this->languages->updateLanguage($language->id, $language);
					$this->design->assign('message_success', 'updated');
				}
			}
		} else {
			$language->id = $this->request->get('id', 'integer');

			if (!empty($language->id)) {
				$language = $this->languages->getLanguage($language->id);
			} else {
				$language->id = null;
				$language->label = null;
				$language->enabled = 1;
			}
		}

		$this->design->assign('lang_list', $langList);
		$this->design->assign('language', $language);

		return $this->design->fetch('language.tpl');
	}
}
