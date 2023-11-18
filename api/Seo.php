<?php

require_once 'Turbo.php';

class seo extends Turbo
{
	private $vars;
	private $varsLang;

	public function __construct()
	{
		parent::__construct();
		$this->initSeo();
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

		$this->db->query('SELECT count(*) AS count FROM __seo WHERE name=?', $name);

		if ($this->db->result('count') > 0) {
			$this->db->query('UPDATE __seo SET value=? WHERE name=?', $value, $name);
		} else {
			$this->db->query('INSERT INTO __seo SET value=?, name=?', $value, $name);
		}
	}

	/**
	 * Initializes SEO Settings
	 */
	private function initSeo()
	{
		$this->vars = [];
		$this->db->query('SELECT name, value FROM __seo');

		foreach ($this->db->results() as $result) {
			if (!($this->vars[$result->name] = @unserialize($result->value))) {
				$this->vars[$result->name] = $result->value;
			}
		}

		$this->varsLang = [];
		$multi = $this->getSeo();

		if (is_array($multi)) {
			foreach ($multi as $s) {
				if (!($this->varsLang[$s->name] = @unserialize($s->value))) {
					$this->varsLang[$s->name] = $s->value;
				}
			}
		}
	}

	/**
	 * Add Setting SEO
	 */
	private function add($name, $value)
	{
		$languages = $this->languages->getLanguages();

		if (!empty($languages)) {
			foreach ($languages as $language) {
				$this->db->query("REPLACE INTO __seo_lang SET lang_id=?, name=?, value=?", $language->id, $name, $value);
			}
		} else {
			$query = $this->db->placehold("REPLACE INTO __seo_lang SET name=?, value=?", $name, $value);
			if (!$this->db->query($query)) {
				return false;
			}
		}

		return true;
	}

	/**
	 * Update SEO
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
			$intoLang = $this->db->placehold("lang_id=?,", $langId);
		}

		$this->db->query("SELECT 1 FROM __seo_lang WHERE name=? LIMIT 1", $name);

		if (!$this->db->result()) {
			return $this->add($name, $value);
		} else {
			$query = $this->db->placehold("REPLACE INTO __seo_lang SET $intoLang name=?, value=?", $name, $value);

			return $this->db->query($query) ? true : false;
		}
	}

	/**
	 * Get SEO
	 */
	public function getSeo($langId = null)
	{
		if (!is_null($langId) && !($l = $this->languages->get_language((int) $langId))) {
			return false;
		}

		$langId  = !is_null($langId) ? $langId : $this->languages->langId();
		$langIdFilter = '';

		if ($langId) {
			$langIdFilter = $this->db->placehold("AND lang_id=?", $langId);
		}

		$this->db->query("SELECT * FROM __seo_lang WHERE 1 $langIdFilter");

		return $this->db->results();
	}
}
