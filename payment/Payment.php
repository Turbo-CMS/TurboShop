<?php

require_once 'api/Turbo.php';

class PaymentModule extends Turbo
{
	/**
	 * Returns checkout form
	 */
	public function checkoutForm()
	{
		$form = '<input type=submit value="Pay">';

		return $form;
	}

	/**
	 * Returns settings
	 */
	public function settings()
	{
		$form = '<input type=submit value="Pay">';

		return $form;
	}
}
