<?php

require_once 'api/Turbo.php';

class OrdersAdmin extends Turbo
{
	public function fetch()
	{
		$filter = [];
		$filter['page'] = max(1, $this->request->get('page', 'integer'));
		$filter['limit'] = 40;

		$keyword = $this->request->get('keyword', 'string');

		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		$label = $this->orders->getLabel($this->request->get('label'));

		if (!empty($label)) {
			$filter['label'] = $label->id;
			$this->design->assign('label', $label);
		}

		if ($this->request->isMethod('post')) {
			$ids = $this->request->post('check');

			if (is_array($ids)) {
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id) {
								$order = $this->orders->getOrder((int) $id);

								if ($order->status < 3) {
									$this->orders->updateOrder($id, ['status' => 3]);
									$this->orders->open($id);
								} else {
									$this->orders->deleteOrder($id);
								}
							}
							break;
						}
					case 'set_status_0': {
							foreach ($ids as $id) {
								if ($this->orders->open((int) $id)) {
									$this->orders->updateOrder($id, ['status' => 0]);
								}
							}
							break;
						}
					case 'set_status_1': {
							foreach ($ids as $id) {
								if (!$this->orders->close((int) $id)) {
									$this->design->assign('message_error', 'error_closing');
								} else {
									$this->orders->updateOrder($id, ['status' => 1]);
								}
							}
							break;
						}
					case 'set_status_2': {
							foreach ($ids as $id) {
								if (!$this->orders->close((int) $id)) {
									$this->design->assign('message_error', 'error_closing');
								} else {
									$this->orders->updateOrder($id, ['status' => 2]);
								}
							}
							break;
						}
					case 'set_label': {
							$labelId = $this->request->post('change_label_id', 'integer');
							if ($labelId > 0) {
								foreach ($ids as $id) {
									$this->orders->addOrderLabels($id, $labelId);
								}
							}
							break;
						}
					case 'unset_label': {
							$labelId = $this->request->post('change_label_id', 'integer');
							if ($labelId > 0) {
								foreach ($ids as $id) {
									$this->orders->deleteOrderLabels($id, $labelId);
								}
							}
							break;
						}
				}
			}
		}

		if (empty($keyword)) {
			$status = $this->request->get('status', 'integer');

			if ($status < 4) {
				$filter['status'] = $status;
			}

			$this->design->assign('status', $status);
		}

		$fromDate = $this->request->get('from_date');
		$toDate = $this->request->get('to_date');

		if (!empty($fromDate) || !empty($toDate)) {
			$filter['from_date'] = $fromDate;
			$filter['to_date'] = $toDate;
			$this->design->assign('from_date', $fromDate);
			$this->design->assign('to_date', $toDate);
		}

		$ordersCount = $this->orders->countOrders($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $ordersCount;
		}

		$orders = [];

		foreach ($this->orders->getOrders($filter) as $o) {
			$orders[$o->id] = $o;
			$orders[$o->id]->purchases = $this->orders->getPurchases(['order_id' => $o->id]);
		}

		$ordersLabels = [];
		$ordersLabels = $this->orders->getOrderLabels(array_keys($orders));

		if ($ordersLabels) {
			foreach ($ordersLabels as $orderLabel) {
				$orders[$orderLabel->order_id]->labels[] = $orderLabel;
				$orders[$orderLabel->order_id]->labels_ids[] = $orderLabel->id;
			}
		}

		$this->design->assign('pages_count', ceil($ordersCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('orders_count', $ordersCount);
		$this->design->assign('orders', $orders);

		$labels = $this->orders->getLabels();
		$this->design->assign('labels', $labels);

		return $this->design->fetch('orders.tpl');
	}
}
