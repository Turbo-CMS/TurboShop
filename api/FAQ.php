<?php

require_once 'Turbo.php';

class FAQ extends Turbo
{
	/**
	 * Get FAQ 
	 */
	public function getFaq($id)
	{
		if (is_int($id)) {
			$where = $this->db->placehold('WHERE f.id=?', (int) $id);
		}

		$langSql = $this->languages->getQuery(['object' => 'faq']);

		$query = $this->db->placehold(
			"SELECT
				f.id,
				f.name,
				f.answer,
				f.visible,
				f.position,
				f.last_modified,
				$langSql->fields
			FROM __faq f
				$langSql->join
			$where
			LIMIT 1"
		);

		if ($this->db->query($query)) {
			return $this->db->result();
		} else {
			return false;
		}
	}

	/**
	 * Get FAQs
	 */
	public function getFaqs($filter = [])
	{
		$limit = 1000;
		$page = 1;
		$faqIdFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';
		$order = 'f.position DESC';

		$langId = $this->languages->langId();
		$px = ($langId ? 'l' : 'f');

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (!empty($filter['id'])) {
			$faqIdFilter = $this->db->placehold('AND f.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND f.visible=?', (int) $filter['visible']);
		}

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'position':
					$order = 'f.position DESC';
					break;
			}
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (' . $px . '.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$langSql = $this->languages->getQuery(['object' => 'faq',]);

		$query = $this->db->placehold(
			"SELECT 
				f.id, 
				f.name, 
				f.answer,
				f.visible,
				f.position,
				f.last_modified,
				$langSql->fields
			FROM 
				__faq f
				$langSql->join
			WHERE 
				1 
				$faqIdFilter 
				$visibleFilter
				$keywordFilter
			ORDER BY 
				$order
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
	 * Count FAQs
	 */
	public function countFaqs($filter = [])
	{
		$faqIdFilter = '';
		$visibleFilter = '';
		$keywordFilter = '';

		if (!empty($filter['id'])) {
			$faqIdFilter = $this->db->placehold('AND f.id IN(?@)', (array) $filter['id']);
		}

		if (isset($filter['visible'])) {
			$visibleFilter = $this->db->placehold('AND f.visible = ?', (int) $filter['visible']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (f.name LIKE "%' . $this->db->escape(trim($keyword)) . '%") ');
			}
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT f.id) AS count 
          	FROM __faq f 
          	WHERE 1 $faqIdFilter $visibleFilter $keywordFilter"
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
	 * Add FAQ
	 */
	public function addFaq($faq)
	{
		$faq = (object) $faq;
		$result = $this->languages->getDescription($faq, 'faq');

		if (!empty($result->data)) {
			$faq = $result->data;
		}

		$this->settings->lastModifyFAQ = date("Y-m-d H:i:s");
		$query = $this->db->placehold('INSERT INTO __faq SET ?%', $faq);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'faq');
		}

		$this->db->query("UPDATE __faq SET position=id WHERE id=?", $id);

		return $id;
	}

	/**
	 * Update FAQ
	 */
	public function updateFaq($id, $faq)
	{
		$faq = (object) $faq;
		$result = $this->languages->getDescription($faq, 'faq');

		if (!empty($result->data)) {
			$faq = $result->data;
		}

		$this->settings->lastModifyFAQ = date("Y-m-d H:i:s");
		$query = $this->db->placehold("UPDATE __faq SET `last_modified`=NOW(), ?% WHERE id IN(?@) LIMIT ?", $faq, (array) $id, count((array) $id));
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'faq', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Delete FAQ
	 */
	public function deleteFaq($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __faq WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				$this->db->query("DELETE FROM __lang_faq WHERE faq_id=?", (int) $id);

				if ($this->db->query($query)) {
					return true;
				}
			}
		}

		return false;
	}
}
