<?php

require_once 'Turbo.php';

class Managers extends Turbo
{
	public $permissionsList = [
		'dashboard', 'products', 'categories', 'brands', 'features', 'orders', 'labels', 'callbacks', 'feeds',
		'users', 'groups', 'coupons', 'pages', 'menus', 'blog', 'comments', 'feedbacks', 'import', 'export', 'clear', 'articles',
		'backup', 'stats', 'subscribes', 'faq', 'design', 'banners', 'settings', 'seo', 'scripts', 'currency', 'delivery', 'payment', 'managers', 'languages'
	];

	public $passwdFile = "turbo/.passwd";

	public function __construct()
	{
		if (isset($_SERVER['REDIRECT_REMOTE_USER']) && empty($_SERVER['PHP_AUTH_USER'])) {
			$_SERVER['PHP_AUTH_USER'] = $_SERVER['REDIRECT_REMOTE_USER'];
		} elseif (empty($_SERVER['PHP_AUTH_USER']) && !empty($_SERVER["REMOTE_USER"])) {
			$_SERVER['PHP_AUTH_USER'] = $_SERVER["REMOTE_USER"];
		}
	}

	/**
	 * Get Managers
	 */
	public function getManagers()
	{
		$lines = explode("\n", @file_get_contents(dirname(dirname(__FILE__)) . '/' . $this->passwdFile));

		$managers = [];

		foreach ($lines as $line) {
			if (!empty($line)) {
				$manager = null;
				$fields = explode(":", $line);
				$manager = new stdClass();
				$manager->login = trim($fields[0]);
				$manager->permissions = [];

				if (isset($fields[2])) {
					$manager->permissions = explode(",", $fields[2]);

					foreach ($manager->permissions as &$permission) {
						$permission = trim($permission);
					}
				} else {
					$manager->permissions = $this->permissionsList;
				}

				$managers[] = $manager;
			}
		}

		return $managers;
	}

	/**
	 * Count Managers
	 */
	public function countManagers($filter = [])
	{
		return count($this->getManagers());
	}

	/**
	 * Get Manager
	 */
	public function getManager($login = null)
	{
		if (empty($login)) {
			if (!empty($_SERVER['PHP_AUTH_USER'])) {
				$login = $_SERVER['PHP_AUTH_USER'];
			} else {
				$m = new stdClass();
				$m->login = 'manager';
				$m->permissions = $this->permissionsList;

				return $m;
			}
		}

		foreach ($this->getManagers() as $manager) {
			if ($manager->login == $login) {
				return $manager;
			}
		}

		return false;
	}

	/**
	 * Add Manager
	 */
	public function addManager($manager)
	{
		$manager = (object) $manager;

		if (!empty($manager->login)) {
			$m[0] = $manager->login;
		}

		if (!empty($manager->password)) {
			$m[1] = $this->cryptApr1Md5($manager->password);
		} else {
			$m[1] = "";
		}

		if (isset($manager->permissions) && is_array($manager->permissions)) {
			if (count(array_diff($this->permissionsList, $manager->permissions)) > 0) {
				$m[2] = implode(",", $manager->permissions);
			} else {
				unset($m[2]);
			}
		}

		$line = implode(":", $m);

		file_put_contents($this->passwdFile, @file_get_contents($this->passwdFile) . "\n" . $line);

		if ($m = $this->getManager($manager->login)) {
			return $m->login;
		} else {
			return false;
		}
	}

	/**
	 * Add Manager
	 */
	public function updateManager($login, $manager)
	{
		$manager = (object) $manager;

		if (!empty($manager->login)) {
			$manager->login = str_replace(":", "", $manager->login);
		}

		$lines = explode("\n", @file_get_contents($this->passwdFile));

		$updatedFlag = false;

		foreach ($lines as &$line) {
			$m = explode(":", $line);
			if ($m[0] == $login) {
				if (!empty($manager->login)) {
					$m[0] = $manager->login;
				}

				if (!empty($manager->password)) {
					$m[1] = $this->cryptApr1Md5($manager->password);
				}

				if (isset($manager->permissions) && is_array($manager->permissions)) {
					if (count(array_diff($this->permissionsList, $manager->permissions)) > 0) {
						$m[2] = implode(",", array_intersect($this->permissionsList, $manager->permissions));
					} else {
						unset($m[2]);
					}
				}

				$line = implode(":", $m);

				$updatedFlag = true;
			}
		}

		if ($updatedFlag) {
			file_put_contents($this->passwdFile, implode("\n", $lines));

			$manager->login = '';

			if ($m = $this->getManager($manager->login)) {
				return $m->login;
			}
		}

		return false;
	}

	/**
	 * Delete Manager
	 */
	public function deleteManager($login)
	{
		$lines = explode("\n", @file_get_contents($this->passwdFile));

		foreach ($lines as $i => $line) {
			$m = explode(":", $line);

			if ($m[0] == $login) {
				unset($lines[$i]);
			}
		}

		file_put_contents($this->passwdFile, implode("\n", $lines));

		return true;
	}

	/**
	 * Crypt APR1-MD5
	 */
	private function cryptApr1Md5($plainpasswd)
	{
		$salt = substr(str_shuffle("abcdefghijklmnopqrstuvwxyz0123456789"), 0, 8);
		$len = strlen($plainpasswd);
		$text = $plainpasswd . '$apr1$' . $salt;
		$bin = pack("H32", md5($plainpasswd . $salt . $plainpasswd));

		for ($i = $len; $i > 0; $i -= 16) {
			$text .= substr($bin, 0, min(16, $i));
		}

		for ($i = $len; $i > 0; $i >>= 1) {
			$text .= ($i & 1) ? chr(0) : $plainpasswd[0];
		}

		$bin = pack("H32", md5($text));

		for ($i = 0; $i < 1000; $i++) {
			$new = ($i & 1) ? $plainpasswd : $bin;
			if ($i % 3) $new .= $salt;
			if ($i % 7) $new .= $plainpasswd;
			$new .= ($i & 1) ? $bin : $plainpasswd;
			$bin = pack("H32", md5($new));
		}

		$tmp = '';

		for ($i = 0; $i < 5; $i++) {
			$k = $i + 6;
			$j = $i + 12;
			if ($j == 16) $j = 5;
			$tmp = $bin[$i] . $bin[$k] . $bin[$j] . $tmp;
		}

		$tmp = chr(0) . chr(0) . $bin[11] . $tmp;

		$tmp = strtr(
			strrev(substr(base64_encode($tmp), 2)),
			"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
			"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
		);

		return "$" . "apr1" . "$" . $salt . "$" . $tmp;
	}

	/**
	 * Access
	 */
	public function access($module)
	{
		$manager = $this->getManager();

		if (is_array($manager->permissions)) {
			return in_array($module, $manager->permissions);
		} else {
			return false;
		}
	}
}
