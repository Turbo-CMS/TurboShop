<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Variants extends Turbo
{
	/**
	 * The function returns product variants
	 * @param	$filter
	 * @retval	array
	 */
	public function get_variants($filter = array())
	{
		$product_id_filter = '';
		$variant_id_filter = '';
		$instock_filter = '';

		$currencies = $this->money->get_currencies();

		if (!empty($filter['product_id']))
			$product_id_filter = $this->db->placehold('AND v.product_id in(?@)', (array)$filter['product_id']);

		if (!empty($filter['id']))
			$variant_id_filter = $this->db->placehold('AND v.id in(?@)', (array)$filter['id']);

		if (!empty($filter['in_stock']) && $filter['in_stock'])
			$instock_filter = $this->db->placehold('AND (v.stock>0 OR v.stock IS NULL)');

		if (!$product_id_filter && !$variant_id_filter)
			return array();

		$lang_sql = $this->languages->get_query(array('object' => 'variant'));

		$query = $this->db->placehold("SELECT v.id, v.product_id, v.price, NULLIF(v.compare_price, 0) as compare_price, v.currency_id, v.sku, IFNULL(v.stock, ?) as stock, (v.stock IS NULL) as infinity, v.name, v.color, v.color_code, v.images_ids, v.weight, v.position, $lang_sql->fields
						FROM __variants AS v
						$lang_sql->join
						WHERE 
						1
						$product_id_filter          
						$variant_id_filter
						$instock_filter
						ORDER BY v.position       
						", $this->settings->max_order_amount);

		$this->db->query($query);

		$variants = $this->db->results();

		foreach ($variants as &$v) {
			$v->oprice = $v->price;
			$v->compare_oprice = $v->compare_price;
			// do the conversion to the base rate
			if ($v->currency_id > 0) {
				$v->price = $v->price * $currencies[$v->currency_id]->rate_to / $currencies[$v->currency_id]->rate_from;
				$v->compare_price = $v->compare_price * $currencies[$v->currency_id]->rate_to / $currencies[$v->currency_id]->rate_from;
			}
		}

		return $variants;
	}

	public function get_variant($id)
	{
		if (empty($id))
			return false;

		$lang_sql = $this->languages->get_query(array('object' => 'variant'));

		$currencies = $this->money->get_currencies();

		$query = $this->db->placehold("SELECT v.id, v.product_id , v.price, NULLIF(v.compare_price, 0) as compare_price, v.currency_id, v.sku, IFNULL(v.stock, ?) as stock, (v.stock IS NULL) as infinity, v.name, v.color, v.color_code, v.images_ids, v.weight, $lang_sql->fields
						FROM __variants v $lang_sql->join WHERE id=?
						LIMIT 1", $this->settings->max_order_amount, $id);

		$this->db->query($query);
		$variant = $this->db->result();

		$variant->oprice = $variant->price;
		$variant->compare_oprice = $variant->compare_price;
		// do the conversion to the base rate
		if ($variant->currency_id > 0) {
			$variant->price = $variant->price * $currencies[$variant->currency_id]->rate_to / $currencies[$variant->currency_id]->rate_from;
			$variant->compare_price = $variant->compare_price * $currencies[$variant->currency_id]->rate_to / $currencies[$variant->currency_id]->rate_from;
		}

		return $variant;
	}

	public function update_variant($id, $variant)
	{
		$variant = (object)$variant;

		$result = $this->languages->get_description($variant, 'variant');
		if (!empty($result->data)) $variant = $result->data;

		$v = (array)$variant;
		if (!empty($v)) {
			$query = $this->db->placehold("UPDATE __variants SET ?% WHERE id=? LIMIT 1", $variant, intval($id));
			$this->db->query($query);
		}

		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'variant', $this->languages->lang_id());
		}

		return $id;
	}

	public function add_variant($variant)
	{
		$variant = (object)$variant;

		$result = $this->languages->get_description($variant, 'variant');
		if (!empty($result->data)) $variant = $result->data;

		$query = $this->db->placehold("INSERT INTO __variants SET ?%", $variant);
		$this->db->query($query);
		$variant_id = $this->db->insert_id();

		if (!empty($result->description)) {
			$this->languages->action_description($variant_id, $result->description, 'variant');
		}

		return $variant_id;
	}

	public function delete_variant($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __variants WHERE id = ? LIMIT 1", intval($id));
			$this->db->query($query);
			$this->db->query('UPDATE __purchases SET variant_id=NULL WHERE variant_id=?', intval($id));
			$this->db->query("DELETE FROM __lang_variants WHERE variant_id = ?", intval($id));
		}
	}
}
