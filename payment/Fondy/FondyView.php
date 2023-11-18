<?php

require_once 'view/View.php';

class FondyView extends View
{
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * Main function
	 */
	public function fetch()
	{
		// Cart
		$this->design->assign('cart', $this->cart->getCart());

		// Categories
		$this->design->assign('categories', $this->categories->getCategoriesTree());

		// Pages
		$pages = $this->pages->getPages(['visible' => 1]);
		$this->design->assign('pages', $pages);

		// Create block
		$content = $this->design->fetch('payment/Fondy/fondy.tpl');

		// Content
		$this->design->assign('content', $content);

		// Wrapper
		$wrapper = $this->design->smarty->getTemplateVars('wrapper');

		if (empty($wrapper)) {
			$wrapper = 'index.tpl';
		}

		$body = $this->design->fetch($wrapper);
		return $body;
	}
}
