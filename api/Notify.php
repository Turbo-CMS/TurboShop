<?php

require_once 'Turbo.php';

use PHPMailer\PHPMailer\PHPMailer;

require_once 'phpmailer/src/Exception.php';
require_once 'phpmailer/src/PHPMailer.php';
require_once 'phpmailer/src/SMTP.php';

class Notify extends Turbo
{
	/**
	 * Send Email SMTP
	 */
	public function SMTP($to, $subject, $message)
	{
		$mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->Host = $this->settings->smtp_server;
		$mail->SMTPDebug  = 0;
		$mail->SMTPAuth = true;
		$mail->CharSet = 'utf-8';
		$mail->Port = $this->settings->smtp_port;

		if ($mail->Port == 465) {
			$mail->SMTPSecure = "ssl";
			$mail->Host = (strpos($mail->Host, "ssl://") === false) ? "ssl://" . $mail->Host : $mail->Host;
		}

		$mail->Username = $this->settings->smtp_user;
		$mail->Password = $this->settings->smtp_pass;
		$mail->SetFrom($this->settings->smtp_user, $this->settings->notify_from_name);
		$mail->AddReplyTo($this->settings->smtp_user, $this->settings->notify_from_name);
		$mail->Subject = $subject;
		$mail->MsgHTML($message);
		$mail->addCustomHeader("MIME-Version: 1.0\n");

		$recipients = explode(',', $to);

		if (!empty($recipients)) {
			foreach ($recipients as $i => $r) {
				$mail->AddAddress($r);
			}
		} else {
			$mail->AddAddress($to);
		}

		if (!$mail->Send()) {
			file_put_contents('error_log.txt', $mail->ErrorInfo);
		}
	}

	/**
	 * Send Email
	 */
	function email($to, $subject, $message, $from = '', $replyTo = '')
	{
		$headers = "MIME-Version: 1.0\r\n";
		$headers .= "Content-type: text/html; charset=utf-8\r\n";

		if (!empty($from)) {
			$headers .= "From: $from\r\n";
		}

		if (!empty($replyTo)) {
			$headers .= "Reply-To: $replyTo\r\n";
		}

		$subject = '=?utf-8?B?' . base64_encode($subject) . '?=';

		if ($this->settings->use_smtp) {
			$this->SMTP($to, $subject, $message);
		} else {
			mail($to, $subject, $message, $headers);
		}
	}

