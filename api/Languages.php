<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Languages extends Turbo
{
	public $tables = array(
		'product' => 'products',
		'variant'          => 'variants',
		'file'             => 'files',
		'brand'            => 'brands',
		'category'         => 'categories',
		'feature'          => 'features',
		'blog'             => 'blog',
		'page'             => 'pages',
		'faq'              => 'faq',
		'currency'         => 'currencies',
		'delivery'         => 'delivery',
		'payment'          => 'payment_methods',
		'banner_image'     => 'banners_images',
		'article'          => 'articles',
		'article_category' => 'articles_categories'
	);

	public $languages = array();
	public $lang_id;
	private $available_languages;

	public function __construct()
	{
		parent::__construct();
		$this->init_languages();
	}

	// Selecting the list of site languages
	public function lang_list()
	{
		if (!isset($this->available_languages)) {
			include_once("turbo/lang/languages_list.php");
			$this->available_languages = isset($langs) ? $langs : array();
		}
		return $this->available_languages;
	}

	public function get_fields($object = '')
	{
		$fields['categories']                  = array('name', 'name_h1', 'meta_title', 'meta_keywords', 'meta_description', 'description');
		$fields['brands']                      = array('name', 'name_h1', 'meta_title', 'meta_keywords', 'meta_description', 'description');
		$fields['products']                    = array('name', 'meta_title', 'meta_keywords', 'meta_description', 'annotation', 'body');
		$fields['variants']                    = array('name', 'color');
		$fields['files']                       = array('name');
		$fields['blog']                        = array('name', 'meta_title', 'meta_keywords', 'meta_description', 'annotation', 'text');
		$fields['pages']                       = array('name', 'meta_title', 'meta_keywords', 'meta_description', 'header', 'body');
		$fields['faq']                         = array('name', 'answer');
		$fields['features']                    = array('name');
		$fields['delivery']                    = array('name', 'description');
		$fields['payment_methods']             = array('name', 'description');
		$fields['currencies']                  = array('name', 'sign');
		$fields['banners_images']              = array('name', 'alt', 'title', 'description', 'url', 'button');
		$fields['articles']                    = array('name', 'author', 'meta_title', 'meta_keywords', 'meta_description', 'annotation', 'text');
		$fields['articles_categories']         = array('name', 'name_h1', 'meta_title', 'meta_keywords', 'meta_description', 'description');

		if ($object && !empty($fields[$object]))
			return $fields[$object];
		else
			return $fields;
	}

	public function get_query($params = array())
	{
		$lang   = (isset($params['lang']) && $params['lang'] ? $params['lang'] : $this->lang_id());
		$object = $params['object'];

		if (!empty($params['px'])) $px = $params['px'];
		else $px = $object[0];

		$this->db->query("SHOW TABLES LIKE '%__languages%'");
		$exist = $this->db->result();

		if (!isset($lang) && $this->settings->lang_default) $lang = $this->settings->lang_default;

		if (isset($lang)  && $exist && !empty($this->languages)) {
			$f = 'l';
			$lang_join = 'LEFT JOIN __lang_' . $this->tables[$object] . ' l ON l.' . $object . '_id=' . $px . '.id AND l.lang_id = ' . (int)$lang;
		} else {
			$f = $px;
			$lang_join = '';
		}
		$lang_col = $f . '.' . implode(', ' . $f . '.', $this->get_fields($this->tables[$object]));

		$result = new stdClass;
		$result->join   = $lang_join;
		$result->fields = $lang_col;

		return $result;
	}

	function lang_id()
	{
		if (empty($this->languages))
			return false;

		if (isset($this->lang_id))
			return $this->lang_id;

		if ($this->request->get('lang_id', 'integer')) {
			unset($_SESSION['lang_id']);
			$this->lang_id = $_SESSION['lang_id'] = $this->request->get('lang_id', 'integer');
		}

		if ($this->request->get('lang_label', 'string') && !$this->request->get('lang_id', 'integer')) {
			$lang_id = null;
			foreach ($this->languages as $l) {
				if ($this->request->get('lang_label', 'string') == $l->label) {
					$lang_id = $l->id;
					break;
				}
			}
			$this->lang_id = $_SESSION['lang_id'] = $lang_id;
			return $this->lang_id;
		}

		if (empty($this->lang_id) && !empty($_SESSION['lang_id']) && !empty($this->languages[$_SESSION['lang_id']])) {
			$this->lang_id  = $_SESSION['lang_id'];
		}
		
		if (empty($this->lang_id)) {
			$first_lang = reset($this->languages);
			$this->lang_id = $first_lang->id;
		}

		return $this->lang_id;
	}

	function set_lang_id($id)
	{
		$this->lang_id = $_SESSION['lang_id'] = $id;
	}

	function languages($filter = array())
	{
		if (empty($this->languages)) {
			$this->init_languages();
		}

		if (!empty($filter['id'])) {
			return $this->languages[$filter['id']];
		}

		if (!empty($filter['label'])) {
			foreach ($this->languages as $lang)
				if ($lang->label == $filter['label'])
					return $lang;
		}

		return $this->languages;
	}

	function init_languages()
	{
		if (!empty($this->languages))
			return $this->languages;

		if ($langs = $this->get_languages()) {
			foreach ($langs as $l)
				$this->languages[$l->id] = $l;
		} else {
			return false;
		}
	}

	public function get_language($id)
	{
		$query = $this->db->placehold("SELECT * FROM __languages WHERE id=? LIMIT 1", intval($id));
		$this->db->query($query);
		return $this->db->result();
	}

	public function get_languages($filter = array())
	{
		$this->db->query("SHOW TABLES LIKE '%__languages%'");
		if (!$this->db->result())
			return false;

		$not_default = '';
		if (!empty($filter['not_default'])) {
			$not_default = 'AND `is_default` != 1';
		}
		$query = "SELECT * FROM __languages WHERE 1 $not_default ORDER BY position";
		if ($this->db->query($query))
			return $this->db->results();
		else
			return false;
	}

	public function update_language($id, $data)
	{
		$data = (object)$data;

		$language = $this->get_language($id);

		if (isset($data->is_default) && ($data->is_default)) {
			$this->db->query("UPDATE __languages SET is_default=0 WHERE is_default=1");
			$this->settings->lang_default = $id;
		}

		$query = $this->db->placehold("UPDATE __languages SET ?% WHERE id in(?@)", $data, (array)$id);
		$this->db->query($query);

		if (isset($data->label) && ($data->label && !empty($language) && $language->label !== $data->label)) {
			foreach ($this->tables as $table)
				$this->db->query("UPDATE __lang_" . $table . " SET lang_label=? WHERE lang_id=?", $data->label, $id);
		}
		return $id;
	}

	public function add_language($data)
	{
		$data = (object)$data;

		$languages = $this->get_languages();
		$lang = $this->settings->lang;
		$data->position = 1;
		if (!empty($languages)) {
			$languag = reset($languages);
			$data->position = $languag->position + 1;
		}

		// if there is no field in translations, add it
		$this->db->query("SHOW FIELDS FROM __translations WHERE field=?", 'lang_' . $data->label);
		if (!$this->db->result()) {
			$this->db->query("ALTER TABLE __translations ADD COLUMN `lang_$data->label` VARCHAR(255) NOT NULL DEFAULT ''");
			$this->db->query("UPDATE __translations SET lang_$data->label = lang_$lang");
		}

		$query = $this->db->placehold('INSERT INTO __languages SET ?%', $data);
		if (!$this->db->query($query))
			return false;

		$last_id = $this->db->insert_id();

		if ($last_id) {
			$description_fields = $this->get_fields();

			foreach ($this->tables as $object => $tab) {
				$this->db->query('INSERT INTO __lang_' . $tab . ' (' . implode(',', $description_fields[$tab]) . ', ' . $object . '_id, lang_id, lang_label)
							  SELECT ' . implode(',', $description_fields[$tab]) . ', id, ?, ?
							  FROM __' . $tab . '', $last_id, $data->label);
			}

			if (!empty($languages)) {
				$this->db->query("SELECT * FROM __options WHERE lang_id=?", $languag->id);
				$options = $this->db->results();
				if (!empty($options)) {
					foreach ($options as $o) {
						$this->db->query("REPLACE INTO __options SET lang_id=?, value=?, product_id=?, feature_id=?", $last_id, $o->value, $o->product_id, $o->feature_id);
					}
				}

				@$settings = $this->settings->get_settings($this->languag->id);
				if (!empty($settings)) {
					foreach ($settings as $s) {
						$this->db->query("REPLACE INTO __settings_lang SET lang_id=?, name=?, value=?", $last_id, $s->name, $s->value);
					}
				}

				@$seo = $this->seo->get_seo($this->languag->id);
				if (!empty($seo)) {
					foreach ($seo as $s) {
						$this->db->query("REPLACE INTO __seo_lang SET lang_id=?, name=?, value=?", $last_id, $s->name, $s->value);
					}
				}
			} else {
				$this->db->query("UPDATE __options SET lang_id=?", $last_id);
				$this->db->query("UPDATE __settings_lang SET lang_id=?", $last_id);
				$this->db->query("UPDATE __seo_lang SET lang_id=?", $last_id);
			}

			return $last_id;
		}
	}

	public function delete_language($id)
	{

		if (!empty($id)) {
			$lang = $this->get_language($id);
			if (isset($lang->is_default) && (!$lang->is_default)) {
				$query = $this->db->placehold("DELETE FROM __languages WHERE id=? LIMIT 1", intval($id));
				$this->db->query($query);

				foreach ($this->tables as $table)
					$this->db->query("DELETE FROM  __lang_" . $table . " WHERE lang_id=?", intval($id));

				$this->db->query("DELETE FROM  __options WHERE lang_id=?", intval($id));
				$this->db->query("DELETE FROM __settings_lang WHERE lang_id=?", intval($id));
				$this->db->query("DELETE FROM __seo_lang WHERE lang_id=?", intval($id));
				$this->db->query("ALTER TABLE __translations DROP COLUMN `lang_$lang->label`");
			}
		}
	}

	public function get_data_lang($object_id, $object, $object_ids = array())
	{
		if (!$object_id)
			if (empty($object_ids))
				return false;

		$tables['product']  = 'products';
		$tables['category'] = 'categories';
		$tables['feature']  = 'features';
		$tables['blog']     = 'blog';
		$tables['page']     = 'pages';
		$tables['article_category'] = 'articles_categories';

		if (!in_array($object, array_keys($tables)))
			return false;

		if (!empty($object_ids))
			$where = $this->db->placehold($object . "_id in(?@)", $object_ids);
		else
			$where = $object . "_id=?";

		$query = $this->db->placehold("SELECT * FROM __lang_" . $tables[$object] . " WHERE " . $where . "", $object_id);
		$this->db->query($query);
		$data_lang = $this->db->results();

		$langs = array();
		if (!empty($data_lang) && $object_id) {
			foreach ($data_lang as $dl)
				$langs[$dl->lang_id] = $dl;
		}
		if (!empty($data_lang) && !$object_id && !empty($object_ids)) {
			$langs = $data_lang;
		}
		return $langs;
	}

	public function action_data($object_id, $data, $object)
	{
		if (!in_array($object, array_keys($this->tables)))
			return false;

		$this->db->query("SELECT count(*) as count FROM __lang_" . $this->tables[$object] . " WHERE lang_id=? AND " . $object . "_id=? LIMIT 1", $data->lang_id, $object_id);
		$data_lang = $this->db->result('count');

		if ($data_lang == 0) {
			$object_fild   = $object . '_id';
			$data->$object_fild = $object_id;
			$query = $this->db->placehold('INSERT INTO __lang_' . $this->tables[$object] . ' SET ?%', $data);
			$this->db->query($query);
			$result = 'add';
		} elseif ($data_lang == 1) {
			$this->db->query("UPDATE __lang_" . $this->tables[$object] . " SET ?% WHERE lang_id=? AND " . $object . "_id=?", $data, $data->lang_id, $object_id);
			$result = 'update';
		}

		return $result;
	}

	public function get_description($data, $object)
	{
		if (!in_array($object, array_keys($this->tables)))
			return false;

		$languages   = $this->languages();
		$languag     = reset($languages);
		$fields      = $this->get_fields($this->tables[$object]);
		$intersect   = array_intersect($fields, array_keys((array)$data));

		$new_data = $object;
		if (!empty($languages) && !empty($intersect)) {
			$description = new stdClass;
			foreach ($intersect as $f) {
				$description->$f = $data->$f;
				if ($languag->id != $this->lang_id) {
					unset($data->$f);
				}
			}
			$result = new \stdClass();
			$result->description = $description;

			return $result;
		}
		return false;
	}

	public function action_description($object_id, $description, $object, $update_lang = null)
	{
		if (!in_array($object, array_keys($this->tables))) {
			return false;
		}

		$languages = $this->languages();
		if (empty($languages)) {
			return;
		}

		$fields = $this->get_fields($this->tables[$object]);
		if (!empty($fields)) {
			if ($update_lang) {
				$upd_languages[] = $languages[$update_lang];
			} else {
				$upd_languages = $languages;
			}
			foreach ($upd_languages as $lang) {
				$description->lang_id = $lang->id;
				$this->action_data($object_id, $description, $object);
			}
			return;
		} else {
			return;
		}
	}

	// Translation start

	public function get_translation($id)
	{
		$query = $this->db->placehold("SELECT * FROM __translations WHERE id=? LIMIT 1", intval($id));
		$this->db->query($query);
		return $this->db->result();
	}

	public function get_translations($filter = array())
	{
		$limit = 0;
		$page = 1;
		$keyword_filter = '';
		$lang = '*';
		$order = 'label';
		$lang_id  = $this->lang_id();
		$set_lang = $this->languages(array('id' => $lang_id));
		$lg = 'lang_' . $set_lang->label;

		if (!empty($filter['lang'])) {
			$lang = 'label, lang_' . $filter['lang'] . ' as value';
		}

		if (isset($filter['limit']))
			$limit = max(1, intval($filter['limit']));

		if (isset($filter['page']))
			$page = max(1, intval($filter['page']));

		if ($limit)
			$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);
		else
			$sql_limit = '';

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND ' . $lg . ' LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR label LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
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

		$query = "SELECT " . $lang . " FROM __translations WHERE 1 $keyword_filter ORDER BY $order $sql_limit";

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result; // return data from memcached
			} else {
				$this->db->query($query); // otherwise pull from the database
				$result = $this->db->results();
				$this->cache->set($query, $result); // put into cache
				return $result;
			}
		} else {
			if ($this->db->query($query))
				return $this->db->results();
		}
	}

	public function count_translations($filter = array())
	{
		$keyword_filter = '';
		$lang_id  = $this->lang_id();
		$set_lang = $this->languages(array('id' => $lang_id));
		$lg = 'lang_' . $set_lang->label;

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND ' . $lg . ' LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR label LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
		}

		$query = $this->db->placehold("SELECT count(distinct id) as count FROM __translations  WHERE 1 $keyword_filter");

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result; // return data from memcached
			} else {
				if ($this->db->query($query)) {
					$result = $this->db->result('count');
					$this->cache->set($query, $result); // put into cache
					return $result;
				} else
					return false;
			}
		} else {
			if ($this->db->query($query))
				return $this->db->result('count');
			else
				return false;
		}
	}

	public function update_translation($id, $data)
	{
		$query = $this->db->placehold("UPDATE __translations SET ?% WHERE id in(?@)", $data, (array)$id);
		$this->db->query($query);
		$this->dump_translation();
		return $id;
	}

	public function add_translation($data)
	{
		$query = $this->db->placehold('INSERT INTO __translations SET ?%', $data);
		if (!$this->db->query($query))
			return false;
		$last_id = $this->db->insert_id();
		$this->dump_translation();
		return $last_id;
	}

	public function update_translation_config_js()
	{
		$translations = $this->get_translations();

		// THEME JS
		$js = "";
		$theme_dir = 'design/' . $this->settings->theme;
		$filejs = $theme_dir . '/lang.js';
		$filejs = fopen($filejs, 'w');
		$js .= "var lang = new Array();\n";

		$lang_id  = $this->lang_id();
		$set_lang = $this->languages(array('id' => $lang_id));

		foreach ($translations as $t) {
			if ($t->in_config) {
				$lang = 'lang_' . $set_lang->label;
				$js .= "\nlang['" . $t->label . "'] = '" . mysql_escape_string($t->$lang) . "';";
			}
		}
		fwrite($filejs, $js);
		fclose($filejs);
	}

	public function delete_translation($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __translations WHERE id=? LIMIT 1", intval($id));
			$this->db->query($query);
		}
	}

	public function set_translation()
	{
		$this->db->query("TRUNCATE TABLE __translations");

		$theme_dir = 'design/' . $this->settings->theme;
		$filename = $theme_dir . '/translation.sql';
		if (file_exists($filename)) {
			$this->db->restore($filename);
		}
	}

	public function dump_translation()
	{
		$theme_dir = 'design/' . $this->settings->theme;
		$filename = $theme_dir . '/translation.sql';
		$filename = fopen($filename, 'w');

		$this->db->dump_table('t_translations', $filename);
	}
}
