<?php

require_once 'Turbo.php';

class Request extends Turbo
{

	public function __construct()
	{
		parent::__construct();

		$_POST = $this->stripslashesRecursive($_POST);
		$_GET = $this->stripslashesRecursive($_GET);
	}

	/**
	 * Is Method
	 */
	public function isMethod($method = null)
	{
		if ($method !== null) {
			return strtolower($_SERVER['REQUEST_METHOD']) == strtolower($method);
		}

		return $_SERVER['REQUEST_METHOD'];
	}

	/**
	 * Get
	 */
	public function get($name, $type = null)
	{
		$val = null;

		if (isset($_GET[$name])) {
			$val = $_GET[$name];
		}

		if (!empty($type) && is_array($val)) {
			$val = reset($val);
		}

		if ($type == 'string') {
			return preg_replace('/[^\p{L}\p{Nd}\d\s_\-\.\%\s]/ui', '', strval($val));
		}

		if ($type == 'integer') {
			return (int) $val;
		}

		if ($type == 'boolean') {
			return !empty($val);
		}

		return $val;
	}

	/**
	 * Post
	 */
	public function post($name = null, $type = null)
	{
		$val = null;

		if (!empty($name) && isset($_POST[$name])) {
			$val = $_POST[$name];
		} elseif (empty($name)) {
			$val = file_get_contents('php://input');
		}

		if ($type == 'string') {
			return strval(preg_replace('/[^\p{L}\p{Nd}\d\s_\-\.\%\s]/ui', '', $val));
		}

		if ($type == 'integer') {
			return (int) $val;
		}

		if ($type == 'boolean') {
			return !empty($val);
		}

		return $val;
	}

	/**
	 * Files
	 */
	public function files($name, $name2 = null)
	{
		if (!empty($name2) && !empty($_FILES[$name][$name2])) {
			return $_FILES[$name][$name2];
		} elseif (empty($name2) && !empty($_FILES[$name])) {
			return $_FILES[$name];
		} else {
			return null;
		}
	}

	/**
	 * Stripslashes Recursive
	 */
	private function stripslashesRecursive($var)
	{
		if (is_array($var)) {
			$res = [];

			foreach ($var as $k => $v) {
				$res[$this->stripslashesRecursive($k)] = $this->stripslashesRecursive($v);
			}

			return $res;
		} else {
			return stripslashes($var);
		}
	}

	/**
	 * Check Session
	 */
	public function checkSession()
	{
		if (!empty($_POST)) {
			if (empty($_POST['session_id']) || $_POST['session_id'] != session_id()) {
				unset($_POST);
				return false;
			}
		}

		return true;
	}

	/**
	 * URL
	 */
	public function url($params = [])
	{
		$url = parse_url($_SERVER["REQUEST_URI"]);
		$query = [];

		if (isset($url['query']) && !empty($url['query'])) {
			parse_str($url['query'], $query);
		}

		if (!is_null($query)) {
			foreach ($query as &$v) {
				if (!is_array($v)) {
					$v = stripslashes(urldecode($v));
				}
			}
		}

		foreach ($params as $name => $value) {
			$query[$name] = $value;
		}

		$queryIsEmpty = true;
		foreach ($query as $name => $value) {
			if ($value !== '' && $value !== null) {
				$queryIsEmpty = false;
			}
		}

		if (!$queryIsEmpty) {
			$url['query'] = http_build_query($query);
		} else {
			$url['query'] = null;
		}

		$result = http_build_url(null, $url);

		return $result;
	}
}

/**
 * Build URL
 */
