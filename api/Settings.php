<?php

require_once 'Turbo.php';

class Settings extends Turbo
{
	private $vars;
	private $varsLang;

	public function __construct()
	{
		parent::__construct();
		$this->initSettings();
	}

	/**
	 * Magic Method Get
	 */
	public function __get($name)
	{
		if ($res = parent::__get($name)) {
			return $res;
		}

		if (isset($this->varsLang[$name])) {
			return $this->varsLang[$name];
		} elseif (isset($this->vars[$name])) {
			return $this->vars[$name];
		} else {
			return null;
		}
	}

	/**
	 * Magic Method Set
	 */
	public function __set($name, $value)
	{
		if (isset($this->varsLang[$name])) {
			return;
		}

		$this->vars[$name] = $value;

		if (is_array($value)) {
			$value = serialize($value);
		} else {
			$value = (string) $value;
		}

		$this->db->query("SELECT COUNT(*) AS count FROM __settings WHERE name=?", $name);

		if ($this->db->result('count') > 0) {
			$this->db->query("UPDATE __settings SET value=? WHERE name=?", $value, $name);
		} else {
			$this->db->query("INSERT INTO __settings SET value=?, name=?", $value, $name);
		}
	}

	/**
	 * Initializes Settings
	 */
	public function initSettings()
	{
		$this->vars = [];
		$this->db->query("SELECT name, value FROM __settings");

		foreach ($this->db->results() as $result) {
			if (!($this->vars[$result->name] = @unserialize($result->value))) {
				$this->vars[$result->name] = $result->value;
			}
		}

		$this->varsLang = [];
		$multi = $this->getSettings();

		if (is_array($multi)) {
			foreach ($multi as $s) {
				if (!($this->varsLang[$s->name] = @unserialize($s->value))) {
					$this->varsLang[$s->name] = $s->value;
				}
			}
		}
	}

	/**
	 * Add Setting
	 */
	private function add($name, $value)
	{
		$languages = $this->languages->getLanguages();

		if (!empty($languages)) {
			foreach ($languages as $language) {
				$this->db->query("REPLACE INTO __settings_lang SET lang_id=?, name=?, value=?", $language->id, $name, $value);
			}
		} else {
			$query = $this->db->placehold("REPLACE INTO __settings_lang SET name=?, value=?", $name, $value);
			return $this->db->query($query);
		}

		return true;
	}

	/**
	 * Update Setting
	 */
	public function update($name, $value)
	{
		if (empty($name)) {
			return false;
		}

		$this->varsLang[$name] = $value;
		$value = is_array($value) ? serialize($value) : (string) $value;

		$langId = $this->languages->langId();
		$intoLang = '';

		if ($langId) {
			$intoLang = $this->db->placehold('lang_id=?, ', $langId);
		}

		$this->db->query("SELECT 1 FROM __settings_lang WHERE name=? LIMIT 1", $name);

		if (!$this->db->result()) {
			return $this->add($name, $value);
		} else {
			$q = $this->db->placehold("REPLACE INTO __settings_lang SET $intoLang name=?, value=?", $name, $value);
			return (bool) $this->db->query($q);
		}
	}

	/**
	 * Get Settings
	 */
	public function getSettings($langId = null)
	{
		if (!is_null($langId) && !($l = $this->languages->getLanguage((int) $langId))) {
			return false;
		}

		$langId = !is_null($langId) ? $langId : $this->languages->langId();

		if ($langId == 0) {
			return false;
		}

		$langIdFilter = '';

		if ($langId) {
			$langIdFilter = $this->db->placehold('AND lang_id=?', $langId);
		}

		$this->db->query("SELECT * FROM __settings_lang WHERE 1 $langIdFilter");

		return $this->db->results();
	}
}
