<?php

require_once 'Turbo.php';

class Delivery extends Turbo
{
	/**
	 * Get delivery
	 */
	public function getDelivery($id)
	{
		$langSql = $this->languages->getQuery(['object' => 'delivery']);

		$query = $this->db->placehold(
			"SELECT d.id,
					d.name,
					d.description,
					d.free_from,
					d.price,
					d.enabled,
					d.position,
					d.separate_payment,
					$langSql->fields 
			 FROM __delivery d
			 $langSql->join
			 WHERE id=? 
			 LIMIT 1",
			(int) $id
		);

		$this->db->query($query);
		return $this->db->result();
	}

	/**
	 * Get deliveries
	 */
	public function getDeliveries($filter = [])
	{
		$enabledFilter = '';

		if (!empty($filter['enabled'])) {
			$enabledFilter = $this->db->placehold('AND enabled=?', (int) $filter['enabled']);
		}

		$langSql = $this->languages->getQuery(['object' => 'delivery']);

		$query = $this->db->placehold(
			"SELECT
                d.id,
                d.name,
                d.description,
                d.free_from,
                d.price,
                d.enabled,
                d.position,
                d.separate_payment,
                $langSql->fields
            FROM
                __delivery d
                $langSql->join
            WHERE
                1
                $enabledFilter
            ORDER BY
                position"
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Updates delivery 
	 */
	public function updateDelivery($id, $delivery)
	{
		$delivery = (object) $delivery;
		$result = $this->languages->getDescription($delivery, 'delivery');

		$query = $this->db->placehold("UPDATE __delivery SET ?% WHERE id IN(?@)", $delivery, (array) $id);
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'delivery', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Add delivery
	 */
	public function addDelivery($delivery)
	{
		$delivery = (object) $delivery;
		$result = $this->languages->getDescription($delivery, 'delivery');

		$query = $this->db->placehold('INSERT INTO __delivery SET ?%', $delivery);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'delivery');
		}

		$this->db->query("UPDATE __delivery SET position=id WHERE id=?", (int) $id);

		return $id;
	}

	/**
	 * Deletes delivery 
	 */
	public function deleteDelivery($id)
	{
		$query = $this->db->placehold("SELECT payment_method_id FROM __delivery_payment WHERE delivery_id=?", (int) $id);
		$this->db->query($query);

		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __delivery WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);
			$this->db->query("DELETE FROM __lang_delivery WHERE delivery_id=?", (int) $id);
		}
	}

	/**
	 * Get delivery payments
	 */
	public function getDeliveryPayments($id)
	{
		$query = $this->db->placehold("SELECT payment_method_id FROM __delivery_payment WHERE delivery_id=?", (int) $id);
		$this->db->query($query);

		return $this->db->results('payment_method_id');
	}

	/**
	 * Update delivery payments
	 */
	public function updateDeliveryPayments($id, $paymentMethodsIds)
	{
		$query = $this->db->placehold("DELETE FROM __delivery_payment WHERE delivery_id=?", (int) $id);
		$this->db->query($query);

		if (is_array($paymentMethodsIds)) {
			foreach ($paymentMethodsIds as $pId) {
				$this->db->query("INSERT INTO __delivery_payment SET delivery_id=?, payment_method_id=?", $id, $pId);
			}
		}
	}
}
