<?php

require_once 'api/Turbo.php';

class PaymentModule extends Turbo
{
	/**
	 * Returns checkout form
	 *
	 * @return string $form - HTML form to be displayed on the checkout page
	 */
	public function checkout_form()
	{
		$form = '<input type=submit value="Pay">';
		return $form;
	}

	/**
	 * Returns settings for the payment module
	 *
	 * @return string $form - HTML form to be displayed in the payment module settings
	 */
	public function settings()
	{
		$form = '<input type=submit value="Pay">';
		return $form;
	}
}
