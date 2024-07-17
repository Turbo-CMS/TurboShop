<?php

require_once 'Turbo.php';

class Variants extends Turbo
{
	/**
	 * Get Variants
	 */
	public function getVariants($filter = [])
	{
		$productIdFilter = '';
		$variantIdFilter = '';
		$instockFilter = '';

		$currencies = $this->money->getCurrencies();

		if (!empty($filter['product_id'])) {
			$productIdFilter = $this->db->placehold('AND v.product_id IN(?@)', (array) $filter['product_id']);
		}

		if (!empty($filter['id'])) {
			$variantIdFilter = $this->db->placehold('AND v.id IN(?@)', (array) $filter['id']);
		}

		if (!empty($filter['in_stock']) && $filter['in_stock']) {
			$instockFilter = $this->db->placehold('AND (v.stock > 0 OR v.stock IS NULL)');
		}

		if (!$productIdFilter && !$variantIdFilter) {
			return [];
		}

		$langSql = $this->languages->getQuery(['object' => 'variant']);

		$query = $this->db->placehold(
			"SELECT
                v.id,
                v.product_id,
                v.price,
                NULLIF(v.compare_price, 0) AS compare_price,
                v.currency_id,
                v.sku,
                IFNULL(v.stock, ?) AS stock,
                (v.stock IS NULL) AS infinity,
                v.name,
                v.color,
                v.color_code,
                v.weight,
                v.position,
                v.attachment,
                v.attachment_url,
                $langSql->fields
            FROM __variants AS v
                $langSql->join
            WHERE 1
                $productIdFilter          
                $variantIdFilter
                $instockFilter
            ORDER BY 
                v.position",
			$this->settings->max_order_amount
		);

		$this->db->query($query);

		$variants = $this->db->results();

		foreach ($variants as &$v) {
			$v->oprice = $v->price;
			$v->compare_oprice = $v->compare_price;

			if ($v->currency_id > 0) {
				$v->price = $v->price * $currencies[$v->currency_id]->rate_to / $currencies[$v->currency_id]->rate_from;
				$v->compare_price = $v->compare_price * $currencies[$v->currency_id]->rate_to / $currencies[$v->currency_id]->rate_from;
			}
		}

		return $variants;
	}

	/**
	 * Get Variant
	 */
	public function getVariant($id)
	{
		if (empty($id)) {
			return false;
		}

		$langSql = $this->languages->getQuery(['object' => 'variant']);
		$currencies = $this->money->getCurrencies();

		$query = $this->db->placehold(
			"SELECT 
                v.id,
                v.product_id,
                v.price,
                NULLIF(v.compare_price, 0) AS compare_price,
                v.currency_id,
                v.sku,
                IFNULL(v.stock, ?) AS stock,
                (v.stock IS NULL) AS infinity,
                v.name,
                v.color,
                v.color_code,
                v.weight,
                v.attachment,
                v.attachment_url,
                $langSql->fields
            FROM __variants v 
                $langSql->join 
            WHERE id=? 
            LIMIT 1",
			$this->settings->max_order_amount,
			$id
		);

		$this->db->query($query);

		$variant = $this->db->result();

		$variant->oprice = $variant->price;
		$variant->compare_oprice = $variant->compare_price;

		if ($variant->currency_id > 0) {
			$variant->price = $variant->price * $currencies[$variant->currency_id]->rate_to / $currencies[$variant->currency_id]->rate_from;
			$variant->compare_price = $variant->compare_price * $currencies[$variant->currency_id]->rate_to / $currencies[$variant->currency_id]->rate_from;
		}

		return $variant;
	}

	/**
	 * Update Variant
	 */
	public function updateVariant($id, $variant)
	{
		$variant = (object) $variant;

		$result = $this->languages->getDescription($variant, 'variant');

		if (!empty($result->data)) {
			$variant = $result->data;
		}

		$updatedVariant = (array) $variant;

		if (!empty($updatedVariant)) {
			$query = $this->db->placehold("UPDATE __variants SET ?% WHERE id=? LIMIT 1", $variant, (int) $id);
			$this->db->query($query);
		}

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'variant', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Add Variant
	 */
	public function addVariant($variant)
	{
		$variant = (object) $variant;

		$result = $this->languages->getDescription($variant, 'variant');

		if (!empty($result->data)) {
			$variant = $result->data;
		}

		$query = $this->db->placehold("INSERT INTO __variants SET ?%", $variant);
		$this->db->query($query);

		$variantId = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($variantId, $result->description, 'variant');
		}

		return $variantId;
	}

	/**
	 * Delete Variant
	 */
	public function deleteVariant($id)
	{
		if (!empty($id)) {
			$this->deleteAttachment($id);

			$query = $this->db->placehold("DELETE FROM __variants WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);

			$this->db->query("UPDATE __purchases SET variant_id=NULL WHERE variant_id=?", (int) $id);

			$this->db->query("DELETE FROM __lang_variants WHERE variant_id=?", (int) $id);
		}
	}

	/**
	 * Delete Attachment
	 */
	public function deleteAttachment($id)
	{
		$query = $this->db->placehold("SELECT attachment FROM __variants WHERE id=?", $id);
		$this->db->query($query);

		$filename = $this->db->result('attachment');

		$query = $this->db->placehold("SELECT 1 FROM __variants WHERE attachment=? AND id!=?", $filename, $id);
		$this->db->query($query);

		$exists = $this->db->numRows();

		if (!empty($filename) && $exists == 0) {
			@unlink($this->config->root_dir . '/' . $this->config->downloads_dir . $filename);
			$this->updateVariant($id, ['attachment' => null]);
		}
	}
}
