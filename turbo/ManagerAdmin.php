<?php

require_once 'api/Turbo.php';

class ManagerAdmin extends Turbo
{
	public function fetch()
	{
		$manager = new stdClass();

		if ($this->request->method('post')) {
			$manager->oldLogin = $this->request->post('old_login');
			$manager->login = $this->request->post('login');

			if (!is_writable($this->managers->passwdFile)) {
				$this->design->assign('message_error', 'not_writable');
			} elseif (empty($manager->login)) {
				$this->design->assign('message_error', 'empty_login');
			} elseif ($this->managers->getManager($manager->login) && $manager->login != $manager->oldLogin) {
				$manager->login = $manager->oldLogin;
				$manager->permissions = (array) $this->request->post('permissions');
				$this->design->assign('message_error', 'login_exists');
			} else {
				if ($this->request->post('password') != "") {
					$manager->password = $this->request->post('password');
				}

				$currentManager = $this->managers->getManager();

				if ($manager->oldLogin != $currentManager->login) {
					$manager->permissions = (array) $this->request->post('permissions');
				}

				if (empty($manager->oldLogin)) {
					$manager->login = $this->managers->addManager($manager);
					$this->design->assign('message_success', 'added');
				} else {
					$manager->login = $this->managers->updateManager($manager->oldLogin, $manager);
					$this->design->assign('message_success', 'updated');
				}

				$manager = $this->managers->getManager($manager->login);
			}
		} else {
			$login = $this->request->get('login');

			if (!empty($login)) {
				$manager = $this->managers->getManager($login);
			} else {
				$manager->login = null;
				$manager->permissions = null;
			}
		}

		if (!empty($manager)) {
			$this->design->assign('m', $manager);
		}

		return $this->design->fetch('manager.tpl');
	}
}
