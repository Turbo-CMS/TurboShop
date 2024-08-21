<?php

require_once 'Turbo.php';

class Languages extends Turbo
{
	private $tables = [
		'faq' => 'faq',
		'blog' => 'blog',
		'page' => 'pages',
		'file' => 'files',
		'brand' => 'brands',
		'option' => 'options',
		'article' => 'articles',
		'product' => 'products',
		'variant' => 'variants',
		'feature' => 'features',
		'delivery' => 'delivery',
		'currency' => 'currencies',
		'category' => 'categories',
		'payment' => 'payment_methods',
		'banner_image' => 'banners_images',
		'article_category' => 'articles_categories'
	];

	public $languages = [];
	public $langId;
	private $availableLanguages;

	public function __construct()
	{
		parent::__construct();
		$this->initLanguages();
	}

	public function langList()
	{
		if (!isset($this->availableLanguages)) {
			include_once("turbo/lang/languages_list.php");
			$this->availableLanguages = isset($langs) ? $langs : [];
		}

		return $this->availableLanguages;
	}

	public function getFields($object = '')
	{
		$fields['files'] = ['name'];
		$fields['features'] = ['name'];
		$fields['faq'] = ['name', 'answer'];
		$fields['variants'] = ['name', 'color'];
		$fields['currencies'] = ['name', 'sign'];
		$fields['options'] = ['value', 'feature_id'];
		$fields['delivery'] = ['name', 'description'];
		$fields['payment_methods'] = ['name', 'description'];
		$fields['banners_images'] = ['name', 'alt', 'title', 'description', 'button'];
		$fields['pages'] = ['name', 'meta_title', 'meta_keywords', 'meta_description', 'header', 'body'];
		$fields['blog'] = ['name', 'meta_title', 'meta_keywords', 'meta_description', 'annotation', 'text'];
		$fields['products'] = ['name', 'meta_title', 'meta_keywords', 'meta_description', 'annotation', 'body'];
		$fields['brands'] = ['name', 'name_h1', 'meta_title', 'meta_keywords', 'meta_description', 'description'];
		$fields['categories'] = ['name', 'name_h1', 'meta_title', 'meta_keywords', 'meta_description', 'description'];
		$fields['articles'] = ['name', 'author', 'meta_title', 'meta_keywords', 'meta_description', 'annotation', 'text'];
		$fields['articles_categories'] = ['name', 'name_h1', 'meta_title', 'meta_keywords', 'meta_description', 'description'];

		if ($object != '' && isset($fields[$object])) {
			return $fields[$object];
		}

		return $fields;
	}

	/**
	 * Get Query
	 */
	public function getQuery($params = [])
	{
		$lang   = (isset($params['lang']) && $params['lang'] ? $params['lang'] : $this->langId());
		$object = $params['object'];

		if (!empty($params['px'])) {
			$px = $params['px'];
		} else {
			$px = $object[0];
		}

		$this->db->query("SHOW TABLES LIKE '%__languages%'");
		$exist = $this->db->result();

		if (isset($lang)  && $exist && !empty($this->languages)) {
			$f = (isset($params['px_lang']) && $params['px_lang'] ? $params['px_lang'] : 'l');
			$langJoin = 'LEFT JOIN __lang_' . $this->tables[$object] . ' ' . $f . ' ON ' . $f . '.' . $object . '_id=' . $px . '.id AND ' . $f . '.lang_id = ' . (int) $lang;
		} else {
			$f = $px;
			$langJoin = '';
		}

		$langCol = $f . '.' . implode(', ' . $f . '.', $this->getFields($this->tables[$object]));

		$result = new stdClass;
		$result->join   = $langJoin;
		$result->fields = $langCol;

		return $result;
	}

