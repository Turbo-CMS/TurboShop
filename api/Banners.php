<?php

require_once 'Turbo.php';

class Banners extends Turbo
{
	/**
	 * Get banners images
	 */
	public function getBannersImages($filter = [])
	{
		$limit = 100;
		$page = 1;
		$bannerIdFilter = '';
		$bannersImagesIdFilter = '';
		$visibleFilter = '';
		$groupBy = '';
		$order = 'bi.position DESC';

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		if (!empty($filter['id'])) {
			$bannersImagesIdFilter = $this->db->placehold('AND bi.id iN(?@)', (array) $filter['id']);
		}

		if (!empty($filter['banner_id'])) {
			$bannerIdFilter = $this->db->placehold('AND bi.banner_id IN(?@)', (array) $filter['banner_id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND bi.visible=?', (int) $filter['visible']);
		}

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'position':
					$order = 'bi.position DESC';
					break;
				case 'name':
					$order = 'bi.name';
					break;
			}
		}

		$langSql = $this->languages->getQuery(['object' => 'banner_image', 'px' => 'bi']);

		$query = $this->db->placehold(
			"SELECT 
				bi.id, 
				bi.banner_id, 
				bi.image,
				bi.background,
				bi.name,
				bi.url,
				bi.color,
				bi.style,
				bi.button,
				bi.alt,
				bi.title,
				bi.description,
				bi.position, 
				bi.visible,
				$langSql->fields
			FROM __banners_images bi
			$langSql->join
			WHERE 
				1 
				$bannersImagesIdFilter
				$bannerIdFilter
				$visibleFilter
			$groupBy
			ORDER BY $order 
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
	 * Count banners images
	 */
	public function countBannersImages($filter = [])
	{
		$bannerIdFilter = '';
		$bannersImagesIdFilter = '';
		$visibleFilter = '';

		if (!empty($filter['banner_id'])) {
			$bannerIdFilter = $this->db->placehold('AND bi.banner_id IN(?@)', (array) $filter['banner_id']);
		}

		if (!empty($filter['id'])) {
			$bannersImagesIdFilter = $this->db->placehold('AND bi.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND bi.visible=?', (int) $filter['visible']);
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT bi.id) AS count
			 FROM __banners_images AS bi
			 WHERE 1 $bannerIdFilter $bannersImagesIdFilter $visibleFilter"
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
	 * GET banners image
	 */
	public function getBannersImage($id)
	{
		if (!is_int($id)) {
			return false;
		}

		$bannerIdFilter = $this->db->placehold('AND bi.id=?', (int) $id);

		$languageFields = $this->languages->getQuery(['object' => 'banner_image', 'px' => 'bi']);

		$query = $this->db->placehold(
			"SELECT bi.id,
					bi.banner_id,
					bi.image,
					bi.background,
					bi.name,
					bi.url,
					bi.color,
					bi.style,
					bi.button,
					bi.alt,
					bi.title,
					bi.description,
					bi.position,
					bi.visible,
					$languageFields->fields
			 FROM   __banners_images bi
				$languageFields->join
			 WHERE  1 
				$bannerIdFilter
			 LIMIT  1",
			$id
		);

		$this->db->query($query);
		$bannersImage = $this->db->result();

		return $bannersImage;
	}

	/**
	 * Add banners image
	 */
	public function addBannersImage($bannersImage)
	{
		$bannersImage = (object) $bannersImage;
		$result = $this->languages->getDescription($bannersImage, 'banner_image');

		if ($this->db->query('INSERT INTO __banners_images SET ?%', $bannersImage)) {
			$id = $this->db->insertId();
			$this->db->query('UPDATE __banners_images SET position=id WHERE id=?', $id);

			if (!empty($result->description)) {
				$this->languages->actionDescription($id, $result->description, 'banner_image');
			}

			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Update banners image
	 */
	public function updateBannersImage($id, $bannersImage)
	{
		$bannersImage = (object) $bannersImage;
		$result = $this->languages->getDescription($bannersImage, 'banner_image');

		$query = $this->db->placehold("UPDATE __banners_images SET ?% WHERE id IN(?@) LIMIT ?", $bannersImage, (array) $id, count((array) $id));

		if ($this->db->query($query)) {
			if (!empty($result->description)) {
				$this->languages->actionDescription($id, $result->description, 'banner_image', $this->languages->langId());
			}

			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Delete banners image
	 */
	public function deleteBannersImage($id)
	{
		if (!empty($id)) {
			$this->deleteImage($id);
			$this->deleteBackground($id);
			$query = $this->db->placehold("DELETE FROM __banners_images WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				$this->db->query("DELETE FROM __lang_banners_images WHERE banner_image_id=?", (int) $id);
				return true;
			}
		}

		return false;
	}

	/**
	 * Delete image
	 */
	public function deleteImage($id)
	{
		$query = $this->db->placehold("SELECT image FROM __banners_images WHERE id=?", (int) $id);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('image');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __banners_images SET image=NULL WHERE id=?", $id);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) AS count FROM __banners_images WHERE image=? LIMIT 1", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					$resizedImages = glob($this->config->root_dir . $this->config->resized_banners_images_dir . $file . "*." . $ext);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					$resizedImages = glob($this->config->root_dir . $this->config->resized_banners_images_dir . $file . "*." . $webp);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					unlink($this->config->root_dir . $this->config->banners_images_dir . $filename);
				}
			}
		}
	}

	/**
	 * Delete background
	 */
	public function deleteBackground($id)
	{
		$query = $this->db->placehold("SELECT background FROM __banners_images WHERE id=?", (int) $id);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('background');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __banners_images SET background=NULL WHERE id=?", $id);

			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT count(*) AS count FROM __banners_images WHERE background=? LIMIT 1", $filename);

				$this->db->query($query);
				$count = $this->db->result('count');

				if ($count == 0) {
					$file = pathinfo($filename, PATHINFO_FILENAME);
					$ext = pathinfo($filename, PATHINFO_EXTENSION);
					$webp = 'webp';

					$resizedImages = glob($this->config->root_dir . $this->config->resized_banners_images_dir . $file . "*." . $ext);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					$resizedImages = glob($this->config->root_dir . $this->config->resized_banners_images_dir . $file . "*." . $webp);

					if (is_array($resizedImages)) {
						foreach ($resizedImages as $f) {
							if (is_file($f)) {
								unlink($f);
							}
						}
					}

					unlink($this->config->root_dir . $this->config->banners_images_dir . $filename);
				}
			}
		}
	}

	/**
	 * Get banners
	 */
	public function getBanners($filter = [])
	{
		$visibleFilter = '';
		$banners = [];

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND visible = ?', (int) $filter['visible']);
		}

		$query = $this->db->placehold("SELECT * FROM __banners WHERE 1 $visibleFilter ORDER BY position");
		$this->db->query($query);

		foreach ($this->db->results() as $banner) {
			$banners[$banner->id] = $banner;
		}

		return $banners;
	}

