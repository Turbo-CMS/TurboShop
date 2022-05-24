<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 * This class uses the template register.tpl
 *
 */

require_once('View.php');

class RegisterView extends View
{
	function fetch()
	{
		if ($this->user) {
			header('Location: ' . $this->config->root_url);
			exit();
		}

		$default_status = 1; // Whether the user is active immediately after registration (0 or 1)

		if ($this->request->method('post') && $this->request->post('register')) {
			$name			= $this->request->post('name');
			$email			= $this->request->post('email');
			$phone			= $this->request->post('phone');
			$address        = $this->request->post('address');
			$password		= $this->request->post('password');
			$captcha_code   = $this->request->post('captcha_code');

			$this->design->assign('name', $name);
			$this->design->assign('email', $email);
			$this->design->assign('phone', $phone);
			$this->design->assign('address', $address);

			$this->db->query('SELECT count(*) as count FROM __users WHERE email=?', $email);
			$user_exists = $this->db->result('count');

			if ($user_exists)
				$this->design->assign('error', 'user_exists');
			elseif (empty($name))
				$this->design->assign('error', 'empty_name');
			elseif (empty($email))
				$this->design->assign('error', 'empty_email');
			elseif (empty($password))
				$this->design->assign('error', 'empty_password');
			elseif ($this->settings->captcha_register && (($_SESSION['captcha_register'] != $captcha_code || empty($captcha_code)) || empty($_SESSION['captcha_register']))) {
				$this->design->assign('error', 'captcha');
			} elseif ($user_id = $this->users->add_user(array('name' => $name, 'email' => $email, 'phone' => $phone, 'address' => $address, 'password' => $password, 'enabled' => $default_status, 'last_ip' => $_SERVER['REMOTE_ADDR']))) {
				$_SESSION['user_id'] = $user_id;
				if (!empty($_SESSION['last_visited_page']))
					header('Location: ' . $_SESSION['last_visited_page']);
				else
					header('Location: ' . $this->config->root_url);
			} else
				$this->design->assign('error', 'unknown error');
		}
		return $this->design->fetch('register.tpl');
	}
}
