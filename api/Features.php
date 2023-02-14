<?php

require_once('Turbo.php');

class Features extends Turbo
{
	function get_features($filter = array())
	{
		$limit = 100;
		$page = 1;
		$sql_limit = '';
		$keyword_filter = '';
		$category_id_filter = '';

		$lang_id  = $this->languages->lang_id();
		$px = ($lang_id ? 'l' : 'f');

		if (isset($filter['limit'])) {
			$limit = max(1, intval($filter['limit']));
		}

		if (isset($filter['page'])) {
			$page = max(1, intval($filter['page']));
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$sql_limit = $this->db->placehold(' LIMIT ?, ? ', ($page - 1) * $limit, $limit);

		if (isset($filter['category_id']))
			$category_id_filter = $this->db->placehold('AND id in(SELECT feature_id FROM __categories_features AS cf WHERE cf.category_id in(?@))', (array)$filter['category_id']);

		$in_filter_filter = '';
		if (isset($filter['in_filter']))
			$in_filter_filter = $this->db->placehold('AND f.in_filter=?', intval($filter['in_filter']));

		$id_filter = '';
		if (!empty($filter['id']))
			$id_filter = $this->db->placehold('AND f.id in(?@)', (array)$filter['id']);

		$lang_sql = $this->languages->get_query(array('object' => 'feature'));

		// Select features
		$query = $this->db->placehold("SELECT f.id, f.name, f.position, f.in_filter, f.url, f.url_in_product, f.is_color, $lang_sql->fields FROM __features AS f $lang_sql->join
									WHERE 1
									$category_id_filter $in_filter_filter $id_filter $keyword_filter ORDER BY f.position $sql_limit");

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
			$this->db->query($query);
			return $this->db->results();
		}
	}

	public function count_features($filter = array())
	{
		$keyword_filter = '';
		$category_id_filter = '';
		if (isset($filter['category_id'])) {
			$category_id_filter = $this->db->placehold('AND id in(SELECT feature_id FROM __categories_features AS cf WHERE cf.category_id in(?@))', (array)$filter['category_id']);
		}

		$in_filter_filter = '';
		if (isset($filter['in_filter'])) {
			$in_filter_filter = $this->db->placehold('AND f.in_filter=?', intval($filter['in_filter']));
		}

		$id_filter = '';
		if (!empty($filter['id'])) {
			$id_filter = $this->db->placehold('AND f.id in(?@)', (array)$filter['id']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keyword_filter .= $this->db->placehold('AND (f.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$lang_sql = $this->languages->get_query(array('object' => 'feature'));

		// Select features
		$query = $this->db->placehold("SELECT count(distinct f.id) as count FROM __features AS f $lang_sql->join
            WHERE 1
                $category_id_filter
                $in_filter_filter
				$keyword_filter
                $id_filter");

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

	function get_feature($id)
	{
		// Select features
		if (is_int($id))
			$where = $this->db->placehold('id = ?', $id);
		else
			$where = $this->db->placehold('url = ?', $id);

		$lang_sql = $this->languages->get_query(array('object' => 'feature'));

		$query = $this->db->placehold("SELECT f.id, f.name, f.position, f.in_filter, f.url, f.url_in_product, f.is_color, $lang_sql->fields FROM __features f $lang_sql->join WHERE $where LIMIT 1");
		$this->db->query($query);
		return $this->db->result();
	}

	function get_compare($id)
	{
		$lang_sql = $this->languages->get_query(array('object' => 'feature'));

		// Select features
		$query = $this->db->placehold("SELECT f.id, f.name, f.position, f.in_filter, f.is_color, $lang_sql->fields FROM __features f $lang_sql->join WHERE id=? LIMIT 1", $id);
		$this->db->query($query);
		return $this->db->result();
	}

	function get_feature_categories($id)
	{
		$query = $this->db->placehold("SELECT cf.category_id as category_id FROM __categories_features cf
										WHERE cf.feature_id = ?", $id);
		$this->db->query($query);
		return $this->db->results('category_id');
	}

	public function add_feature($feature)
	{
		$feature = (array)$feature;
		if (!empty($feature['url'])) {
			$feature['url'] = preg_replace("/[\s]+/ui", '', $feature['url']);
			$feature['url'] = strtolower(preg_replace("/[^0-9a-z]+/ui", '', $feature['url']));
		}
		if (empty($feature['url'])) {
			$feature['url'] = $this->translit($feature['name']);
		}
		while ($this->get_feature((string)$feature['url'])) {
			if (preg_match('/(.+)([0-9]+)$/', $feature['url'], $parts)) {
				$feature['url'] = $parts[1] . '' . ($parts[2] + 1);
			} else {
				$feature['url'] = $feature['url'] . '2';
			}
		}

		$feature = (object)$feature;
		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($feature, 'feature');

		$query = $this->db->placehold("INSERT INTO __features SET ?%", $feature);
		$this->db->query($query);
		$id = $this->db->insert_id();
		$query = $this->db->placehold("UPDATE __features SET position=id WHERE id=? LIMIT 1", $id);
		$this->db->query($query);

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'feature');
		}
		return $id;
	}

	public function update_feature($id, $feature)
	{

		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($feature, 'feature');
		if (!empty($result->data)) $feature = $result->data;

		$query = $this->db->placehold("UPDATE __features SET ?% WHERE id in(?@) LIMIT ?", (array)$feature, (array)$id, count((array)$id));
		$this->db->query($query);

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'feature', $this->languages->lang_id());
		}

		return $id;
	}

	public function delete_feature($id = array())
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __features WHERE id=? LIMIT 1", intval($id));
			$this->db->query($query);
			$query = $this->db->placehold("DELETE FROM __options WHERE feature_id=?", intval($id));
			$this->db->query($query);
			$query = $this->db->placehold("DELETE FROM __categories_features WHERE feature_id=?", intval($id));
			$this->db->query($query);
			$this->db->query("DELETE FROM __lang_features WHERE feature_id=?", intval($id));
		}
	}

	public function delete_option($product_id, $feature_id)
	{
		$lang_id  = $this->languages->lang_id();
		$where_lang = '';
		if ($lang_id) {
			$where_lang = $this->db->placehold("AND lang_id=?", $lang_id);
		}

		$query = $this->db->placehold("DELETE FROM __options WHERE product_id=? AND feature_id=? " . $where_lang . " LIMIT 1", intval($product_id), intval($feature_id));
		$this->db->query($query);
	}

	public function update_option($product_id, $feature_id, $value, $translit = '')
	{
		$lang_id  = $this->languages->lang_id();
		$where_lang = '';
		$into_lang = '';
		if ($lang_id) {
			$where_lang = $this->db->placehold("AND lang_id=?", $lang_id);
			$into_lang = $this->db->placehold("lang_id=?, ", $lang_id);
		}

		if ($value != '')
			$query = $this->db->placehold("REPLACE INTO __options SET " . $into_lang . " value=?, product_id=?, feature_id=?, translit=?", $value, intval($product_id), intval($feature_id), ($translit != '' ? $translit : $this->translit($value)));
		else
			$query = $this->db->placehold("DELETE FROM __options WHERE feature_id=? AND product_id=? " . $where_lang . "", intval($feature_id), intval($product_id));
		return $this->db->query($query);
	}

	public function add_feature_category($id, $category_id)
	{
		$query = $this->db->placehold("INSERT IGNORE INTO __categories_features SET feature_id=?, category_id=?", $id, $category_id);
		$this->db->query($query);
	}

	public function update_feature_categories($id, $categories)
	{
		$id = intval($id);
		$query = $this->db->placehold("DELETE FROM __categories_features WHERE feature_id=?", $id);
		$this->db->query($query);

		if (is_array($categories)) {
			$values = array();
			foreach ($categories as $category)
				$values[] = "($id , " . intval($category) . ")";

			$query = $this->db->placehold("INSERT INTO __categories_features (feature_id, category_id) VALUES " . implode(', ', $values));
			$this->db->query($query);

			// Delete values from options
			$query = $this->db->placehold("DELETE o FROM __options o
			                               LEFT JOIN __products_categories pc ON pc.product_id=o.product_id
			                               WHERE o.feature_id=? AND pc.position=(SELECT MIN(pc2.position) FROM __products_categories pc2 WHERE pc.product_id=pc2.product_id) AND pc.category_id not in(?@)", $id, $categories);
			$this->db->query($query);
		} else {

			// Delete values from options 
			$query = $this->db->placehold("DELETE o FROM __options o WHERE o.feature_id=?", $id);
			$this->db->query($query);
		}
	}

	public function get_options($filter = array())
	{
		$feature_id_filter = '';
		$product_id_filter = '';
		$category_id_filter = '';
		$visible_filter = '';
		$brand_id_filter = '';
		$features_filter = '';
		$position_order = '';

		if (empty($filter['feature_id']) && empty($filter['product_id']))
			return array();

		$group_by = '';
		if (isset($filter['feature_id']))
			$group_by = 'GROUP BY feature_id, value';

		if (isset($filter['feature_id']))
			$feature_id_filter = $this->db->placehold('AND po.feature_id in(?@)', (array)$filter['feature_id']);

		if (isset($filter['product_id']))
			$product_id_filter = $this->db->placehold('AND po.product_id in(?@)', (array)$filter['product_id']);

		if (isset($filter['category_id']))
			$category_id_filter = $this->db->placehold('INNER JOIN __products_categories pc ON pc.product_id=po.product_id AND pc.category_id in(?@)', (array)$filter['category_id']);

		if (isset($filter['visible']))
			$visible_filter = $this->db->placehold('INNER JOIN __products p ON p.id=po.product_id AND visible=?', intval($filter['visible']));

		if (isset($filter['brand_id']))
			$brand_id_filter = $this->db->placehold('AND po.product_id in(SELECT id FROM __products WHERE brand_id in(?@))', (array)$filter['brand_id']);

		if (isset($filter['features']))
			foreach ($filter['features'] as $feature => $value) {
				$features_filter .= $this->db->placehold('AND (po.feature_id=? OR po.product_id in (SELECT product_id FROM t_options WHERE feature_id=? AND translit in (?@) )) ', $feature, $feature, $value);
			}

		$lang_id  = $this->languages->lang_id();
		$where_lang = '';
		if ($lang_id) {
			$where_lang = $this->db->placehold("AND po.lang_id=?", $lang_id);
		}

		$query = $this->db->placehold("SELECT po.product_id, po.feature_id, po.value, po.translit, count(po.product_id) as count
		    FROM __options po
		    $visible_filter
			$category_id_filter
			WHERE 1 $where_lang $feature_id_filter $product_id_filter $brand_id_filter $features_filter GROUP BY po.feature_id, po.value ORDER BY value=0, -value DESC, value");

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
			$this->db->query($query);
			return $this->db->results();
		}
	}

	public function get_product_options($product_id)
	{
		$lang_id  = $this->languages->lang_id();
		$lang_id_filter = '';
		if ($lang_id) {
			$lang_id_filter = $this->db->placehold("AND po.lang_id=?", $lang_id);
		}

		$lang_sql = $this->languages->get_query(array('object' => 'feature', 'px' => 'f'));

		$query = $this->db->placehold("SELECT f.id as feature_id, f.name, f.is_color, po.value, po.product_id, po.translit, $lang_sql->fields FROM __options po LEFT JOIN __features f ON f.id=po.feature_id $lang_sql->join
										WHERE po.product_id in(?@) $lang_id_filter ORDER BY f.position", (array)$product_id);
		$this->db->query($query);
		$res = $this->db->results();

		return $res;
	}

	public function translit($text)
	{
		$cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($cyr, $lat, $text);
		$res = preg_replace("/[\s\-_]+/ui", '', $res);
		$res = preg_replace('/[^\p{L}\p{Nd}\d-]/ui', '', $res);
		$res = strtolower($res);
		return $res;
	}
}
