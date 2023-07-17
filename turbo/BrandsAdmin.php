<?php

require_once 'api/Turbo.php';

class BrandsAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($ids as $id) {
							$this->brands->deleteBrand($id);
						}
						break;
				}
			}
		}

		$brands = $this->brands->getBrands();
		$this->design->assign('brands', $brands);

		$body = $this->design->fetch('brands.tpl');

		return $body;
	}
}
