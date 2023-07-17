<?php

require_once 'Turbo.php';

class Features extends Turbo
{
	/**
	 * Get features
	 */
	function getFeatures($filter = [])
	{
		$page = 1;
		$limit = 100;
		$idFilter = '';
		$inFilter = '';
		$sqlLimit = '';
		$keywordFilter = '';
		$categoryIdFilter = '';

		$langId = $this->languages->langId();
		$px = ($langId ? 'l' : 'f');

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword)
				$keywordFilter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		if (isset($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold('AND id IN(SELECT feature_id FROM __categories_features AS cf WHERE cf.category_id IN(?@))', (array) $filter['category_id']);
		}

		if (isset($filter['in_filter'])) {
			$inFilter = $this->db->placehold('AND f.in_filter=?', (int) $filter['in_filter']);
		}

		if (!empty($filter['id'])) {
			$idFilter = $this->db->placehold('AND f.id IN(?@)', (array) $filter['id']);
		}

		$langSql = $this->languages->getQuery(['object' => 'feature']);

		$query = $this->db->placehold(
			"SELECT
				f.id,
				f.name,
				f.position,
				f.in_filter,
				f.url,
				f.url_in_product,
				f.is_color,
				f.is_size,
				$langSql->fields
			FROM __features AS f
			$langSql->join
			WHERE 1
				$categoryIdFilter
				$inFilter
				$idFilter
				$keywordFilter
			ORDER BY
				f.position
			$sqlLimit"
		);

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
			$this->db->query($query);
			return $this->db->results();
		}
	}

	/**
	 * Count features
	 */
	public function countFeatures($filters = [])
	{
		$idFilter = '';
		$keywordFilter = '';
		$inFilterFilter = '';
		$categoryIdFilter = '';

		if (isset($filters['category_id'])) {
			$categoryIdFilter = $this->db->placehold('AND id IN(SELECT feature_id FROM __categories_features AS cf WHERE cf.category_id IN(?@))', (array) $filters['category_id']);
		}

		if (isset($filters['in_filter'])) {
			$inFilterFilter = $this->db->placehold('AND f.in_filter=?', (int) $filters['in_filter']);
		}

		if (!empty($filters['id'])) {
			$idFilter = $this->db->placehold('AND f.id IN(?@)', (array) $filters['id']);
		}

		if (isset($filters['keyword'])) {
			$keywords = explode(' ', $filters['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (f.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$langSql = $this->languages->getQuery(['object' => 'feature']);

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT f.id) AS count 
			FROM __features AS f $langSql->join
			WHERE 1
				$categoryIdFilter
				$inFilterFilter
				$keywordFilter
				$idFilter"
		);

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			if ($result = $this->cache->get($query)) {
				return $result;
			} else {
				if ($this->db->query($query)) {
					$result = $this->db->result('count');
					$this->cache->set($query, $result);
					return $result;
				} else {
					return false;
				}
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
	 * Get feature
	 */
	public function getFeature($id)
	{
		if (is_int($id)) {
			$where = $this->db->placehold('id=?', $id);
		} else {
			$where = $this->db->placehold('url=?', $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'feature']);

		$query = $this->db->placehold(
			"SELECT 
				f.id, 
				f.name, 
				f.position, 
				f.in_filter, 
				f.url, 
				f.url_in_product, 
				f.is_color, 
				f.is_size, 
				$langSql->fields 
			FROM 
				__features f 
				$langSql->join 
			WHERE 
				$where 
			LIMIT 1"
		);

		$this->db->query($query);
		return $this->db->result();
	}

	/**
	 * Get compare
	 */
	public function getCompare($id)
	{
		$langSql = $this->languages->getQuery(['object' => 'feature']);

		$query = $this->db->placehold(
			"SELECT 
				f.id, 
				f.name, 
				f.position, 
				f.in_filter, 
				f.is_color, 
				f.is_size, 
				$langSql->fields 
			FROM 
				__features f 
				$langSql->join 
			WHERE 
				id=? 
			LIMIT 1",
			$id
		);

		$this->db->query($query);
		return $this->db->result();
	}

	/**
	 * Get feature categories
	 */
	function getFeatureCategories($id)
	{
		$query = $this->db->placehold("SELECT cf.category_id AS category_id FROM __categories_features cf WHERE cf.feature_id = ?", $id);
		$this->db->query($query);

		return $this->db->results('category_id');
	}

	/**
	 * Add feature
	 */
	public function addFeature($feature)
	{
		$feature = (array) $feature;

		if (!empty($feature['url'])) {
			$feature['url'] = preg_replace("/[\s]+/ui", '', $feature['url']);
			$feature['url'] = strtolower(preg_replace("/[^0-9a-z]+/ui", '', $feature['url']));
		}

		if (empty($feature['url'])) {
			$feature['url'] = $this->translit($feature['name']);
		}

		while ($this->getFeature((string) $feature['url'])) {
			if (preg_match('/(.+)([0-9]+)$/', $feature['url'], $parts)) {
				$feature['url'] = $parts[1] . '' . ($parts[2] + 1);
			} else {
				$feature['url'] = $feature['url'] . '2';
			}
		}

		$feature = (object) $feature;
		$result = $this->languages->getDescription($feature, 'feature');

		$query = $this->db->placehold("INSERT INTO __features SET ?%", $feature);

		$this->db->query($query);
		$id = $this->db->insertId();

		$query = $this->db->placehold("UPDATE __features SET position=id WHERE id=? LIMIT 1", $id);

		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'feature');
		}

		return $id;
	}

	/**
	 * Update feature
	 */
	public function updateFeature($id, $feature)
	{
		$result = $this->languages->getDescription($feature, 'feature');

		if (!empty($result->data)) {
			$feature = $result->data;
		}

		$query = $this->db->placehold("UPDATE __features SET ?% WHERE id IN(?@) LIMIT ?", (array) $feature, (array) $id, count((array) $id));

		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'feature', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Delete feature
	 */
	public function deleteFeature($id = [])
	{
		if (!empty($id)) {
			$query = $this->db->placehold('DELETE FROM __features WHERE id=? LIMIT 1', (int) $id);

			$this->db->query($query);

			$query = $this->db->placehold('DELETE FROM __options WHERE feature_id=?', (int) $id);

			$this->db->query($query);

			$query = $this->db->placehold('DELETE FROM __categories_features WHERE feature_id=?', (int) $id);

			$this->db->query($query);

			$query = $this->db->placehold('DELETE FROM __lang_features WHERE feature_id=?', (int) $id);

			$this->db->query($query);
		}
	}

	/**
	 * Delete option
	 */
	public function deleteOption($productId, $featureId)
	{
		$langId = $this->languages->langId();
		$whereLang = '';

		if ($langId) {
			$whereLang = $this->db->placehold('AND lang_id=?', $langId);
		}

		$query = $this->db->placehold('DELETE FROM __options WHERE product_id=? AND feature_id=? ' . $whereLang . ' LIMIT 1', $productId, $featureId);
		$this->db->query($query);
	}

	/**
	 * Update option
	 */
	public function updateOption($productId, $featureId, $value, $translit = '')
	{
		$langId = $this->languages->langId();
		$whereLang = '';
		$intoLang = '';

		if ($langId) {
			$whereLang = $this->db->placehold("AND lang_id=?", $langId);
			$intoLang = $this->db->placehold("lang_id=?, ", $langId);
		}

		$translit = isset($translit) ? $translit : '';

		if ($value != '') {
			$query = $this->db->placehold("REPLACE INTO __options SET " . $intoLang . " value=?, product_id=?, feature_id=?, translit=?", $value, (int) $productId, (int) $featureId, ($translit != '' ? $translit : $this->translit($value)));
		} else {
			$query = $this->db->placehold("DELETE FROM __options WHERE feature_id=? AND product_id=? " . $whereLang . "", (int) $featureId, (int) $productId);
		}

		return $this->db->query($query);
	}

	/**
	 * Add feature category
	 */
	public function addFeatureCategory($id, $categoryId)
	{
		$query = $this->db->placehold("INSERT IGNORE INTO __categories_features SET feature_id=?, category_id=?", $id, $categoryId);

		$this->db->query($query);
	}

	/**
	 * Update feature categories
	 */
	public function updateFeatureCategories($id, $categories)
	{
		$id = (int) $id;
		$query = $this->db->placehold("DELETE FROM __categories_features WHERE feature_id=?", $id);
		$this->db->query($query);

		if (is_array($categories)) {
			$values = [];

			foreach ($categories as $category) {
				$values[] = "($id, " . (int) $category . ")";
			}

			$query = $this->db->placehold("INSERT INTO __categories_features (feature_id, category_id) VALUES" . implode(', ', $values));
			$this->db->query($query);

			$query = $this->db->placehold(
				"DELETE o FROM __options o
				LEFT JOIN __products_categories pc ON pc.product_id=o.product_id
				WHERE o.feature_id=?
				AND pc.position=(SELECT MIN(pc2.position) FROM __products_categories pc2 WHERE pc.product_id=pc2.product_id)
				AND pc.category_id NOT IN(?@)",
				$id,
				$categories
			);

			$this->db->query($query);
		} else {
			$query = $this->db->placehold("DELETE o FROM __options o WHERE o.feature_id=?", $id);
			$this->db->query($query);
		}
	}

	/**
	 * Get options
	 */
	public function getOptions($filter = [])
	{
		$visibleFilter = '';
		$brandIdFilter = '';
		$featuresFilter = '';
		$productIdFilter = '';
		$featureIdFilter = '';
		$categoryIdFilter = '';

		if (empty($filter['feature_id']) && empty($filter['product_id'])) {
			return [];
		}

		if (isset($filter['feature_id'])) {
			$featureIdFilter = $this->db->placehold('AND po.feature_id IN(?@)', (array) $filter['feature_id']);
		}

		if (isset($filter['product_id'])) {
			$productIdFilter = $this->db->placehold('AND po.product_id IN(?@)', (array) $filter['product_id']);
		}

		if (isset($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold('INNER JOIN __products_categories pc ON pc.product_id=po.product_id AND pc.category_id in(?@)', (array) $filter['category_id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('INNER JOIN __products p ON p.id=po.product_id AND visible=?', (int) $filter['visible']);
		}

		if (isset($filter['brand_id'])) {
			$brandIdFilter = $this->db->placehold('AND po.product_id in(SELECT id FROM __products WHERE brand_id in(?@))', (array) $filter['brand_id']);
		}

		if (isset($filter['features'])) {
			foreach ($filter['features'] as $feature => $value) {
				$featuresFilter .= $this->db->placehold('AND (po.feature_id=? OR po.product_id IN (SELECT product_id FROM t_options WHERE feature_id=? AND translit IN(?@)))', $feature, $feature, $value);
			}
		}

		$langId = $this->languages->langId();
		$whereLang = '';

		if ($langId) {
			$whereLang = $this->db->placehold("AND po.lang_id=?", $langId);
		}

		$query = $this->db->placehold(
			"SELECT 
				po.product_id, 
				po.feature_id, 
				po.value, 
				po.translit, 
				COUNT(po.product_id) AS count
			FROM 
				__options po
			$visibleFilter
			$categoryIdFilter
			WHERE 
				1 
				$whereLang 
				$featureIdFilter 
				$productIdFilter 
				$brandIdFilter 
				$featuresFilter 
			GROUP BY 
				po.feature_id, po.value 
			ORDER BY 
				po.value = 0, 
				-po.value DESC, 
				po.value"
		);

		if ($this->settings->cached == 1 && empty($_SESSION['admin'])) {
			$result = $this->cache->get($query);

			if ($result) {
				return $result;
			} else {
				$this->db->query($query);
				$result = $this->db->results();
				$this->cache->set($query, $result);
				return $result;
			}
		} else {
			$this->db->query($query);
			return $this->db->results();
		}
	}

	/**
	 * Get product options
	 */
	public function getProductOptions($productId)
	{
		$langId = $this->languages->langId();
		$langIdFilter = '';

		if ($langId) {
			$langIdFilter = $this->db->placehold("AND po.lang_id=?", $langId);
		}

		$langSql = $this->languages->getQuery(['object' => 'feature', 'px' => 'f']);

		$query = $this->db->placehold(
			"SELECT
				f.id AS feature_id,
				f.name,
				f.is_color,
				f.is_size,
				po.value,
				po.product_id,
				po.translit,
				$langSql->fields
			FROM __options po
			LEFT JOIN __features f ON f.id = po.feature_id
			$langSql->join
			WHERE po.product_id IN(?@)
				$langIdFilter
			ORDER BY f.position",
			(array) $productId
		);

		$this->db->query($query);
		$res = $this->db->results();

		return $res;
	}

	/**
	 * Transliterate
	 */
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
