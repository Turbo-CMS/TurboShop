<?php

require_once 'api/Turbo.php';

class StatsAdmin extends Turbo
{
	public function fetch()
	{
		$filter = [];

		$labelId = $this->request->get('label');
		$label = $this->orders->getLabel($labelId);

		if (!empty($label)) {
			$filter['label'] = $label->id;
			$this->design->assign('label', $label);
		}

		$dateFilter = $this->request->get('date_filter');

		if (!empty($dateFilter)) {
			$filter['date_filter'] = $dateFilter;
			$this->design->assign('date_filter', $dateFilter);
		}

		$dateFrom = $this->request->get('date_from');
		$dateTo = $this->request->get('date_to');

		if (!empty($dateFrom)) {
			$filter['date_from'] =
				date("Y-m-d 00:00:01", strtotime($dateFrom));
			$this->design->assign('date_from', $dateFrom);
		}

		if (!empty($dateTo)) {
			$filter['date_to'] =
				date("Y-m-d 23:59:00", strtotime($dateTo));
			$this->design->assign('date_to', $dateTo);
		}

		if (empty($filter)) {
			$filter['date_filter'] = 'all';
			$this->design->assign('date_filter', 'all');
		}

		$status = $this->request->get('status', 'integer');

		if (!empty($status)) {
			switch ($status) {
				case '1': {
						$stat = 0;
						break;
					}
				case '2': {
						$stat = 1;
						break;
					}
				case '3': {
						$stat = 2;
						break;
					}
				case '4': {
						$stat = 3;
						break;
					}
			}

			$filter['status'] = $stat;
			$this->design->assign('status', $status);
		}

		$this->design->assign('stat', $this->reportstat->getStat($filter));
		$this->design->assign('stat_orders', $this->reportstat->getStatOrders($filter));

		$labels = $this->orders->getLabels();
		$this->design->assign('labels', $labels);

		return $this->design->fetch('stats.tpl');
	}
}
