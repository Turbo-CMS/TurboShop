<?php

require_once 'Turbo.php';

class Brands extends Turbo
{
	/**
	 * Get Brands
	 */
	public function getBrands($filter = [])
	{
		$visibleBrandFilter = '';
		$categoryIdFilter = '';
		$visibleFilter = '';
		$inStockFilter = '';
		$visibleFilter = '';

		if (isset($filter['in_stock'])) {
			$inStockFilter = $this->db->placehold('AND (SELECT COUNT(*)>0 FROM __variants pv WHERE pv.product_id=p.id AND pv.price>0 AND (pv.stock IS NULL OR pv.stock>0) LIMIT 1) = ?', (int) $filter['in_stock']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND p.visible=?', (int) $filter['visible']);
		}

		if (isset($filter['visible_brand'])) {
			$visibleBrandFilter = $this->db->placehold('WHERE 1 AND b.visible=?', (int) $filter['visible_brand']);
		}

		if (!empty($filter['category_id'])) {
			$categoryIdFilter = $this->db->placehold("LEFT JOIN __products p ON p.brand_id=b.id LEFT JOIN __products_categories pc ON p.id=pc.product_id WHERE pc.category_id IN(?@) $visibleFilter $inStockFilter", (array) $filter['category_id']);

			if (!empty($filter['features']) && !empty($filter['features'])) {
				foreach ($filter['features'] as $feature => $value) {
					$categoryIdFilter .= $this->db->placehold('AND p.id IN(SELECT po.product_id FROM __products_options AS po LEFT JOIN __options AS o ON o.id=po.option_id WHERE feature_id=? AND translit IN(?@))', $feature, (array) $value);
				}
			}

			if (!empty($filter['brand_id'])) {
				$categoryIdFilter .= $this->db->placehold("OR b.id IN(?@)", (array) $filter['brand_id']);
			}

			$currency = $this->money->getCurrencies(['enabled' => 1]);
			$currency = reset($currency);

			if (!empty($filter['min_price'])) {
				$categoryIdFilter .= $this->db->placehold('AND p.id IN(SELECT product_id FROM __variants WHERE IF((currency_id !=' . $currency->id . ' AND currency_id>0), (price*(SELECT rate_to FROM __currencies AS c WHERE c.id=currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id=currency_id)), price) >=?)', floatval($filter['min_price']));
			}

			if (!empty($filter['max_price'])) {
				$categoryIdFilter .= $this->db->placehold('AND p.id IN(SELECT product_id FROM __variants WHERE IF((currency_id !=' . $currency->id . ' AND currency_id>0), (price*(SELECT rate_to FROM __currencies AS c WHERE c.id=currency_id)/(SELECT rate_from FROM __currencies AS c WHERE c.id=currency_id)), price) <=?)', floatval($filter['max_price']));
			}
		}

		$langSql = $this->languages->getQuery(['object' => 'brand']);

		$query = $this->db->placehold(
			"SELECT DISTINCT 
				b.id, 
				b.name, 
				b.name_h1, 
				b.url, 
				b.visible, 
				b.meta_title, 
				b.meta_keywords, 
				b.meta_description, 
				b.description, 
				b.image, 
				b.last_modified, 
				$langSql->fields 
			FROM __brands b 
				$langSql->join
				$visibleBrandFilter 
				$categoryIdFilter 
			ORDER BY 
				b.name"
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
	 * Get Brand
	 */
	public function getBrand($id)
	{
		if (is_int($id)) {
			$filter = $this->db->placehold('b.id=?', $id);
		} else {
			$filter = $this->db->placehold('b.url=?', $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'brand']);

		$query = $this->db->placehold(
			"SELECT
				b.id,
				b.name,
				b.name_h1,
				b.url,
				b.visible,
				b.meta_title,
				b.meta_keywords,
				b.meta_description,
				b.description,
				b.image,
				b.last_modified,
				$langSql->fields
			FROM __brands b
				$langSql->join
			WHERE
				$filter
			LIMIT 1"
		);

		$this->db->query($query);
		
		return $this->db->result();
	}

	/**
	 * Add Brand
	 */
	public function addBrand($brand)
	{
		$brand = (object) $brand;

		if (isset($brand->url)) {
			$brand->url = preg_replace("/[\s]+/ui", '', strtolower($brand->url));
			$brand->url = preg_replace("/[^0-9a-z]+/ui", '', $brand->url);
		}

		if (empty($brand->url)) {
			$brand->url = $this->translit($brand->name);
		}

		while ($this->getBrand((string)$brand->url)) {
			if (preg_match('/(.+)([0-9]+)$/', $brand->url, $parts)) {
				$brand->url = $parts[1] . '' . ($parts[2] + 1);
			} else {
				$brand->url = $brand->url . '2';
			}
		}

		$result = $this->languages->getDescription($brand, 'brand');

		if (!empty($result->data)) {
			$brand = $result->data;
		}

		$this->db->query("INSERT INTO __brands SET ?%", $brand);

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'brand');
		}

		return $id;
	}

	/**
	 * Update Brand
	 */
	public function updateBrand($id, $brand)
	{
		$brand = (object) $brand;

		$result = $this->languages->getDescription($brand, 'brand');

		if (!empty($result->data)) {
			$brand = $result->data;
		}

		$query = $this->db->placehold("UPDATE __brands SET last_modified=NOW(), ?% WHERE id=? LIMIT 1", $brand, (int) $id);
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'brand', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Delete Brand
	 */
	public function deleteBrand($id)
	{
		if (!empty($id)) {
			$this->deleteImage($id);

			$query = $this->db->placehold("DELETE FROM __brands WHERE id = ? LIMIT 1", $id);
			$this->db->query($query);

			$query = $this->db->placehold("UPDATE __products SET brand_id=NULL WHERE brand_id=?", $id);
			$this->db->query($query);

			$this->db->query("DELETE FROM __lang_brands WHERE brand_id=?", $id);
		}
	}

	/**
	 * Delete Image
	 */
	public function deleteImage($brandId)
	{
		$query = $this->db->placehold("SELECT image FROM __brands WHERE id=?", (int) $brandId);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('image');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __brands SET image = NULL WHERE id=?", $brandId);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) AS count FROM __brands WHERE image=? LIMIT 1", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					$resizedImages = glob($this->config->root_dir . $this->config->resized_brands_images_dir . $file . "*." . $ext);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								@unlink($f);
							}
						}
					}

					$resizedImages = glob($this->config->root_dir . $this->config->resized_brands_images_dir . $file . "*." . $webp);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								@unlink($f);
							}
						}
					}

					@unlink($this->config->root_dir . $this->config->brands_images_dir . $filename);
				}
			}
		}
	}

	/**
	 * Translit
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
