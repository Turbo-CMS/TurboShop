<?php

require_once('api/Turbo.php');

class StatsAdmin extends Turbo
{
	public function fetch()
	{
		$filter = array();

		// Label filter
		$label = $this->orders->get_label($this->request->get('label'));
		if (!empty($label)) {
			$filter['label'] = $label->id;
			$this->design->assign('label', $label);
		}

		$date_filter = $this->request->get('date_filter');
		if (!empty($date_filter)) {
			$filter['date_filter'] = $date_filter;
			$this->design->assign('date_filter', $date_filter);
		}

		$date_from = $this->request->get('date_from');
		$date_to = $this->request->get('date_to');

		if (!empty($date_from)) {
			$filter['date_from'] = date("Y-m-d 00:00:01", strtotime($date_from));
			$this->design->assign('date_from', $date_from);
		}

		if (!empty($date_to)) {
			$filter['date_to'] = date("Y-m-d 23:59:00", strtotime($date_to));
			$this->design->assign('date_to', $date_to);
		}

		if (empty($filter)) {
			$filter['date_filter'] = 'all';
			$this->design->assign('date_filter', 'all');
		}

		$status = $this->request->get('status', 'integer');
		if (!empty($status)) {
			switch ($status) {
				case '1': {
						$stat_o = 0;
						break;
					}
				case '2': {
						$stat_o = 1;
						break;
					}
				case '3': {
						$stat_o = 2;
						break;
					}
				case '4': {
						$stat_o = 3;
						break;
					}
			}
			$filter['status'] = $stat_o;
			$this->design->assign('status', $status);
		}

		$this->design->assign('stat', $this->reportstat->get_stat($filter));
		$this->design->assign('stat_orders', $this->reportstat->get_stat_orders($filter));

		// Order tags
		$labels = $this->orders->get_labels();
		$this->design->assign('labels', $labels);

		return $this->design->fetch('stats.tpl');
	}
}
