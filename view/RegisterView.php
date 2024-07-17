<?php

require_once 'View.php';

class RegisterView extends View
{
	public function fetch()
	{
		if ($this->user) {
			header('Location: ' . $this->config->root_url);
			exit;
		}

		$defaultStatus = 1;

		// Form
		if ($this->request->isMethod('post') && $this->request->post('register')) {
			$name = $this->request->post('name');
			$email = $this->request->post('email');
			$phone = $this->request->post('phone');
			$address = $this->request->post('address');
			$password = $this->request->post('password');
			$captchaCode = $this->request->post('captcha_code');

			$this->design->assign('name', $name);
			$this->design->assign('email', $email);
			$this->design->assign('phone', $phone);
			$this->design->assign('address', $address);

			$this->db->query("SELECT COUNT(*) AS count FROM __users WHERE email=?", $email);
			$userExists = $this->db->result('count');

			if ($userExists) {
				$this->design->assign('error', 'user_exists');
			} elseif (empty($name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($email)) {
				$this->design->assign('error', 'empty_email');
			} elseif (empty($password)) {
				$this->design->assign('error', 'empty_password');
			} elseif ($this->settings->captcha_register && (($_SESSION['captcha_register'] != $captchaCode || empty($captchaCode)) || empty($_SESSION['captcha_register']))) {
				$this->design->assign('error', 'captcha');
			} elseif ($userId = $this->users->addUser(['name' => $name, 'email' => $email, 'phone' => $phone, 'address' => $address, 'password' => $password, 'enabled' => $defaultStatus, 'last_ip' => $_SERVER['REMOTE_ADDR']])) {
				$_SESSION['user_id'] = $userId;
				if (!empty($_SESSION['last_visited_page'])) {
					header('Location: ' . $_SESSION['last_visited_page']);
				} else {
					header('Location: ' . $this->config->root_url);
				}
			} else {
				$this->design->assign('error', 'unknown error');
			}
		}

		// Display
		return $this->design->fetch('register.tpl');
	}
}
