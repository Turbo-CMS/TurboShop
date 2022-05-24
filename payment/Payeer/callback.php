<?php
chdir ('../../');
require_once('api/Turbo.php');

if (isset($_POST["m_operation_id"]) && isset($_POST["m_sign"]))
{
	// order loading
	
	$turbo = new Turbo();
	$order_id = $_POST['m_orderid'];
	$order = $turbo->orders->get_order(intval($order_id));
	
	if(!empty($order))
	{
		$method = $turbo->payment->get_payment_method(intval($order->payment_method_id));
		
		if(!empty($method))
		{
			$err = false;
			$message = '';
			$settings = unserialize($method->settings);
			
			// logging
			
			$log_text = 
			"--------------------------------------------------------\n" .
			"operation id		" . $_POST['m_operation_id'] . "\n" .
			"operation ps		" . $_POST['m_operation_ps'] . "\n" .
			"operation date		" . $_POST['m_operation_date'] . "\n" .
			"operation pay date	" . $_POST['m_operation_pay_date'] . "\n" .
			"shop				" . $_POST['m_shop'] . "\n" .
			"order id			" . $_POST['m_orderid'] . "\n" .
			"amount				" . $_POST['m_amount'] . "\n" .
			"currency			" . $_POST['m_curr'] . "\n" .
			"description		" . base64_decode($_POST['m_desc']) . "\n" .
			"status				" . $_POST['m_status'] . "\n" .
			"sign				" . $_POST['m_sign'] . "\n\n";
			
			$log_file = $settings['payeer_log'];
			
			if (!empty($log_file))
			{
				file_put_contents($_SERVER['DOCUMENT_ROOT'] . $log_file, $log_text, FILE_APPEND);
			}
			
			// verification of digital signature and ip

			$sign_hash = strtoupper(hash('sha256', implode(":", array(
				$_POST['m_operation_id'],
				$_POST['m_operation_ps'],
				$_POST['m_operation_date'],
				$_POST['m_operation_pay_date'],
				$_POST['m_shop'],
				$_POST['m_orderid'],
				$_POST['m_amount'],
				$_POST['m_curr'],
				$_POST['m_desc'],
				$_POST['m_status'],
				$settings['payeer_secret']
			))));
			
			$valid_ip = true;
			$sIP = str_replace(' ', '', $settings['payeer_ip_list']);
			
			if (!empty($sIP))
			{
				$arrIP = explode('.', $_SERVER['REMOTE_ADDR']);
				if (!preg_match('/(^|,)(' . $arrIP[0] . '|\*{1})(\.)' .
				'(' . $arrIP[1] . '|\*{1})(\.)' .
				'(' . $arrIP[2] . '|\*{1})(\.)' .
				'(' . $arrIP[3] . '|\*{1})($|,)/', $sIP))
				{
					$valid_ip = false;
				}
			}
			
			if (!$valid_ip)
			{
				$message .= " - server ip address not trusted\n" .
				"   trusted ip: " . $sIP . "\n" .
				"   current server ip: " . $_SERVER['REMOTE_ADDR'] . "\n";
				$err = true;
			}

			if ($_POST['m_sign'] != $sign_hash)
			{
				$message .= " - digital signatures do not match\n";
				$err = true;
			}
			
			if (!$err)
			{
				// sum check
				
				if ($_POST['m_amount'] != $order->total_price)
				{
					$message .= " - wrong amount\n";
					$err = true;
				}
				
				// status check
				
				if (!$err)
				{
					switch ($_POST['m_status'])
					{
						case 'success':
						
							if (!$order->paid)
							{
								$turbo->orders->update_order(intval($order_id),
									array(
									'paid' => 1,
									'status' => $settings['payeer_order_status']
								));
								
								$turbo->notify->email_order_user(intval($order_id));
								$turbo->orders->close(intval($order_id));
							}
							
							break;
							
						default:
							$message .= " - payment status is not success\n";
							$err = true;
							break;
					}
				}
			}
			
			if ($err)
			{
				$to = $settings['payeer_email'];

				if (!empty($to))
				{
					$message = "It was not possible to make a payment through the Payeer system for the following reasons:\n\n" . $message . "\n" . $log_text;
					$headers = "From: no-reply@" . $_SERVER['HTTP_HOST'] . "\r\n" . 
					"Content-type: text/plain; charset=utf-8 \r\n";
					mail($to, 'Payment error', $message, $headers);
				}
				
				exit($order_id . '|error');
			}
			else
			{
				exit($order_id . '|success');
			}
		}
	}
}