<?php

require_once 'api/Turbo.php';

class TranslationsAdmin extends Turbo
{
	public function fetch(): string
	{
		$lockedTheme = is_file('design/' . $this->settings->theme . '/locked');
		$this->design->assign('locked_theme', $lockedTheme);

		if (!$lockedTheme && $this->request->method('post')) {
			$ids = (array) $this->request->post('check');

			if (!empty($ids)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->languages->deleteTranslation((int) $id);
						}
						break;
				}
			}
		}

		$filter = [];
		$filter['page'] = max(1, (int) $this->request->get('page'));
		$filter['limit'] = 40;

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		if ($sort = (string) $this->request->get('sort')) {
			$_SESSION['translations_sort'] = $sort;
		}

		if (!empty($_SESSION['translations_sort'])) {
			$filter['sort'] = $_SESSION['translations_sort'];
		} else {
			$filter['sort'] = 'label';
		}

		$this->design->assign('sort', $filter['sort']);

		$translationsCount = $this->languages->countTranslations($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $translationsCount;
		}

		$translations = $this->languages->getTranslations($filter, true);

		$this->design->assign('pages_count', ceil($translationsCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('translations', $translations);
		$this->design->assign('translations_count', $translationsCount);

		return $this->design->fetch('translations.tpl');
	}
}
