<?php

require_once 'api/Turbo.php';

class SystemAdmin extends Turbo
{
	public function fetch()
	{
		$phpVersion = phpversion();
		$allExtensions = get_loaded_extensions();

		$iniParams = [];

		$requestIni = [
			'display_errors',
			'memory_limit',
			'post_max_size',
			'max_input_time',
			'max_file_uploads',
			'max_execution_time',
			'upload_max_filesize',
			'max_input_vars'
		];

		foreach ($requestIni as $ini) {
			$iniParams[$ini] = ini_get($ini);
		}

		$sqlInfo = $this->db->getMysqlInfo();
		$serverIp = file_get_contents('http://ipinfo.io/ip');

		$this->design->assign('sql_info', $sqlInfo);
		$this->design->assign('php_version', $phpVersion);
		$this->design->assign('all_extensions', $allExtensions);
		$this->design->assign('ini_params', $iniParams);
		$this->design->assign('server_ip', $serverIp);

		return $this->design->fetch('settings_system.tpl');
	}
}
