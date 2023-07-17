<?php

require_once 'Turbo.php';

class Orders extends Turbo
{
	/**
	 * Get order
	 */
	public function getOrder($id)
	{
		if (is_int($id)) {
			$where = $this->db->placehold('WHERE o.id=?', (int) $id);
		} else {
			$where = $this->db->placehold('WHERE o.url=?', $id);
		}

		$query = $this->db->placehold(
			"SELECT 
				o.id, 
				o.delivery_id, 
				o.delivery_price, 
				o.separate_delivery,
				o.payment_method_id, 
				o.paid, 
				o.payment_date, 
				o.closed, 
				o.discount, 
				o.coupon_code, 
				o.coupon_discount, 
				o.weight,
				o.date, 
				o.user_id, 
				o.name, 
				o.address, 
				o.phone, 
				o.email, 
				o.comment, 
				o.status,
				o.url, 
				o.total_price, 
				o.note, 
				o.ip, 
				o.lang_id
			FROM 
				__orders o 
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
	 * Get orders
	 */
	function getOrders($filter = [])
	{
		$limit = 100;
		$page = 1;
		$keywordFilter = '';
		$labelFilter = '';
		$statusFilter = '';
		$userFilter = '';
		$modifiedSinceFilter = '';
		$idFilter = '';
		$dateFilter = '';

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}
		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		if (isset($filter['status'])) {
			$statusFilter = $this->db->placehold('AND o.status = ?', (int) $filter['status']);
		}

		if (isset($filter['id'])) {
			$idFilter = $this->db->placehold('AND o.id ШТ(?@)', (array) $filter['id']);
		}

		if (isset($filter['user_id'])) {
			$userFilter = $this->db->placehold('AND o.user_id=?', (int) $filter['user_id']);
		}

		if (isset($filter['modified_since'])) {
			$modifiedSinceFilter = $this->db->placehold('AND o.modified>?', $filter['modified_since']);
		}

		if (isset($filter['label'])) {
			$labelFilter = $this->db->placehold('AND ol.label_id=?', $filter['label']);
		}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (o.id = "' . $this->db->escape(trim($keyword)) . '" OR o.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR REPLACE(o.phone, "-", "")  LIKE "%' . $this->db->escape(str_replace('-', '', trim($keyword))) . '%" OR o.address LIKE "%' . $this->db->escape(trim($keyword)) . '%" )');
			}
		}

		if (!empty($filter['from_date']) || !empty($filter['to_date'])) {
			$from = !empty($filter['from_date']) ? date('Y-m-d', strtotime($filter['from_date'])) : '1970-01-01';
			$to = !empty($filter['to_date']) ? date('Y-m-d', strtotime($filter['to_date'])) : date('Y-m-d');
			$dateFilter = $this->db->placehold('AND (o.date BETWEEN ? AND ?)', $from, $to);
		}

		$query = $this->db->placehold(
			"SELECT 
				o.id,
				o.delivery_id,
				o.delivery_price,
				o.separate_delivery,
				o.payment_method_id,
				o.paid,
				o.payment_date,
				o.closed,
				o.discount,
				o.coupon_code,
				o.coupon_discount,
				o.weight,
				o.date,
				o.user_id,
				o.name,
				o.address,
				o.phone,
				o.email,
				o.comment,
				o.status,
				o.url,
				o.total_price,
				o.note,
				o.lang_id
			 FROM 
				__orders AS o
			 LEFT JOIN 
				__orders_labels AS ol ON o.id=ol.order_id 
			 WHERE
				1
				$idFilter 
				$statusFilter 
				$userFilter 
				$keywordFilter 
				$labelFilter 
				$dateFilter 
				$modifiedSinceFilter 
			 GROUP BY
				o.id
			 ORDER BY
				status, id DESC 
				$sqlLimit",
			"%Y-%m-%d"
		);

		$this->db->query($query);
		$orders = [];
		foreach ($this->db->results() as $order) {
			$orders[$order->id] = $order;
		}

