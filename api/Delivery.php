<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Delivery extends Turbo
{

	public function get_delivery($id)
	{

		$lang_sql = $this->languages->get_query(array('object' => 'delivery'));

		$query = $this->db->placehold("SELECT d.id, d.name, d.description, d.free_from, d.price, d.enabled, d.position, d.separate_payment, $lang_sql->fields FROM __delivery d $lang_sql->join WHERE id=? LIMIT 1", intval($id));

		$this->db->query($query);
		return $this->db->result();
	}

	public function get_deliveries($filter = array())
	{
		// Default
		$enabled_filter = '';

		if (!empty($filter['enabled']))
			$enabled_filter = $this->db->placehold('AND enabled=?', intval($filter['enabled']));

		$lang_sql = $this->languages->get_query(array('object' => 'delivery'));

		$query = "SELECT d.id, d.name, d.description, d.free_from, d.price, d.enabled, d.position, d.separate_payment, $lang_sql->fields
					FROM __delivery d $lang_sql->join WHERE 1 $enabled_filter ORDER BY position";

		$this->db->query($query);

		return $this->db->results();
	}

	public function update_delivery($id, $delivery)
	{
		$delivery = (object)$delivery;
		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($delivery, 'delivery');

		$query = $this->db->placehold("UPDATE __delivery SET ?% WHERE id in(?@)", $delivery, (array)$id);
		$this->db->query($query);

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'delivery', $this->languages->lang_id());
		}
		return $id;
	}

	public function add_delivery($delivery)
	{
		$delivery = (object)$delivery;
		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($delivery, 'delivery');

		$query = $this->db->placehold('INSERT INTO __delivery SET ?%', $delivery);
		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insert_id();

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'delivery');
		}

		$this->db->query("UPDATE __delivery SET position=id WHERE id=?", intval($id));
		return $id;
	}

	public function delete_delivery($id)
	{
		// Remove shipping link with payment method
		$query = $this->db->placehold("SELECT payment_method_id FROM __delivery_payment WHERE delivery_id=?", intval($id));
		$this->db->query($query);

		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __delivery WHERE id=? LIMIT 1", intval($id));
			$this->db->query($query);
			$this->db->query("DELETE FROM __lang_delivery WHERE delivery_id=?", intval($id));
		}
	}

	public function get_delivery_payments($id)
	{
		$query = $this->db->placehold("SELECT payment_method_id FROM __delivery_payment WHERE delivery_id=?", intval($id));
		$this->db->query($query);
		return $this->db->results('payment_method_id');
	}

	public function update_delivery_payments($id, $payment_methods_ids)
	{
		$query = $this->db->placehold("DELETE FROM __delivery_payment WHERE delivery_id=?", intval($id));
		$this->db->query($query);
		if (is_array($payment_methods_ids))
			foreach ($payment_methods_ids as $p_id)
				$this->db->query("INSERT INTO __delivery_payment SET delivery_id=?, payment_method_id=?", $id, $p_id);
	}
}