if (!function_exists('http_build_url')) {
	define('HTTP_URL_REPLACE', 1);
	define('HTTP_URL_JOIN_PATH', 2);
	define('HTTP_URL_JOIN_QUERY', 4);
	define('HTTP_URL_STRIP_USER', 8);
	define('HTTP_URL_STRIP_PASS', 16);
	define('HTTP_URL_STRIP_AUTH', 32);
	define('HTTP_URL_STRIP_PORT', 64);
	define('HTTP_URL_STRIP_PATH', 128);
	define('HTTP_URL_STRIP_QUERY', 256);
	define('HTTP_URL_STRIP_FRAGMENT', 512);
	define('HTTP_URL_STRIP_ALL', 1024);

	function http_build_url($url, $parts = [], $flags = HTTP_URL_REPLACE, &$newUrl = false)
	{
		$keys = ['user', 'pass', 'port', 'path', 'query', 'fragment'];

		if ($flags & HTTP_URL_STRIP_ALL) {
			$flags |= HTTP_URL_STRIP_USER;
			$flags |= HTTP_URL_STRIP_PASS;
			$flags |= HTTP_URL_STRIP_PORT;
			$flags |= HTTP_URL_STRIP_PATH;
			$flags |= HTTP_URL_STRIP_QUERY;
			$flags |= HTTP_URL_STRIP_FRAGMENT;
		} else if ($flags & HTTP_URL_STRIP_AUTH) {
			$flags |= HTTP_URL_STRIP_USER;
			$flags |= HTTP_URL_STRIP_PASS;
		}

		if (isset($url)) {
			$parseUrl = parse_url($url);
		}

		if (isset($parts['scheme'])) {
			$parseUrl['scheme'] = $parts['scheme'];
		}

		if (isset($parts['host'])) {
			$parseUrl['host'] = $parts['host'];
		}

		if ($flags & HTTP_URL_REPLACE) {
			foreach ($keys as $key) {
				if (isset($parts[$key]))
					$parseUrl[$key] = $parts[$key];
			}
		} else {
			if (isset($parts['path']) && ($flags & HTTP_URL_JOIN_PATH)) {
				if (isset($parseUrl['path']))
					$parseUrl['path'] = rtrim(str_replace(basename($parseUrl['path']), '', $parseUrl['path']), '/') . '/' . ltrim($parts['path'], '/');
				else
					$parseUrl['path'] = $parts['path'];
			}

			if (isset($parts['query']) && ($flags & HTTP_URL_JOIN_QUERY)) {
				if (isset($parseUrl['query']))
					$parseUrl['query'] .= '&' . $parts['query'];
				else
					$parseUrl['query'] = $parts['query'];
			}
		}

		foreach ($keys as $key) {
			if ($flags & (int)constant('HTTP_URL_STRIP_' . strtoupper($key)))
				unset($parseUrl[$key]);
		}

		$newUrl = $parseUrl;

		return ((isset($parseUrl['scheme'])) ? $parseUrl['scheme'] . '://' : '')
			. ((isset($parseUrl['user'])) ? $parseUrl['user'] . ((isset($parseUrl['pass'])) ? ':' . $parseUrl['pass'] : '') . '@' : '')
			. ((isset($parseUrl['host'])) ? $parseUrl['host'] : '')
			. ((isset($parseUrl['port'])) ? ':' . $parseUrl['port'] : '')
			. ((isset($parseUrl['path'])) ? $parseUrl['path'] : '')
			. ((isset($parseUrl['query'])) ? '?' . $parseUrl['query'] : '')
			. ((isset($parseUrl['fragment'])) ? '#' . $parseUrl['fragment'] : '');
	}
}

if (!function_exists('http_build_query')) {
	function http_build_query($data, $prefix = null, $sep = '', $key = '')
	{
		$ret = [];

		foreach ((array)$data as $k => $v) {
			$k = urlencode($k);

			if (is_int($k) && $prefix != null) {
				$k = $prefix . $k;
			};

			if (!empty($key)) {
				$k = $key . "[" . $k . "]";
			};

			if (is_array($v) || is_object($v)) {
				array_push($ret, http_build_query($v, "", $sep, $k));
			} else {
				array_push($ret, $k . "=" . urlencode($v));
			};
		};

		if (empty($sep)) {
			$sep = ini_get("arg_separator.output");
		};

		return implode($sep, $ret);
	};
}