	/**
	 * Get banner
	 */
	public function getBanner($id, $visible = false, $showFilterArray = [])
	{
		if (empty($id)) {
			return false;
		}

		$isVisible = '';
		$showFilter = '';
		$bannerIdFilter = '';

		if ($visible) {
			$isVisible = 'AND visible=1';
		}

		if (is_int($id)) {
			$bannerIdFilter = $this->db->placehold('AND id=? ', (int) $id);
		} else {
			$bannerIdFilter = $this->db->placehold('AND group_id=? ', $id);
		}

		if (!empty($showFilterArray)) {
			foreach ($showFilterArray as $k => $sfa) {
				if (empty($sfa)) {
					unset($showFilterArray[$k]);
					continue;
				}

				$showFilterArray[$k] = $this->db->placehold($k . " regexp '[[:<:]](?)[[:>:]]'", (int) $showFilterArray[$k]);
			}

			$showFilterArray[] = "show_all_pages=1";
			$showFilter = 'AND (' . implode(' OR ', $showFilterArray) . ')';
		}

		$query = $this->db->placehold("SELECT * FROM __banners WHERE 1 $bannerIdFilter $isVisible $showFilter LIMIT 1");
		$this->db->query($query);
		$banner = $this->db->result();

		return $banner;
	}

	/**
	 * Updates banner
	 */
	public function updateBanner($id, $banner)
	{
		$query = $this->db->placehold("UPDATE __banners SET ?% WHERE id IN (?@) LIMIT ?", $banner, (array) $id, count((array) $id));
		if ($this->db->query($query)) {
			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Adds a banner.
	 */
	public function addBanner($banner)
	{
		$banner = (array) $banner;

		if ($this->db->query("INSERT INTO __banners SET ?%", $banner)) {
			$id = $this->db->insertId();
			$this->db->query("UPDATE __banners SET position=id WHERE id=?", $id);

			return $id;
		} else {
			return false;
		}
	}

	/**
	 * Delete banner
	 */
	public function deleteBanner($id)
	{
		if (!empty($id)) {
			$this->db->query('SELECT id FROM __banners_images WHERE banner_id=?', (int) $id);
			$bannersImageIds = $this->db->results('id');

			if (!empty($bannersImageIds)) {
				foreach ($bannersImageIds as $biId) {
					$this->deleteBannersImage($biId);
				}
			}

			$query = $this->db->placehold('DELETE FROM __banners WHERE id=? LIMIT 1', (int) $id);

			if ($this->db->query($query)) {
				return true;
			}
		}

		return false;
	}
}