	/**
	 * Lang ID
	 */
	function langId()
	{
		if (empty($this->languages)) {
			return false;
		}

		if (isset($this->langId)) {
			return $this->langId;
		}

		if ($this->request->get('lang_id', 'integer')) {
			unset($_SESSION['lang_id']);
			$this->langId = $_SESSION['lang_id'] = $this->request->get('lang_id', 'integer');
		}

		if ($this->request->get('lang_label', 'string') && !$this->request->get('lang_id', 'integer')) {
			$langId = null;

			foreach ($this->languages as $l) {
				if ($this->request->get('lang_label', 'string') == $l->label) {
					$langId = $l->id;
					break;
				}
			}

			$this->langId = $_SESSION['lang_id'] = $langId;
			return $this->langId;
		}

		if (empty($this->langId) && !empty($_SESSION['lang_id']) && !empty($this->languages[$_SESSION['lang_id']])) {
			$this->langId  = $_SESSION['lang_id'];
		}

		if (empty($this->langId)) {
			$firstLang = reset($this->languages);
			$this->langId = $firstLang->id;
		}

		return $this->langId;
	}

	/**
	 * Set Lang ID
	 */
	function setLangId($id)
	{
		$this->langId = $_SESSION['lang_id'] = $id;
	}

	/**
	 * Languages
	 */
	function languages($filter = [])
	{
		if (empty($this->languages)) {
			$this->initLanguages();
		}

		if (!empty($filter['id'])) {
			return $this->languages[$filter['id']];
		}

		if (!empty($filter['label'])) {
			foreach ($this->languages as $lang) {
				if ($lang->label == $filter['label']) {
					return $lang;
				}
			}
		}

		return $this->languages;
	}

	/**
	 * Initializes Languages
	 */
	function initLanguages()
	{
		if (!empty($this->languages)) {
			return $this->languages;
		}

		if ($langs = $this->getLanguages()) {
			foreach ($langs as $l) {
				$this->languages[$l->id] = $l;
			}
		} else {
			return false;
		}
	}

	/**
	 * Get Language
	 */
	public function getLanguage($id)
	{
		$query = $this->db->placehold("SELECT * FROM __languages WHERE id=? LIMIT 1", (int) $id);
		$this->db->query($query);

		return $this->db->result();
	}

	/**
	 * Get Languages
	 */
	public function getLanguages()
	{
		$this->db->query("SHOW TABLES LIKE '%__languages%'");

		if (!$this->db->result()) {
			return false;
		}

		$query = $this->db->placehold("SELECT * FROM __languages WHERE 1 ORDER BY position");

		if ($this->db->query($query)) {
			return $this->db->results();
		} else {
			return false;
		}
	}

	/**
	 * Update Language
	 */
	public function updateLanguage($id, $data)
	{
		$data = (object) $data;

		$language = $this->getLanguage($id);

		$query = $this->db->placehold("UPDATE __languages SET ?% WHERE id IN(?@)", $data, (array) $id);
		$this->db->query($query);

		if (isset($data->label) && ($data->label && !empty($language) && $language->label !== $data->label)) {
			foreach ($this->tables as $table) {
				$this->db->query("UPDATE __lang_" . $table . "SET lang_label=? WHERE lang_id=?", $data->label, $id);
			}
		}

		return $id;
	}

