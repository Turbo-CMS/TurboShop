<?php

require_once 'Turbo.php';

class Config
{
	public $version = '5.3.5';
	public $configFile = 'config/config.php';

	private $vars = [];

	public function __construct()
	{
		$ini = parse_ini_file(dirname(dirname(__FILE__)) . '/' . $this->configFile);

		foreach ($ini as $var => $value) {
			$this->vars[$var] = $value;
		}

		$localpath = getenv("SCRIPT_NAME");
		$absolutepath = getenv("SCRIPT_FILENAME");
		$_SERVER['DOCUMENT_ROOT'] = substr($absolutepath, 0, strpos($absolutepath, $localpath));

		$scriptDir1 = realpath(dirname(dirname(__FILE__)));
		$scriptDir2 = realpath($_SERVER['DOCUMENT_ROOT']);
		$subdir = trim(substr($scriptDir1, strlen($scriptDir2)), "/\\");

		if (!isset($_SERVER['HTTP_HOST'])) {
			$_SERVER['HTTP_HOST'] = getenv('HTTP_HOST');
		}

		$this->vars['host'] = rtrim($_SERVER['HTTP_HOST']);

		$protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"], 0, 5)) == 'https' ? 'https' : 'http';

		if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
			$protocol = 'https';
		} elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on') {
			$protocol = 'https';
		} elseif (isset($_SERVER['SERVER_PORT']) && '443' == $_SERVER['SERVER_PORT']) {
			$protocol = 'https';
		}

		if (isset($_SERVER['HTTP_CF_VISITOR']) && strpos($_SERVER['HTTP_CF_VISITOR'], 'https') !== false) {
			$protocol = 'https';
		}

		$this->vars['protocol'] = $protocol;
		$this->vars['root_url'] = $protocol . '://' . $this->vars['host'];

		if (!empty($subdir)) {
			$this->vars['root_url'] .= '/' . $subdir;
		}

		$this->vars['subfolder'] = $subdir . '/';
		$this->vars['root_dir'] =  dirname(dirname(__FILE__)) . '/';

		$maxUpload = (int) (ini_get('upload_max_filesize'));
		$maxPost = (int) (ini_get('post_max_size'));
		$memoryLimit = (int) (ini_get('memory_limit'));

		$this->vars['max_upload_filesize'] = min($maxUpload, $maxPost, $memoryLimit) * 1024 * 1024;

		if (empty($this->vars['salt'])) {
			$s = stat(dirname(dirname(__FILE__)) . '/' . $this->configFile);
			$this->vars['salt'] = md5(md5_file(dirname(dirname(__FILE__)) . '/' . $this->configFile) . $s['dev'] . $s['ino'] . $s['uid'] . $s['mtime']);
		}

		if (!empty($this->vars['php_timezone'])) {
			date_default_timezone_set($this->vars['php_timezone']);
		} elseif (!ini_get('date.timezone')) {
			date_default_timezone_set('UTC');
		}
	}

	/**
	 * Magic Methods Get
	 */
	public function __get($name)
	{
		if (isset($this->vars[$name])) {
			return $this->vars[$name];
		} else {
			return null;
		}
	}

	/**
	 * Magic Methods Set
	 */
	public function __set($name, $value)
	{
		if (isset($this->vars[$name])) {
			$conf = file_get_contents(dirname(dirname(__FILE__)) . '/' . $this->configFile);
			$conf = preg_replace("/" . $name . "\s*=.*\n/i", $name . ' = ' . $value . "\r\n", $conf);
			$cf = fopen(dirname(dirname(__FILE__)) . '/' . $this->configFile, 'w');
			fwrite($cf, $conf);
			fclose($cf);
			$this->vars[$name] = $value;
		}
	}

	/**
	 * Generates Token
	 */
	public function token($text)
	{
		return md5($text . $this->salt);
	}

	/**
	 * Check Token 
	 */
	public function checkToken($text, $token)
	{
		if (!empty($token) && $token === $this->token($text)) {
			return true;
		}
		return false;
	}
}
