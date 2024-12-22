<?php

define('PCLZIP_TEMPORARY_DIR', 'turbo/files/backup/');

require_once 'api/Turbo.php';

class BackupAdmin extends Turbo
{
	public function fetch(): string
	{
		$dir = 'turbo/files/backup/';

		if ($this->request->method('post')) {
			switch ($this->request->post('action')) {
				case 'create': {
						$filename = $dir . 'turbo_' . date("Y_m_d_G_i_s") . '.zip';
						$this->db->dump($dir . 'turbo.sql');
						chmod($dir . 'turbo.sql', 0777);
						$zip = new PclZip($filename);

						$v_list = $zip->create([
							'files',
							$dir . 'turbo.sql'
						], PCLZIP_OPT_REMOVE_PATH, $dir, PCLZIP_CB_PRE_ADD, "myCallBack");

						if ($v_list === 0) {
							trigger_error('Can\'t archive ' . $zip->errorInfo(true));
						}

						$this->design->assign('message_success', 'created');

						break;
					}
				case 'restore': {
						$name = $this->request->post('name');
						$archive = $dir . $name;
						$zip = new PclZip($archive);
						$this->cleanDirectory('files');

						if (!$zip->extract(PCLZIP_OPT_PATH, '', PCLZIP_OPT_BY_PREG, "/^files\//", PCLZIP_CB_POST_EXTRACT, 'myPostExtractCallBack')) {
							trigger_error('Can\'t unzip ' . $zip->errorInfo(true));
						} elseif (!$zip->extract(PCLZIP_OPT_PATH, $dir, PCLZIP_OPT_BY_NAME, 'turbo.sql')) {
							trigger_error('Can\'t unzip ' . $zip->errorInfo(true));
						} elseif (!is_readable($dir . 'turbo.sql')) {
							trigger_error('Can\'t read the file /temp/turbo.sql');
						} else {
							$this->db->restore($dir . 'turbo.sql');
							@unlink($dir . 'turbo.sql');
							$this->design->assign('message_success', 'restored');
						}

						break;
					}
				case 'delete': {
						$names = $this->request->post('check');

						foreach ($names as $name) {
							@unlink($dir . $name);
						}

						break;
					}
			}
		}

		$backupFiles = glob($dir . "*.zip");
		$backups = [];

		if (is_array($backupFiles)) {
			foreach ($backupFiles as $backupFile) {
				$backup = new stdClass();
				$backup->name = basename($backupFile);
				$backup->size = filesize($backupFile);
				$backups[] = $backup;
			}
		}

		$backups = array_reverse($backups);

		$this->design->assign('backup_files_dir', $dir);

		if (!is_writable($dir)) {
			$this->design->assign('message_error', 'no_permission');
		}

		$this->design->assign('backups', $backups);

		return $this->design->fetch('backup.tpl');
	}

	private function cleanDirectory($path)
	{
		$path = rtrim($path, '/') . '/';
		$handle = opendir($path);

		while (($file = readdir($handle)) !== false) {
			if ($file != "." and $file != "..") {
				$fullpath = $path . $file;

				if (is_dir($fullpath)) {
					$this->cleanDirectory($fullpath);
					rmdir($fullpath);
				} else {
					@unlink($fullpath);
				}
			}
		}

		closedir($handle);
	}
}

function myPostExtractCallBack($event, &$header)
{
	if ($header['status'] == 'ok') {
		chmod($header['filename'], 0777);
	}
	return 1;
}

function myCallBack($event, &$header)
{
	$fname = $header['stored_filename'];

	if (
		preg_match('/^files\/products\/.+/i', $fname) ||
		preg_match('/^files\/articles\/preview\/.+/i', $fname) ||
		preg_match('/^files\/brands\/preview\/.+/i', $fname) ||
		preg_match('/^files\/categories\/preview\/.+/i', $fname) ||
		preg_match('/^files\/posts\/preview\/.+/i', $fname) ||
		preg_match('/^files\/slides\/preview\/.+/i', $fname)
	) {
		return 0;
	} else {
		return 1;
	}
}
