<?php

require_once 'View.php';

class LoginView extends View
{
	public function fetch()
	{
		// Login
		if ($this->request->get('action') == 'logout') {
			unset($_SESSION['user_id']);
			header('Location: ' . $this->config->root_url . '/' . $this->language->label);
			exit();
			// If Authorized	
		} elseif ($this->user) {
			header('Location: ' . $this->config->root_url . '/' . $this->language->label);
			exit();
			// Remember Password	
		} elseif ($this->request->get('action') == 'password_remind') {
			// Form
			if ($this->request->isMethod('post') && $this->request->post('email')) {
				$email = $this->request->post('email');
				$this->design->assign('email', $email);
				$user = $this->users->getUser($email);
				if (!empty($user)) {
					$code = md5(uniqid($this->config->salt, true));
					$_SESSION['password_remind_code'] = $code;
					$_SESSION['password_remind_user_id'] = $user->id;

					$this->notify->emailPasswordRemind($user->id, $code);

					$this->design->assign('email_sent', true);
				} else {
					$this->design->assign('error', 'user_not_found');
				}
				// link Reset Password	
			} elseif ($this->request->get('code')) {
				if (!isset($_SESSION['password_remind_code']) || !isset($_SESSION['password_remind_user_id'])) {
					return false;
				}

				if ($this->request->get('code') != $_SESSION['password_remind_code']) {
					return false;
				}

				$user = $this->users->getUser((int) $_SESSION['password_remind_user_id']);

				if (empty($user)) {
					return false;
				}

				$_SESSION['user_id'] = $user->id;
				header('Location: ' . $this->config->root_url . '/' . $this->language->label . '/user');
			}

			return $this->design->fetch('password_remind.tpl');
			// Login	
		} elseif ($this->request->isMethod('post') && $this->request->post('login')) {
			$email = $this->request->post('email');
			$password = $this->request->post('password');
			$this->design->assign('email', $email);

			if ($user_id = $this->users->checkPassword($email, $password)) {
				$user = $this->users->getUser($email);
				if ($user->enabled) {
					$_SESSION['user_id'] = $user_id;
					$this->users->updateUser($user_id, array('last_ip' => $_SERVER['REMOTE_ADDR']));

					if (!empty($_SESSION['last_visited_page'])) {
						header('Location: ' . $_SESSION['last_visited_page']);
					} else {
						header('Location: ' . $this->config->root_url . '/' . $this->language->label);
					}
				} else {
					$this->design->assign('error', 'user_disabled');
				}
			} else {
				$this->design->assign('error', 'login_incorrect');
			}
		}
		// Display
		return $this->design->fetch('login.tpl');
	}
}
