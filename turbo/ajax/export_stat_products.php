<?php

session_start();

require_once '../../api/Turbo.php';

class ExportAjax extends Turbo
{
    private $columnsNames = [
        'category_name' => 'Category',
        'product_name'  => 'Name',
        'sum_price'     => 'Price',
        'amount'        => 'Amount'
    ];

    private $columnDelimiter = ';';
    private $statCount = 100;
    private $exportFilesDir = '../files/export/';
    private $filename = 'export_stat_products.csv';

    public function fetch()
    {
        if (!$this->managers->access('stats')) {
            return false;
        }

        $this->db->query('SET NAMES cp1251');

        $page = $this->request->get('page');

        if (empty($page) || $page == 1) {
            $page = 1;

            if (is_writable($this->exportFilesDir . $this->filename)) {
                @unlink($this->exportFilesDir . $this->filename);
            }
        }

        $f = fopen($this->exportFilesDir . $this->filename, 'ab');

        if ($page == 1) {
            fputcsv($f, $this->columnsNames, $this->columnDelimiter);
        }

        $filter = [];

        $dateFilter = $this->request->get('date_filter');

        if (!empty($dateFilter)) {
            $filter['date_filter'] = $dateFilter;
        }

        if ($this->request->get('date_from') || $this->request->get('date_to')) {
            $dateFrom = $this->request->get('date_from');
            $dateTo = $this->request->get('date_to');
        }

        if ($this->request->get('category')) {
            $filter['category_id'] = $this->request->get('category');
        }

        if (!empty($dateFrom)) {
            $filter['date_from'] = date("Y-m-d 00:00:01", strtotime($dateFrom));
        }

        if (!empty($dateTo)) {
            $filter['date_to'] = date("Y-m-d 23:59:00", strtotime($dateTo));
        }

        $status = $this->request->get('status', 'integer');

        if (!empty($status)) {
            $filter['status'] = $status;
        }

        $sortProd = $this->request->get('sort_prod');

        if (!empty($sortProd)) {
            $filter['sort_prod'] = $sortProd;
        } else {
            $filter['sort_prod'] = 'price';
        }

        $filter['page'] = max(1, $this->request->get('page', 'integer'));
        $filter['limit'] = 40;

        $tempFilter = $filter;

        unset($tempFilter['limit']);
        unset($tempFilter['page']);

        $totalCount = $this->reportstat->getReportPurchasesCount($tempFilter);

        if ($this->request->get('page') == 'all') {
            $filter['limit'] = $totalCount;
        }

        $totalSumm = 0;
        $totalAmount = 0;

        $reportStatPurchases = $this->reportstat->getReportPurchases($filter);

        $catFilter = $this->request->get('category');

        if (isset($filter['category_id'])) {
            $cat = $this->categories->getCategory(intval($filter['category_id']));
        }

        foreach ($reportStatPurchases as $id => $r) {
            if (!empty($r->product_id)) {
                $tmpCat = $this->categories->getCategories(['product_id' => $r->product_id]);
                $tmpCat = reset($tmpCat);

                if (!empty($catFilter) && !in_array($catFilter, (array)$tmpCat->path[$cat->levelDepth - 1]->children)) {
                    unset($reportStatPurchases[$id]);
                } else {
                    $reportStatPurchases[$id]->category_name = $tmpCat->name;
                }
            }
        }

        foreach ($reportStatPurchases as $u) {
            $totalSumm += $u->sum_price;
            $totalAmount += $u->amount;
            $str = [];

            foreach ($this->columnsNames as $n => $c) {
                if (isset($u->$n)) {
                    $str[] = $u->$n;
                } else {
                    $str[] = '';
                }
            }

            fputcsv($f, $str, $this->columnDelimiter);
        }

        $total = ['category_name' => 'Total', 'product_name' => ' ', 'price' => $totalSumm, 'amount' => $totalAmount];

        fputcsv($f, $total, $this->columnDelimiter);

        fclose($f);

        if ($this->statCount * $page < $totalCount) {
            return ['end' => false, 'page' => $page, 'totalpages' => $totalCount / $this->statCount];
        } else {
            return ['end' => true, 'page' => $page, 'totalpages' => $totalCount / $this->statCount];
        }
    }
}

$exportAjax = new ExportAjax();

$data = $exportAjax->fetch();

if ($data) {
    header("Content-type: application/json; charset=utf-8");
    header("Cache-Control: must-revalidate");
    header("Pragma: no-cache");
    header("Expires: -1");

    echo json_encode($data);
}
