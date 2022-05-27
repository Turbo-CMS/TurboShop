<?php

/**
 * Wrapper class for a configuration file with store settings
 * Unlike the Settings class, Config operates on low-level settings, such as database settings.
 *
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Config
{
	public $version = '3.4.3';

	// File for storing settings
	public $config_file = 'config/config.php';

	private $vars = array();

	// In the constructor, write the file settings to the variables of this class
	// for easy access to them. For example: $turbo->config->db_user
	public function __construct()
	{
		// Read settings from default file
		$ini = parse_ini_file(dirname(dirname(__FILE__)) . '/' . $this->config_file);
		// Write the setting as a class variable
		foreach ($ini as $var => $value)
			$this->vars[$var] = $value;

		// Calculate DOCUMENT_ROOT manually, because sometimes it contains something unnecessary
		$localpath = getenv("SCRIPT_NAME");
		$absolutepath = getenv("SCRIPT_FILENAME");
		$_SERVER['DOCUMENT_ROOT'] = substr($absolutepath, 0, strpos($absolutepath, $localpath));

		// Site address is also one of the settings, but we calculate it automatically, and do not take it from a file
		$script_dir1 = realpath(dirname(dirname(__FILE__)));
		$script_dir2 = realpath($_SERVER['DOCUMENT_ROOT']);
		$subdir = trim(substr($script_dir1, strlen($script_dir2)), "/\\");

		// Protocol
		$protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"], 0, 5)) == 'https' ? 'https' : 'http';
		if ($_SERVER["SERVER_PORT"] == 443)
			$protocol = 'https';
		elseif (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1')))
			$protocol = 'https';
		elseif (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https' || !empty($_SERVER['HTTP_X_FORWARDED_SSL']) && $_SERVER['HTTP_X_FORWARDED_SSL'] == 'on')
			$protocol = 'https';

		$this->vars['protocol'] = $protocol;
		$this->vars['root_url'] = $protocol . '://' . rtrim($_SERVER['HTTP_HOST']);
		if (!empty($subdir))
			$this->vars['root_url'] .= '/' . $subdir;

		// Subfolder where Turbo CMS is installed relative to the web server root
		$this->vars['subfolder'] = $subdir . '/';

		// Define the root directory of the site
		$this->vars['root_dir'] =  dirname(dirname(__FILE__)) . '/';

		// Maximum size of uploaded files
		$max_upload = (int)(ini_get('upload_max_filesize'));
		$max_post = (int)(ini_get('post_max_size'));
		$memory_limit = (int)(ini_get('memory_limit'));
		$this->vars['max_upload_filesize'] = min($max_upload, $max_post, $memory_limit) * 1024 * 1024;

		// Salt (different for each copy of the site, changing when changing the config file)
		$s = stat(dirname(dirname(__FILE__)) . '/' . $this->config_file);
		$this->vars['salt'] = md5(md5_file(dirname(dirname(__FILE__)) . '/' . $this->config_file) . $s['dev'] . $s['ino'] . $s['uid'] . $s['mtime']);

		// Timezone
		if (!empty($this->vars['php_timezone']))
			date_default_timezone_set($this->vars['php_timezone']);
		elseif (!ini_get('date.timezone'))
			date_default_timezone_set('UTC');
	}

	// Magic methods return the desired variable
	public function __get($name)
	{
		if (isset($this->vars[$name]))
			return $this->vars[$name];
		else
			return null;
	}

	// Magic methods set the desired variable
	public function __set($name, $value)
	{
		// Write configs
		if (isset($this->vars[$name])) {
			$conf = file_get_contents(dirname(dirname(__FILE__)) . '/' . $this->config_file);
			$conf = preg_replace("/" . $name . "\s*=.*\n/i", $name . ' = ' . $value . "\r\n", $conf);
			$cf = fopen(dirname(dirname(__FILE__)) . '/' . $this->config_file, 'w');
			fwrite($cf, $conf);
			fclose($cf);
			$this->vars[$name] = $value;
		}
	}

	public function token($text)
	{
		return md5($text . $this->salt);
	}

	public function check_token($text, $token)
	{
		if (!empty($token) && $token === $this->token($text))
			return true;
		return false;
	}
}
