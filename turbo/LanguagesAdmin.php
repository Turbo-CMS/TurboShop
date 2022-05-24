<?php

require_once('api/Turbo.php');

class LanguagesAdmin extends Turbo
{

	public function fetch()
	{

		// Action processing
		if ($this->request->method('post')) {
			// Actions with selected
			$ids = $this->request->post('check');

			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id)
								$this->languages->delete_language($id);
							break;
						}
					case 'disable': {
							$this->languages->update_language($ids, array('enabled' => 0));
							break;
						}
					case 'enable': {
							$this->languages->update_language($ids, array('enabled' => 1));
							break;
						}
				}

			// Sorting
			$positions = $this->request->post('positions');
			foreach ($positions as $position => $id)
				$this->languages->update_language($id, array('position' => $position + 1));
		}

		//$languages = null;
		$languages = $this->languages->get_languages();
		$this->design->assign('languages', $languages);

		return $this->design->fetch('languages.tpl');
	}
}
