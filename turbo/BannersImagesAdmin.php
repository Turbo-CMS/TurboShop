<?php

require_once 'api/Turbo.php';

class BannersImagesAdmin extends Turbo
{
	public function fetch()
	{
		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => 20,];

		$banners = $this->banners->getBanners();
		$this->design->assign('banners', $banners);

		$bannerId = $this->request->get('banner_id', 'integer');

		if ($bannerId && $banner = $this->banners->getBanner($bannerId)) {
			$filter['banner_id'] = $banner->id;
		}

		$filterValue = $this->request->get('filter', 'string');

		if ($filterValue) {
			switch ($filterValue) {
				case 'visible':
					$filter['visible'] = 1;
					break;
				case 'hidden':
					$filter['visible'] = 0;
					break;
			}

			$this->design->assign('filter', $filterValue);
		}

		if ($this->request->method('post')) {
			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);
			$positions = array_reverse($positions);

			foreach ($positions as $i => $position) {
				$this->banners->updateBannersImage($ids[$i], ['position' => $position]);
			}

			$imageBanners = $this->request->post('image_banners');

			foreach ($imageBanners as $i => $imageBanner) {
				$this->banners->updateBannersImage($i, ['banner_id' => $imageBanner]);
			}

			$ids = $this->request->post('check');

			if (!empty($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						$this->banners->updateBannersImage($ids, ['visible' => 0]);
						break;
					case 'enable':
						$this->banners->updateBannersImage($ids, ['visible' => 1]);
						break;
					case 'delete':
						foreach ($ids as $id) {
							$this->banners->deleteBannersImage($id);
						}
						break;
					case 'move_to_banner':
						$bannerId = $this->request->post('target_banner', 'integer');
						$filter['page'] = 1;
						$banner = $this->banners->getBanner($bannerId);
						$filter['banner_id'] = $banner->id;

						foreach ($ids as $id) {
							$this->banners->updateBannersImage($ids, ['banner_id' => $banner->id]);
						}
						break;
				}
			}
		}

		if (isset($banner)) {
			$this->design->assign('banner', $banner);
		}

		$bannersImagesCount = $this->banners->countBannersImages($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $bannersImagesCount;
		}

		if ($filter['limit'] > 0) {
			$pagesCount = ceil($bannersImagesCount / $filter['limit']);
		} else {
			$pagesCount = 0;
		}

		$filter['page'] = min($filter['page'], $pagesCount);

		$this->design->assign('banners_images_count', $bannersImagesCount);
		$this->design->assign('pages_count', $pagesCount);
		$this->design->assign('current_page', $filter['page']);

		$bannersImages = [];

		foreach ($this->banners->getBannersImages($filter) as $p) {
			$bannersImages[$p->id] = $p;
		}

		$this->design->assign('banners_images', $bannersImages);

		return $this->design->fetch('banners_images.tpl');
	}
}