	/**
	 * Add Language
	 */
	public function addLanguage($data)
	{
		$data = (object) $data;

		$languages = $this->getLanguages();
		$lang = $this->settings->lang;
		$data->position = 1;

		if (!empty($languages)) {
			$firstLang = reset($this->languages);
			$data->position = $firstLang->position + 1;
		}

		$this->db->query("SHOW FIELDS FROM __translations WHERE field=?", 'lang_' . $data->label);

		if (!$this->db->result()) {
			$this->db->query("ALTER TABLE __translations ADD COLUMN lang_$data->label VARCHAR(255) NOT NULL DEFAULT ''");
			$this->db->query("UPDATE __translations SET lang_$data->label=lang_$lang");
		}

		$query = $this->db->placehold("INSERT INTO __languages SET ?%", $data);

		if (!$this->db->query($query)) {
			return false;
		}

		$lastId = $this->db->insertId();

		if ($lastId) {
			$descriptionFields = $this->getFields();

			foreach ($this->tables as $object => $tab) {
				$this->db->query(
					'INSERT INTO __lang_' . $tab . ' (' . implode(',', $descriptionFields[$tab]) . ', ' . $object . '_id, lang_id, lang_label)
					SELECT ' . implode(',', $descriptionFields[$tab]) . ', id, ?, ?
					FROM __' . $tab . '',
					$lastId,
					$data->label
				);
			}

			if (!empty($languages)) {
				$settings = $this->settings->getSettings($firstLang->id);

				if (!empty($settings)) {
					foreach ($settings as $s) {
						$this->db->query("REPLACE INTO __settings_lang SET lang_id=?, name=?, value=?", $lastId, $s->name, $s->value);
					}
				}

				$seo = $this->seo->getSeo($firstLang->id);

				if (!empty($seo)) {
					foreach ($seo as $s) {
						$this->db->query("REPLACE INTO __seo_lang SET lang_id=?, name=?, value=?", $lastId, $s->name, $s->value);
					}
				}
			} else {
				$this->db->query("UPDATE __settings_lang SET lang_id=?", $lastId);
				$this->db->query("UPDATE __seo_lang SET lang_id=?", $lastId);
			}

			$this->dumpTranslation();

			return $lastId;
		}
	}

	/**
	 * Delete Language
	 */
	public function deleteLanguage($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __languages WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);

			foreach ($this->tables as $table) {
				$this->db->query("DELETE FROM __lang_" . $table . " WHERE lang_id=?", (int) $id);
			}

			$this->db->query("DELETE FROM __settings_lang WHERE lang_id=?", (int)  $id);
			$this->db->query("DELETE FROM __seo_lang WHERE lang_id=?", (int)  $id);