		return $orders;
	}

	/**
	 * Count orders
	 */
	public function countOrders($filter = [])
	{
		$keywordFilter = '';
		$labelFilter = '';
		$statusFilter = '';
		$userFilter = '';
		$dateFilter = '';

		if (isset($filter['status'])) {
			$statusFilter = $this->db->placehold('AND o.status=?', (int) $filter['status']);
		}

		if (isset($filter['user_id'])) {
			$userFilter = $this->db->placehold('AND o.user_id=?', (int) $filter['user_id']);
		}

		if (isset($filter['label'])) {
			$labelFilter = $this->db->placehold('AND ol.label_id=?', $filter['label']);
		}

		if (!empty($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (o.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR REPLACE(o.phone, "-", "")  LIKE "%' . $this->db->escape(str_replace('-', '', trim($keyword))) . '%" OR o.address LIKE "%' . $this->db->escape(trim($keyword)) . '%" )');
			}
		}

		if (!empty($filter['from_date']) || !empty($filter['to_date'])) {
			$from = !empty($filter['from_date']) ? date('Y-m-d', strtotime($filter['from_date'])) : '1970-01-01';
			$to = !empty($filter['to_date']) ? date('Y-m-d', strtotime($filter['to_date'])) : date('Y-m-d');
			$dateFilter = $this->db->placehold('AND (o.date BETWEEN ? AND ?)', $from, $to);
		}

		$query = $this->db->placehold(
			"SELECT COUNT(DISTINCT id) as count 
			FROM __orders AS o
			LEFT JOIN __orders_labels AS ol ON o.id = ol.order_id
			WHERE 1
				$statusFilter
				$userFilter
				$labelFilter
				$dateFilter
				$keywordFilter"
		);

		$this->db->query($query);
		return $this->db->result('count');
	}

	/**
	 * Update order
	 */
	public function updateOrder($id, $order)
	{
		$query = $this->db->placehold("UPDATE __orders SET ?%, modified=now() WHERE id=? LIMIT 1", $order, (int) $id);
		$this->db->query($query);
		$this->updateTotalPrice((int) $id);
		return $id;
	}

	/**
	 * Delete order
	 */
	public function deleteOrder($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __purchases WHERE order_id=?", $id);
			$this->db->query($query);

			$query = $this->db->placehold("DELETE FROM __orders_labels WHERE order_id=?", $id);
			$this->db->query($query);

			$query = $this->db->placehold("DELETE FROM __orders WHERE id=? LIMIT 1", $id);
			$this->db->query($query);
		}
	}

	/**
	 * Add order
	 */
	public function addOrder($order)
	{
		$order = (object) $order;

		$order->url = md5(uniqid($this->config->salt, true));

		$setCurrDate = '';
		if (empty($order->date)) {
			$setCurrDate = ', date=now()';
		}

		$query = $this->db->placehold("INSERT INTO __orders SET ?%$setCurrDate", $order);
		$this->db->query($query);

		return $this->db->insertId();
	}

	/**
	 * Get label
	 */
	public function getLabel($id)
	{
		$query = $this->db->placehold("SELECT * FROM __labels WHERE id=? LIMIT 1", (int) $id);
		$this->db->query($query);
		return $this->db->result();
	}

	/**
	 * Get labels
	 */
	public function getLabels()
	{
		$query = $this->db->placehold("SELECT * FROM __labels ORDER BY position");
		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Add label
	 */
	public function addLabel($label)
	{
		$query = $this->db->placehold('INSERT INTO __labels SET ?%', $label);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();
		$this->db->query("UPDATE __labels SET position=id WHERE id=?", $id);

		return $id;
	}

	/**
	 * Update Label
	 */
	public function updateLabel($id, $label)
	{
		$query = $this->db->placehold("UPDATE __labels SET ?% WHERE id in(?@) LIMIT ?", $label, (array) $id, count((array) $id));
		$this->db->query($query);

		return $id;
	}

	/**
	 * Delete label
	 */
	public function deleteLabel($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __orders_labels WHERE label_id=?", (int) $id);
			if ($this->db->query($query)) {
				$query = $this->db->placehold("DELETE FROM __labels WHERE id=? LIMIT 1", (int) $id);
				return $this->db->query($query);
			} else {
				return false;
			}
		}
	}

	/**
	 * Get order labels
	 */
	function getOrderLabels($orderIds = [])
	{
		if (empty($orderIds)) {
			return [];
		}

		$labelIdFilter = $this->db->placehold('AND order_id IN(?@)', (array) $orderIds);

		$query = $this->db->placehold(
			"SELECT
				ol.order_id,
				l.id,
				l.name,
				l.color,
				l.position
			FROM
				__labels l
				LEFT JOIN __orders_labels ol ON ol.label_id=l.id
			WHERE
				1
				$labelIdFilter   
			ORDER BY
				l.position"
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Update order labels
	 */
	public function updateOrderLabels($id, $labelsIds)
	{
		$labelsIds = (array) $labelsIds;

		$query = $this->db->placehold("DELETE FROM __orders_labels WHERE order_id=?", (int) $id);
		$this->db->query($query);

		if (is_array($labelsIds)) {
			foreach ($labelsIds as $labelId) {
				$this->db->query("INSERT INTO __orders_labels SET order_id=?, label_id=?", $id, $labelId);
			}
		}
	}

	/**
	 * Add order labels
	 */
	public function addOrderLabels($id, $labelsIds)
	{
		$labelsIds = (array)$labelsIds;

		if (is_array($labelsIds)) {
			foreach ($labelsIds as $labelId) {
				$this->db->query("INSERT IGNORE INTO __orders_labels SET order_id=?, label_id=?", $id, $labelId);
			}
		}
	}

	/**
	 * Delete order
	 */
	public function deleteOrderLabels($id, $labelsIds)
	{
		$labelsIds = (array)$labelsIds;

		if (is_array($labelsIds)) {
			foreach ($labelsIds as $labelId) {
				$this->db->query("DELETE FROM __orders_labels WHERE order_id=? AND label_id=?", $id, $labelId);
			}
		}
	}

	/**
	 * Get purchase
	 */
	public function getPurchase($id)
	{
		$query = $this->db->placehold("SELECT * FROM __purchases WHERE id=? LIMIT 1", (int) $id);
		$this->db->query($query);

		return $this->db->result();
	}

	/**
	 * Get purchases
	 */
	public function getPurchases($filter = [])
	{
		$orderIdFilter = '';

		if (!empty($filter['order_id'])) {
			$orderIdFilter = $this->db->placehold('AND order_id IN(?@)', (array) $filter['order_id']);
		}

		$query = $this->db->placehold("SELECT * FROM __purchases WHERE 1 $orderIdFilter ORDER BY id");
		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Update purchase
	 */
	public function updatePurchase($id, $purchase)
	{
		$purchase = (object) $purchase;
		$oldPurchase = $this->getPurchase($id);

		if (!$oldPurchase) {
			return false;
		}

		$order = $this->getOrder((int) $oldPurchase->order_id);
		$order = (object) $order;

		if (!$order) {
			return false;
		}

		$variant = $this->variants->getVariant($purchase->variant_id);

		if ($order->closed && !empty($purchase->amount) && !empty($variant) && !$variant->infinity && $variant->stock < ($purchase->amount - $oldPurchase->amount)) {
			return false;
		}

		if ($order->closed && !empty($purchase->amount)) {
			if ($oldPurchase->variant_id != $purchase->variant_id) {
				if (!empty($oldPurchase->variant_id)) {
					$query = $this->db->placehold("UPDATE __variants SET stock=stock+? WHERE id=? AND stock IS NOT NULL LIMIT 1", $oldPurchase->amount, $oldPurchase->variant_id);
					$this->db->query($query);
				}

				if (!empty($purchase->variant_id)) {
					$query = $this->db->placehold("UPDATE __variants SET stock=stock-? WHERE id=? AND stock IS NOT NULL LIMIT 1", $purchase->amount, $purchase->variant_id);
					$this->db->query($query);
				}
			} elseif (!empty($purchase->variant_id)) {
				$query = $this->db->placehold("UPDATE __variants SET stock=stock+(?) WHERE id=? AND stock IS NOT NULL LIMIT 1", $oldPurchase->amount - $purchase->amount, $purchase->variant_id);
				$this->db->query($query);
			}
		}

		$query = $this->db->placehold("UPDATE __purchases SET ?% WHERE id=? LIMIT 1", $purchase, (int) $id);
		$this->db->query($query);

		$this->updateTotalPrice($order->id);

		return $id;
	}

	/**
	 * Add purchase
	 */
	public function addPurchase($purchase)
	{
		$purchase = (object) $purchase;

		if (!empty($purchase->variant_id)) {
			$variant = $this->variants->getVariant($purchase->variant_id);

			if (empty($variant)) {
				return false;
			}

			$product = $this->products->getProduct((int) $variant->product_id);

			if (empty($product)) {
				return false;
			}
		}

		$order = $this->getOrder((int) $purchase->order_id);
		$order = (object) $order;

		if (empty($order)) {
			return false;
		}

		if ($order->closed && !empty($purchase->amount) && !$variant->infinity && $variant->stock < $purchase->amount) {
			return false;
		}

		if (!isset($purchase->amount)) {
			$purchase->amount = 1;
		}

		if (!isset($purchase->product_id) && isset($variant)) {
			$purchase->product_id = $variant->product_id;
		}

		if (!isset($purchase->product_name) && !empty($product)) {
			$purchase->product_name = $product->name;
		}

		if (!isset($purchase->sku) && !empty($variant)) {
			$purchase->sku = $variant->sku;
		}

		if (!isset($purchase->variant_name) && !empty($variant)) {
			$purchase->variant_name = $variant->name;
		}

		if (!isset($purchase->variant_color) && !empty($variant)) {
			$purchase->variant_color = $variant->color;
		}

		if (!isset($purchase->price) && !empty($variant)) {
			$purchase->price = $variant->price;
		}

		if ($order->closed && !empty($purchase->amount) && !empty($variant->id)) {
			$stockDiff = $purchase->amount;
			$query = $this->db->placehold("UPDATE __variants SET stock=stock-? WHERE id=? AND stock IS NOT NULL LIMIT 1", $stockDiff, $variant->id);
			$this->db->query($query);
		}

		$query = $this->db->placehold("INSERT INTO __purchases SET ?%", $purchase);
		$this->db->query($query);

		$purchaseId = $this->db->insertId();
		$this->updateTotalPrice($order->id);

		return $purchaseId;
	}

	/**
	 * Delete purchase
	 */
	public function deletePurchase($id)
	{
		$purchase = $this->getPurchase($id);

		if (!$purchase) {
			return false;
		}

		$order = $this->getOrder($purchase->order_id);
		$order = (object) $order;

		if (!$order) {
			return false;
		}

		if ($order->closed && $purchase->amount > 0) {
			$stockDiff = $purchase->amount;

			$query = $this->db->placehold("UPDATE __variants SET stock=stock+? WHERE id=? AND stock IS NOT NULL LIMIT 1", $stockDiff, $purchase->variant_id);

			if (!$this->db->query($query)) {
				return false;
			}
		}

		$query = $this->db->placehold("DELETE FROM __purchases WHERE id=? LIMIT 1", (int) $id);

		if (!$this->db->query($query)) {
			return false;
		}

		$this->updateTotalPrice($order->id);

		return true;
	}

	/**
	 * Close
	 */
	public function close($orderId)
	{
		$order = $this->getOrder($orderId);

		$order = (object) $order;

		if (empty($order)) {
			return false;
		}

		if (!$order->closed) {

			$variantsAmounts = array();

			$purchases = $this->getPurchases(array('order_id' => $order->id));

			foreach ($purchases as $purchase) {
				if (isset($variantsAmounts[$purchase->variant_id])) {
					$variantsAmounts[$purchase->variant_id] += $purchase->amount;
				} else {
					$variantsAmounts[$purchase->variant_id] = $purchase->amount;
				}
			}

			foreach ($variantsAmounts as $id => $amount) {
				$variant = $this->variants->getVariant($id);
				if (empty($variant) || ($variant->stock < $amount)) {
					return false;
				}
			}

			foreach ($purchases as $purchase) {
				$variant = $this->variants->getVariant($purchase->variant_id);
				if (!$variant->infinity) {
					$newStock = $variant->stock - $purchase->amount;
					$this->variants->updateVariant($variant->id, array('stock' => $newStock));
				}
			}

			$query = $this->db->placehold("UPDATE __orders SET closed=1, modified=NOW() WHERE id=? LIMIT 1", $order->id);
			$this->db->query($query);
		}

		return $order->id;
	}

	/**
	 * Open
	 */
	public function open($orderId)
	{
		$order = $this->getOrder((int) $orderId);
		$order = (object) $order;

		if (empty($order)) {
			return false;
		}

		if (!$order->closed) {
			return $order->id;
		}

		$purchases = $this->getPurchases(['order_id' => $order->id]);

		foreach ($purchases as $purchase) {
			$variant = $this->variants->getVariant($purchase->variant_id);

			if ($variant && !$variant->infinity) {
				$newStock = $variant->stock + $purchase->amount;
				$this->variants->updateVariant($variant->id, ['stock' => $newStock]);
			}
		}

		$query = $this->db->placehold("UPDATE __orders SET closed=0, modified=NOW() WHERE id=? LIMIT 1", $order->id);
		$this->db->query($query);

		return $order->id;
	}

	/**
	 * Pay
	 */
	public function pay($orderId)
	{
		$order = $this->getOrder($orderId);
		$order = (object) $order;

		if (empty($order)) {
			return false;
		}

		if (!$this->close($order->id)) {
			return false;
		}

		$query = $this->db->placehold("UPDATE __orders SET payment_status=1, payment_date=NOW(), modified=NOW() WHERE id=? LIMIT 1", $order->id);
		$this->db->query($query);

		return $order->id;
	}

	/**
	 * Update total price
	 */
	private function updateTotalPrice($orderId)
	{
		$order = $this->getOrder((int) $orderId);
		$order = (object) $order;

		if (empty($order)) {
			return false;
		}

		$query = $this->db->placehold("UPDATE __orders o SET o.total_price=IFNULL((SELECT SUM(p.price*p.amount)*(100-o.discount)/100 FROM __purchases p WHERE p.order_id=o.id), 0)+o.delivery_price*(1-o.separate_delivery)-o.coupon_discount, modified=NOW() WHERE o.id=? LIMIT 1", $order->id);
		$this->db->query($query);

		return $order->id;
	}

	/**
	 * Get next order
	 */
	public function getNextOrder($id, $status = null)
	{
		$whereClause = '';

		if (!is_null($status)) {
			$whereClause = $this->db->placehold('AND status=?', $status);
		}

		$this->db->query("SELECT MIN(id) AS id FROM __orders WHERE id>? $whereClause LIMIT 1", $id);
		$nextId = $this->db->result('id');

		if ($nextId) {
			return $this->getOrder((int) $nextId);
		} else {
			return false;
		}
	}

	/**
	 * Get previous order
	 */
	public function getPrevOrder($id, $status = null)
	{
		$whereClause = '';

		if (!is_null($status)) {
			$whereClause = $this->db->placehold('AND status=?', $status);
		}

		$this->db->query("SELECT MAX(id) AS id FROM __orders WHERE id<? $whereClause LIMIT 1", $id);
		$prevId = $this->db->result('id');

		if ($prevId) {
			return $this->getOrder((int) $prevId);
		} else {
			return false;
		}
	}
}
