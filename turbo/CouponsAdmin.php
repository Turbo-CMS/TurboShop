<?php

require_once 'api/Turbo.php';

class CouponsAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids) && count($ids) > 0) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->coupons->deleteCoupon((int) $id);
						}
						break;
				}
			}
		}

		$filter = [];
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = 20;

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$couponsCount = $this->coupons->countCoupons($filter);

		$pagesCount = ceil($couponsCount / $filter['limit']);
		$filter['page'] = min($filter['page'], $pagesCount);

		$this->design->assign('coupons_count', $couponsCount);
		$this->design->assign('pages_count', $pagesCount);
		$this->design->assign('current_page', $filter['page']);

		$coupons = $this->coupons->getCoupons($filter);

		$this->design->assign('coupons', $coupons);

		return $this->design->fetch('coupons.tpl');
	}
}