	/**
	 * Email Order User
	 */
	public function emailOrderUser($orderId)
	{
		if (!($order = $this->orders->getOrder((int) $orderId)) || empty($order->email)) {
			return false;
		}

		$languages = $this->languages->languages();

		if (!empty($order->lang_id) && isset($languages[$order->lang_id])) {
			$curLangId = $this->languages->langId();
			$this->languages->setLangId($order->lang_id);
			$langLink = '';
			$fLang = reset($languages);

			if ($order->lang_id != $fLang->id) {
				$langLink = $languages[$order->lang_id]->label . '/';
			}

			$this->design->assign('lang_link', $langLink);

			$this->money->initCurrencies();
			$this->design->assign("currency", $this->money->getCurrency());

			$this->translations->initTranslations();
			$this->design->assign('lang', $this->translations);
		}

		$purchases = $this->orders->getPurchases(['order_id' => $order->id]);
		$this->design->assign('purchases', $purchases);

		$productsIds = [];
		$variantsIds = [];

		foreach ($purchases as $purchase) {
			$productsIds[] = $purchase->product_id;
			$variantsIds[] = $purchase->variant_id;
		}

		$products = [];

		foreach ($this->products->getProducts(['id' => $productsIds]) as $p) {
			$products[$p->id] = $p;
		}

		$images = $this->products->getImages(['product_id' => $productsIds]);

		foreach ($images as $image) {
			$products[$image->product_id]->images[] = $image;
		}

		$variants = [];

		foreach ($this->variants->getVariants(['id' => $variantsIds]) as $v) {
			$variants[$v->id] = $v;
			$products[$v->product_id]->variants[] = $v;
		}

		foreach ($purchases as &$purchase) {
			if (!empty($products[$purchase->product_id])) {
				$purchase->product = $products[$purchase->product_id];
			}

			if (!empty($variants[$purchase->variant_id])) {
				$purchase->variant = $variants[$purchase->variant_id];
			}
		}

		$delivery = $this->delivery->getDelivery($order->delivery_id);
		$this->design->assign('delivery', $delivery);

		$this->design->assign('order', $order);
		$this->design->assign('purchases', $purchases);

		if ($this->design->smarty->getTemplateVars('currency') === null) {
			$this->design->assign('currency', current($this->money->getCurrencies(['enabled' => 1])));
		}

		$emailTemplate = $this->design->fetch($this->config->root_dir . 'design/' . $this->settings->theme . '/html/email/email_order.tpl');

		$subject = $this->design->getVar('subject');
		$from = ($this->settings->notify_from_name ? $this->settings->notify_from_name . "<" . $this->settings->notify_from_email . ">" : $this->settings->notify_from_email);

		$this->email($order->email, $subject, $emailTemplate, $from);

		if (!empty($order->lang_id) && isset($languages[$order->lang_id])) {
			$this->languages->setLangId($curLangId);
			$langLink = '';
			$fLang = reset($languages);

			if ($order->lang_id != $fLang->id) {
				$langLink = $languages[$order->lang_id]->label . '/';
			}

			$this->design->assign('lang_link', $langLink);

			$this->money->initCurrencies();
			$this->design->assign("currency", $this->money->getCurrency());

			$this->translations->initTranslations();
			$this->design->assign('lang', $this->translations);
		}
	}

