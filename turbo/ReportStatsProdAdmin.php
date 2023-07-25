<?php

require_once 'api/Turbo.php';

class ReportStatsProdAdmin extends Turbo
{
	public function fetch()
	{
		$filter = [];
		$variants = [];

		$labelId = $this->request->get('label');

		if (!empty($labelId)) {
			$label = $this->orders->getLabel($labelId);

			if ($label) {
				$filter['label'] = $label->id;
				$this->design->assign('label', $label);
			}
		}

		$variantId = $this->request->get('variant_id');

		if (!empty($variantId)) {
			$filter['variant_id'] = $variantId;
			$this->design->assign('variant_id', $variantId);
		}

		$dateFilter = $this->request->get('date_filter');

		if (!empty($dateFilter)) {
			$filter['date_filter'] = $dateFilter;
			$this->design->assign('date_filter', $dateFilter);
		}

		$dateFrom = $this->request->get('date_from');

		if (!empty($dateFrom)) {
			$formattedDateFrom = date("Y-m-d 00:00:01", strtotime($dateFrom));
			$filter['date_from'] = $formattedDateFrom;
			$this->design->assign('date_from', $dateFrom);
		}

		$dateTo = $this->request->get('date_to');

		if (!empty($dateTo)) {
			$formattedDateTo = date("Y-m-d 23:59:00", strtotime($dateTo));
			$filter['date_to'] = $formattedDateTo;
			$this->design->assign('date_to', $dateTo);
		}

		$status = $this->request->get('status', 'integer');

		if (!empty($status)) {
			switch ($status) {
				case '1':
					$stat = 0;
					break;
				case '2':
					$stat = 1;
					break;
				case '3':
					$stat = 2;
					break;
				case '4':
					$stat = 3;
					break;
			}

			$filter['status'] = $stat;
			$this->design->assign('status', $status);
		}

		$id = $this->request->get('id', 'integer');
		$product = $this->products->getProduct((int) $id);
		$this->design->assign('product', $product);

		if ($product) {
			$variants = $this->variants->getVariants(['product_id' => $product->id]);
			$this->design->assign('variants', $variants);
		}

		$productReport = $this->reportstat->getReportProduct($filter, $id);
		$this->design->assign('product_report', $productReport);

		$productReportStat = $this->reportstat->getReportProductStat($filter, $id);
		$this->design->assign('product_report_stat', $productReportStat);

		$labels = $this->orders->getLabels();
		$this->design->assign('labels', $labels);

		return $this->design->fetch('reportstatsprod.tpl');
	}
}
