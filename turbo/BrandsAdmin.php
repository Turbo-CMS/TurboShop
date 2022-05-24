<?php

require_once('api/Turbo.php');

class BrandsAdmin extends Turbo
{
	function fetch()
	{

		// Action processing 	
		if ($this->request->method('post')) {

			// Actions with selected
			$ids = $this->request->post('check');

			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id)
								$this->brands->delete_brand($id);
							break;
						}
				}
		}

		$brands = $this->brands->get_brands();

		$this->design->assign('brands', $brands);
		return $this->body = $this->design->fetch('brands.tpl');
	}
}
