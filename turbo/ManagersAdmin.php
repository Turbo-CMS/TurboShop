<?php

require_once 'api/Turbo.php';

class ManagersAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->method('post')) {
			$logins = $this->request->post('check');

			if (is_array($logins)) {
				switch ($this->request->post('action')) {
					case 'delete':
						foreach ($logins as $login) {
							$this->managers->deleteManager($login);
						}
						break;
				}
			}
		}

		if (!is_writable($this->managers->passwdFile)) {
			$this->design->assign('message_error', 'not_writable');
		}

		$managers = $this->managers->getManagers();
		$managersCount = $this->managers->countManagers();

		$this->design->assign('managers', $managers);
		$this->design->assign('managers_count', $managersCount);

		return $body = $this->design->fetch('managers.tpl');

		return $body;
	}
}
