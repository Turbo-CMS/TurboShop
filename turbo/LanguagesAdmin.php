<?php

require_once 'api/Turbo.php';

class LanguagesAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->languages->deleteLanguage($id);
						}
						break;
					case 'disable':
						$this->languages->updateLanguage($ids, ['enabled' => 0]);
						break;
					case 'enable':
						$this->languages->updateLanguage($ids, ['enabled' => 1]);
						break;
				}
			}

			$positions = $this->request->post('positions');

			foreach ($positions as $position => $id) {
				$this->languages->updateLanguage($id, ['position' => $position + 1]);
			}
		}

		$languages = $this->languages->getLanguages();
		$this->design->assign('languages', $languages);

		return $this->design->fetch('languages.tpl');
	}
}
