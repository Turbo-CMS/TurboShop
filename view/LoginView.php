<?php

require_once('View.php');

class LoginView extends View
{
	function fetch()
	{
		// Logout
		if ($this->request->get('action') == 'logout') {
			unset($_SESSION['user_id']);
			header('Location: ' . $this->config->root_url . '/' . $this->language->label);
			exit();
		}

		// If authorized
		elseif ($this->user) {
			header('Location: ' . $this->config->root_url . '/' . $this->language->label);
			exit();
		}

		// Remember password
		elseif ($this->request->get('action') == 'password_remind') {
			// If email was posted
			if ($this->request->method('post') && $this->request->post('email')) {
				$email = $this->request->post('email');
				$this->design->assign('email', $email);

				// Select a user from the database
				$user = $this->users->get_user($email);
				if (!empty($user)) {
					// Generate a secret code and save it in the session
					$code = md5(uniqid($this->config->salt, true));
					$_SESSION['password_remind_code'] = $code;
					$_SESSION['password_remind_user_id'] = $user->id;

					// Send an email to the user to reset their password
					$this->notify->email_password_remind($user->id, $code);
					$this->design->assign('email_sent', true);
				} else {
					$this->design->assign('error', 'user_not_found');
				}
			}
			// If we were followed by a link to reset the password
			elseif ($this->request->get('code')) {
				// Check if the session exists
				if (!isset($_SESSION['password_remind_code']) || !isset($_SESSION['password_remind_user_id']))
					return false;

				// Check if the code in the session and in the link match
				if ($this->request->get('code') != $_SESSION['password_remind_code'])
					return false;

				// Select a user from the database
				$user = $this->users->get_user(intval($_SESSION['password_remind_user_id']));
				if (empty($user))
					return false;

				// Log in as a user and go to the account to change the password
				$_SESSION['user_id'] = $user->id;
				header('Location: ' . $this->config->root_url . '/' . $this->language->label . '/user');
			}
			return $this->design->fetch('password_remind.tpl');
		}
		// Login
		elseif ($this->request->method('post') && $this->request->post('login')) {
			$email			= $this->request->post('email');
			$password		= $this->request->post('password');

			$this->design->assign('email', $email);

			if ($user_id = $this->users->check_password($email, $password)) {
				$user = $this->users->get_user($email);
				if ($user->enabled) {
					$_SESSION['user_id'] = $user_id;
					$this->users->update_user($user_id, array('last_ip' => $_SERVER['REMOTE_ADDR']));

					// Redirect the user to the previous page if it is known
					if (!empty($_SESSION['last_visited_page']))
						header('Location: ' . $_SESSION['last_visited_page']);
					else
						header('Location: ' . $this->config->root_url . '/' . $this->language->label);
				} else {
					$this->design->assign('error', 'user_disabled');
				}
			} else {
				$this->design->assign('error', 'login_incorrect');
			}
		}
		return $this->design->fetch('login.tpl');
	}
}
