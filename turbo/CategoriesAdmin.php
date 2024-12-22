<?php

require_once 'api/Turbo.php';

class CategoriesAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'disable':
						foreach ($ids as $id) {
							$this->categories->updateCategory($id, ['visible' => 0]);
						}
						break;
					case 'enable':
						foreach ($ids as $id) {
							$this->categories->updateCategory($id, ['visible' => 1]);
						}
						break;
					case 'unset_featured':
						foreach ($ids as $id) {
							$this->categories->updateCategory($id, ['featured' => 0]);
						}
						break;
					case 'set_featured':
						foreach ($ids as $id) {
							$this->categories->updateCategory($id, ['featured' => 1]);
						}
						break;
					case 'delete':
						$this->categories->deleteCategory($ids);
						break;
				}
			}

			$positions = $this->request->post('positions');
			$ids = array_keys($positions);
			sort($positions);

			foreach ($positions as $i => $position) {
				$this->categories->updateCategory($ids[$i], ['position' => $position]);
			}
		}

		$categories = $this->categories->getCategoriesTree();

		$this->design->assign('categories', $categories);

		return $this->design->fetch('categories.tpl');
	}
}