	/**
	 * Email Order Admin
	 */
	public function emailOrderAdmin($orderId)
	{
		$order = $this->orders->getOrder((int) $orderId);

		if (!$order) {
			return false;
		}

		$purchases = $this->orders->getPurchases(['order_id' => $order->id]);

		$this->design->assign('purchases', $purchases);

		$productsIds = [];
		$variantsIds = [];

		foreach ($purchases as $purchase) {
			$productsIds[] = $purchase->product_id;
			$variantsIds[] = $purchase->variant_id;
		}

		$products = [];

		foreach ($this->products->getProducts(['id' => $productsIds]) as $product) {
			$products[$product->id] = $product;
		}

		$images = $this->products->getImages(['product_id' => $productsIds]);

		foreach ($images as $image) {
			if (isset($products[$image->product_id])) {
				$products[$image->product_id]->images[] = $image;
			}
		}

		$variants = [];

		foreach ($this->variants->getVariants(['id' => $variantsIds]) as $variant) {
			$variants[$variant->id] = $variant;

			if (isset($products[$variant->product_id])) {
				$products[$variant->product_id]->variants[] = $variant;
			}
		}

		foreach ($purchases as &$purchase) {
			if (isset($products[$purchase->product_id])) {
				$purchase->product = $products[$purchase->product_id];
			}

			if (isset($variants[$purchase->variant_id])) {
				$purchase->variant = $variants[$purchase->variant_id];
			}
		}

		$delivery = $this->delivery->getDelivery($order->delivery_id);
		$user = $this->users->getUser((int) $order->user_id);

		$this->design->assign('delivery', $delivery);
		$this->design->assign('user', $user);
		$this->design->assign('order', $order);
		$this->design->assign('purchases', $purchases);
		$this->design->assign('main_currency', $this->money->getCurrency());

		$backendTranslations = $this->backendTranslations;
		$file = "turbo/lang/" . $this->settings->email_lang . ".php";

		if (!file_exists($file)) {
			foreach (glob("turbo/lang/??.php") as $f) {
				$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}

		require_once $file;

		$this->design->assign('btr', $backendTranslations);

		$emailTemplate = $this->design->fetch($this->config->root_dir . 'turbo/design/html/email_order_admin.tpl');

		$subject = $this->design->getVar('subject');

		$this->email($this->settings->order_email, $subject, $emailTemplate, $this->settings->notify_from_email);
	}

	/**
	 * Email Comment Admin
	 */
	public function emailCommentAdmin($commentId)
	{
		$comment = $this->comments->getComment((int) $commentId);

		if (!$comment) {
			return false;
		}

		if ($comment->type == 'product') {
			$comment->product = $this->products->getProduct((int) $comment->object_id);
		} elseif ($comment->type == 'article') {
			$comment->article = $this->articles->getArticle((int) $comment->object_id);
		} elseif ($comment->type == 'blog') {
			$comment->post = $this->blog->getPost((int) $comment->object_id);
		}

		$this->design->assign('comment', $comment);

		$backendTranslations = $this->backendTranslations;

		$file = "turbo/lang/" . $this->settings->email_lang . ".php";

		if (!file_exists($file)) {
			foreach (glob("turbo/lang/??.php") as $f) {
				$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}

		require_once $file;

		$this->design->assign('btr', $backendTranslations);

		$emailTemplate = $this->design->fetch($this->config->root_dir . 'turbo/design/html/email_comment_admin.tpl');

		$subject = $this->design->getVar('subject');

		$this->email($this->settings->comment_email, $subject, $emailTemplate, $this->settings->notify_from_email);
	}

	/**
	 * Email Password Remind
	 */
	public function emailPasswordRemind($userId, $code)
	{
		if (!($user = $this->users->getUser((int) $userId))) {
			return false;
		}

		$this->design->assign('user', $user);
		$this->design->assign('code', $code);

		$emailTemplate = $this->design->fetch($this->config->root_dir . 'design/' . $this->settings->theme . '/html/email/email_password_remind.tpl');
		$subject = $this->design->getVar('subject');

		$from = ($this->settings->notify_from_name ? $this->settings->notify_from_name . "<" . $this->settings->notify_from_email . ">" : $this->settings->notify_from_email);

		$this->email($user->email, $subject, $emailTemplate, $from);

		$this->design->smarty->clearAssign('user');
		$this->design->smarty->clearAssign('code');
	}

	/**
	 * Email Feedback Admin
	 */
	public function emailFeedbackAdmin($feedbackId)
	{
		if (!$feedback = $this->feedbacks->getFeedback($feedbackId)) {
			return false;
		}

		$this->design->assign('feedback', $feedback);

		$backendTranslations = $this->backendTranslations;

		$file = "turbo/lang/" . $this->settings->email_lang . ".php";

		if (!file_exists($file)) {
			foreach (glob("turbo/lang/??.php") as $f) {
				$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}

		require_once $file;

		$this->design->assign('btr', $backendTranslations);

		$emailTemplate = $this->design->fetch($this->config->root_dir . 'turbo/design/html/email_feedback_admin.tpl');

		$subject = $this->design->getVar('subject');

		$this->email($this->settings->comment_email, $subject, $emailTemplate, $this->settings->notify_from_email);

		return true;
	}

	/**
	 * Email Callback Admin
	 */
	public function emailCallbackAdmin($callbackId)
	{
		if (!$callback = $this->callbacks->getCallback($callbackId)) {
			return false;
		}

		$this->design->assign('callback', $callback);

		$backendTranslations = $this->backendTranslations;

		$file = "turbo/lang/" . $this->settings->email_lang . ".php";

		if (!file_exists($file)) {
			foreach (glob("turbo/lang/??.php") as $f) {
				$file = "turbo/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}

		require_once $file;

		$this->design->assign('btr', $backendTranslations);

		$emailTemplate = $this->design->fetch($this->config->root_dir . 'turbo/design/html/email_callback_admin.tpl');

		$subject = $this->design->getVar('subject');

		$this->email($this->settings->comment_email, $subject, $emailTemplate, $this->settings->notify_from_email);

		return true;
	}
}
