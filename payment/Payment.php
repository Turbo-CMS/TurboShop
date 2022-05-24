<?PHP

/**
 * Turbo CMS
 *
 */

require_once('api/Turbo.php');


class PaymentModule extends Turbo
{
 
	public function checkout_form()
	{
		$form = '<input type=submit value="Pay">';	
		return $form;
	}
	public function settings()
	{
		$form = '<input type=submit value="Pay">';	
		return $form;
	}
}
