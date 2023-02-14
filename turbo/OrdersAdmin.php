<?php

require_once('api/Turbo.php');

class OrdersAdmin extends Turbo
{
	public function fetch()
	{
		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));

		$filter['limit'] = 40;

		// Search
		$keyword = $this->request->get('keyword', 'string');
		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		// Label filter
		$label = $this->orders->get_label($this->request->get('label'));
		if (!empty($label)) {
			$filter['label'] = $label->id;
			$this->design->assign('label', $label);
		}

		// Action processing
		if ($this->request->method('post')) {

			// Actions with selected
			$ids = $this->request->post('check');
			if (is_array($ids))
				switch ($this->request->post('action')) {
					case 'delete': {
							foreach ($ids as $id) {
								$o = $this->orders->get_order(intval($id));
								if ($o->status < 3) {
									$this->orders->update_order($id, array('status' => 3));
									$this->orders->open($id);
								} else
									$this->orders->delete_order($id);
							}
							break;
						}
					case 'set_status_0': {
							foreach ($ids as $id) {
								if ($this->orders->open(intval($id)))
									$this->orders->update_order($id, array('status' => 0));
							}
							break;
						}
					case 'set_status_1': {
							foreach ($ids as $id) {
								if (!$this->orders->close(intval($id)))
									$this->design->assign('message_error', 'error_closing');
								else
									$this->orders->update_order($id, array('status' => 1));
							}
							break;
						}
					case 'set_status_2': {
							foreach ($ids as $id) {
								if (!$this->orders->close(intval($id)))
									$this->design->assign('message_error', 'error_closing');
								else
									$this->orders->update_order($id, array('status' => 2));
							}
							break;
						}
					case 'set_label': {
							$l_id = $this->request->post('change_label_id', 'integer');
							if ($l_id > 0)
								foreach ($ids as $id) {
									$this->orders->add_order_labels($id, $l_id);
								}
							break;
						}
					case 'unset_label': {
							$l_id = $this->request->post('change_label_id', 'integer');
							if ($l_id > 0)
								foreach ($ids as $id) {
									$this->orders->delete_order_labels($id, $l_id);
								}
							break;
						}
				}
		}

		if (empty($keyword)) {
			$status = $this->request->get('status', 'integer');
			if ($status < 4)
				$filter['status'] = $status;
			$this->design->assign('status', $status);
		}

		// Search before order date
		$from_date = $this->request->get('from_date');
		$to_date = $this->request->get('to_date');
		if (!empty($from_date) || !empty($to_date)) {
			$filter['from_date'] = $from_date;
			$filter['to_date'] = $to_date;
			$this->design->assign('from_date', $from_date);
			$this->design->assign('to_date', $to_date);
		}

		$orders_count = $this->orders->count_orders($filter);

		// Show all pages at once
		if ($this->request->get('page') == 'all')
			$filter['limit'] = $orders_count;

		// Display
		$orders = array();
		foreach ($this->orders->get_orders($filter) as $o) {
			$orders[$o->id] = $o;
			$orders[$o->id]->purchases = $this->orders->get_purchases(array('order_id' => $o->id));
		}

		// Order tags
		$orders_labels = array();
		$orders_labels = $this->orders->get_order_labels(array_keys($orders));
		if ($orders_labels) {
			foreach ($orders_labels as $orders_label) {
				$orders[$orders_label->order_id]->labels[] = $orders_label;
				$orders[$orders_label->order_id]->labels_ids[] = $orders_label->id;
			}
		}

		$this->design->assign('pages_count', ceil($orders_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('orders_count', $orders_count);
		$this->design->assign('orders', $orders);

		// Order tags
		$labels = $this->orders->get_labels();
		$this->design->assign('labels', $labels);

		return $this->design->fetch('orders.tpl');
	}
}
