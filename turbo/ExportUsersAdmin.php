<?php

require_once('api/Turbo.php');

class ExportUsersAdmin extends Turbo
{
	private $exportFilesDir = 'turbo/files/export_users/';

	public function fetchData()
	{
		$this->design->assign('export_files_dir', $this->exportFilesDir);
		$this->design->assign('sort', $this->request->get('sort'));
		$this->design->assign('keyword', $this->request->get('keyword'));
		$this->design->assign('group_id', $this->request->get('group_id'));
		$this->design->assign('export_files_dir', $this->exportFilesDir);

		if (!is_writable($this->exportFilesDir)) {
			$this->design->assign('message_error', 'no_permission');
		}

		return $this->design->fetch('export_users.tpl');
	}
}
