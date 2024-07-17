<?php

require_once 'api/Turbo.php';

class BrandsAdmin extends Turbo
{
	public function fetch()
	{
		$filter = [];
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = $this->settings->brands_num_admin;

		$keyword = $this->request->get('keyword');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		if ($this->request->isMethod('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable': {
							foreach ($ids as $id) {
								$this->brands->updateBrand($id, ['visible' => 0]);
							}
							break;
						}
					case 'enable': {
							foreach ($ids as $id) {
								$this->brands->updateBrand($id, ['visible' => 1]);
							}
							break;
						}
					case 'delete':
						foreach ($ids as $id) {
							$this->brands->deleteBrand($id);
						}
						break;
				}
			}
		}

		$brandsCount = $this->brands->countBrands($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $brandsCount;
		}

		if ($filter['limit'] > 0) {
			$pagesCount = ceil($brandsCount / $filter['limit']);
		} else {
			$pagesCount = 0;
		}

		$filter['page'] = min($filter['page'], $pagesCount);

		$this->design->assign('brands_count', $brandsCount);
		$this->design->assign('pages_count', $pagesCount);
		$this->design->assign('current_page', $filter['page']);

		$brands = $this->brands->getBrands($filter);

		$this->design->assign('brands', $brands);

		$body = $this->design->fetch('brands.tpl');

		return $body;
	}
}