			$this->dumpTranslation();
		}
	}

	/**
	 * Action Data
	 */
	public function actionData($objectId, $data, $object)
	{
		if (!in_array($object, array_keys($this->tables))) {
			return false;
		}

		$this->db->query("SELECT COUNT(*) AS count FROM __lang_" . $this->tables[$object] . " WHERE lang_id=? AND " . $object . "_id=? LIMIT 1", $data->lang_id, $objectId);

		$dataLang = $this->db->result('count');

		if ($dataLang == 0) {
			$object_fild = $object . '_id';
			$data->$object_fild = $objectId;

			$query = $this->db->placehold('INSERT INTO __lang_' . $this->tables[$object] . ' SET ?%', $data);
			$this->db->query($query);

			$result = 'add';
		} elseif ($dataLang == 1) {
			$this->db->query("UPDATE __lang_" . $this->tables[$object] . " SET ?% WHERE lang_id=? AND " . $object . "_id=?", $data, $data->lang_id, $objectId);
			$result = 'update';
		}

		return $result;
	}

	/**
	 * Get Description
	 */
	public function getDescription($data, $object)
	{
		if (!in_array($object, array_keys($this->tables))) {
			return false;
		}

		$languages = $this->languages();
		$languag = reset($languages);

		$fields = $this->getFields($this->tables[$object]);

		$intersect = array_intersect($fields, array_keys((array) $data));

		if (!empty($languages) && !empty($intersect)) {
			$description = new stdClass;

			foreach ($intersect as $f) {
				$description->$f = $data->$f;

				if ($languag->id != $this->langId) {
					unset($data->$f);
				}
			}

			$result = new stdClass();
			$result->description = $description;

			return $result;
		}

		return false;
	}

	/**
	 * Action Description
	 */
	public function actionDescription($objectId, $description, $object, $updateLang = null)
	{
		if (!in_array($object, array_keys($this->tables))) {
			return false;
		}

		$languages = $this->languages();

		if (empty($languages)) {
			return;
		}

		$fields = $this->getFields($this->tables[$object]);
		if (!empty($fields)) {
			if ($updateLang) {
				$updLanguages[] = $languages[$updateLang];
			} else {
				$updLanguages = $languages;
			}
			foreach ($updLanguages as $lang) {
				$description->lang_id = $lang->id;
				$this->actionData($objectId, $description, $object);
			}
			return;
		} else {
			return;
		}
	}

	/**
	 * Get Translation
	 */
	public function getTranslation($id)
	{
		$query = $this->db->placehold("SELECT * FROM __translations WHERE id=? LIMIT 1", (int) $id);
		$this->db->query($query);

		return $this->db->result();
	}

	/**
	 * Get Translations
	 */
	public function getTranslations($filter = [])
	{
		$page = 1;
		$limit = 0;
		$lang = '*';
		$order = 'label';
		$keywordFilter = '';

		$langId = $this->langId();
		$setLang = $this->languages(['id' => $langId]);
		$lg = 'lang_' . ($setLang instanceof stdClass ? $setLang->label : '');

		if (!empty($filter['lang'])) {
			$lang = 'label, lang_' . $filter['lang'] . ' as value';
		}

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if ($limit) {
			$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);
		} else {
			$sqlLimit = '';
		}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND ' . $lg . ' LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR label LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
			}
		}

		if (!empty($filter['sort']))
			switch ($filter['sort']) {
				case 'label_asc':
					$order = 'label';
					break;
				case 'label_desc':
					$order = 'label DESC';
					break;
				case 'lang_asc':
					$order = $lg;
					break;
				case 'lang_desc':
					$order = '' . $lg . ' DESC';
					break;
			}

		$query = $this->db->placehold("SELECT " . $lang . " FROM __translations WHERE 1 $keywordFilter ORDER BY $order $sqlLimit");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result;
			} else {
				$this->db->query($query);
				$result = $this->db->results();
				$this->cache->set($query, $result);
				return $result;
			}
		} else {
			if ($this->db->query($query)) {
				return $this->db->results();
			}
		}
	}

	/**
	 * Count Translations
	 */
	public function countTranslations($filter = [])
	{
		$keywordFilter = '';

		$langId = $this->langId();
		$setLang = $this->languages(['id' => $langId]);
		$lg = 'lang_' . ($setLang instanceof stdClass ? $setLang->label : '');

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND ' . $lg . ' LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR label LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
			}
		}

		$query = $this->db->placehold("SELECT COUNT(DISTINCT id) AS count FROM __translations WHERE 1 $keywordFilter");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result;
			} else {
				if ($this->db->query($query)) {
					$result = $this->db->result('count');
					$this->cache->set($query, $result);
					return $result;
				} else
					return false;
			}
		} else {
			if ($this->db->query($query)) {
				return $this->db->result('count');
			} else {
				return false;
			}
		}
	}

	/**
	 * Update Translation
	 */
	public function updateTranslation($id, $data)
	{
		$query = $this->db->placehold("UPDATE __translations SET ?% WHERE id IN(?@)", $data, (array) $id);
		$this->db->query($query);

		$this->dumpTranslation();

		return $id;
	}

	/**
	 * Add Translation
	 */
	public function addTranslation($data)
	{
		$query = $this->db->placehold("INSERT INTO __translations SET ?%", $data);

		if (!$this->db->query($query)) {
			return false;
		}

		$lastId = $this->db->insertId();

		$this->dumpTranslation();

		return $lastId;
	}

	/**
	 * Delete Translation
	 */
	public function deleteTranslation($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __translations WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);

			$this->dumpTranslation();
		}
	}

	/**
	 * Set Translation
	 */
	public function setTranslation()
	{
		$this->db->query("TRUNCATE TABLE __translations");

		$themeDir = 'design/' . $this->settings->theme;
		$filename = $themeDir . '/translation.sql';

		if (file_exists($filename)) {
			$this->db->restore($filename);
		}
	}

	/**
	 * Dump Translation
	 */
	public function dumpTranslation()
	{
		$themeDir = 'design/' . $this->settings->theme;

		$filename = $themeDir . '/translation.sql';
		$filename = fopen($filename, 'w');

		$this->db->dumpTable('t_translations', $filename);
	}
}
