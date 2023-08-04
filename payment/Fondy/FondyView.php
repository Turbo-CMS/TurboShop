<?php

require_once 'view/View.php';

class FondyView extends View
{
	public function __construct()
	{
		parent::__construct();
	}

	//////////////////////////////////////////
	// Main function
	//////////////////////////////////////////
	public function fetch()
	{
		// Cart contents
		$this->design->assign('cart', $this->cart->getCart());

		// Product categories
		$this->design->assign('categories', $this->categories->getCategoriesTree());

		// Pages
		$pages = $this->pages->getPages(['visible' => 1]);
		$this->design->assign('pages', $pages);

		// Create the main block of the page
		$content = $this->design->fetch('payment/fondy/fondy.tpl');

		// Passing the main block to the template
		$this->design->assign('content', $content);

		// Create the current site wrapper (usually index.tpl)
		$wrapper = $this->design->smarty->getTemplateVars('wrapper');

		if (empty($wrapper)) {
			$wrapper = 'index.tpl';
		}

		$body = $this->design->fetch($wrapper);
		return $body;
	}
}
