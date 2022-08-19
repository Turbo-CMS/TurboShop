<?php

require_once('api/Turbo.php');

class TranslationsAdmin extends Turbo
{
	public function fetch()
	{
		$admin_theme = $this->settings->admin_theme;
		if ($admin_theme) {
			$locked_theme = is_file('design/' . $admin_theme . '/locked');
		} else {
			$locked_theme = is_file('design/' . $this->settings->theme . '/locked');
		}
		$this->design->assign('locked_theme', $locked_theme);

		// Action processing
		if (!$locked_theme && $this->request->method('post')) {
			// Actions with selected
			$ids = $this->request->post('check');

			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id)
								$this->languages->delete_translation($id);
							break;
						}
				}
		}

		// Display
		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = 40;

		// Search
		$keyword = $this->request->get('keyword', 'string');
		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		// Sorting of translations, save in session so that the current sorting is not reset 
		if ($sort = $this->request->get('sort', 'string'))
			$_SESSION['translations_sort'] = $sort;
		if (!empty($_SESSION['translations_sort']))
			$filter['sort'] = $_SESSION['translations_sort'];
		else
			$filter['sort'] = 'label';
		$this->design->assign('sort', $filter['sort']);

		$translations_count = $this->languages->count_translations($filter);

		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $translations_count;

		$translations = $this->languages->get_translations($filter, true);

		$this->design->assign('pages_count', ceil($translations_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('translations', $translations);
		$this->design->assign('translations_countt', $translations_count);
		return $this->design->fetch('translations.tpl');
	}
}
