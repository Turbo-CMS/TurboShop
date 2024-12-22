<?php

require_once 'api/Turbo.php';

class FeaturesAdmin extends Turbo
{
	public function fetch()
	{
		$filter = [];
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = $this->settings->features_num_admin;

		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'set_in_filter': {
							$this->features->updateFeature($ids, ['in_filter' => 1]);
							break;
						}
					case 'unset_in_filter': {
							$this->features->updateFeature($ids, ['in_filter' => 0]);
							break;
						}
					case 'delete': {
							$currentCat = $this->request->get('category_id', 'integer');

							foreach ($ids as $id) {
								$cats = $this->features->getFeatureCategories($id);

								$diff = array_diff($cats, (array) $currentCat);
								if (!empty($currentCat) && !empty($diff)) {
									$this->features->updateFeatureCategories($id, $diff);
								} else {
									$this->features->deleteFeature($id);
								}
							}
							break;
						}
				}
			}

			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->features->updateFeature($ids[$i], ['position' => $position]);
			}
		}

		$categories = $this->categories->getCategoriesTree();
		$category = null;
		$categoryId = $this->request->get('category_id', 'integer');

		if ($categoryId) {
			$category = $this->categories->getCategory($categoryId);
			$filter['category_id'] = $category->id;
		}

		$featuresCount = $this->features->countFeatures($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $featuresCount;
		}

		if ($filter['limit'] > 0) {
			$pagesCount = ceil($featuresCount / $filter['limit']);
		} else {
			$pagesCount = 0;
		}

		$filter['page'] = min($filter['page'], $pagesCount);

		$this->design->assign('features_count', $featuresCount);
		$this->design->assign('pages_count', $pagesCount);
		$this->design->assign('current_page', $filter['page']);

		$features = $this->features->getFeatures($filter);

		$this->design->assign('categories', $categories);
		$this->design->assign('category', $category);
		$this->design->assign('features', $features);

		$body = $this->design->fetch('features.tpl');

		return $body;
	}
}
