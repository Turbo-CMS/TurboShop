<?php

session_start();

require_once '../../api/Turbo.php';

class ExportAjax extends Turbo
{
    private $columnNames = [
        'id' => 'Order ID',
        'date' => 'Order date',
        'name' => 'User name',
        'phone' => 'User phone',
        'email' => 'User email',
        'address' => 'User address',
        'comment' => 'User comment',
        'total_price' => 'Total price',
        'currency' => 'Currency',
    ];

    private $columnDelimiter = ';';
    private $ordersCount = 100;
    private $exportFilesDir = '../files/export/';
    private $filename = 'export_orders.csv';

    public function fetch()
    {
        if (!$this->managers->access('orders')) {
            return false;
        }

        session_write_close();

        unset($_SESSION['lang_id']);

        $this->db->query('SET NAMES cp1251');

        $page = $this->request->get('page');

        if (empty($page) || $page == 1) {
            $page = 1;

            if (is_writable($this->exportFilesDir . $this->filename)) {
                @unlink($this->exportFilesDir . $this->filename);
            }
        }

        $f = fopen($this->exportFilesDir . $this->filename, 'ab');

        $filter = [];
        $filter['page'] = $page;
        $filter['limit'] = $this->ordersCount;

        $status = $this->request->get('status', 'integer');

        if ($status < 4) {
            $filter['status'] = $status;
        }

        $labelId = $this->request->get('label', 'integer');

        if (!empty($labelId)) {
            $filter['label'] = $labelId;
        }

        $fromDate = $this->request->get('from_date');
        $toDate = $this->request->get('to_date');

        if (!empty($fromDate)) {
            $filter['from_date'] = $fromDate;
        }

        if (!empty($toDate)) {
            $filter['to_date'] = $toDate;
        }

        if ($page == 1) {
            fputcsv($f, $this->columnNames, $this->columnDelimiter);
        }

        $mainCurrency = $this->money->getCurrency();

        $orders = $this->orders->getOrders($filter);

        if (!empty($orders)) {
            foreach ($orders as $order) {
                $str = [];
                $order->currency = $mainCurrency->code;

                foreach ($this->columnNames as $name => $columnName) {
                    $str[] = $order->$name;
                }

                fputcsv($f, $str, $this->columnDelimiter);
            }
        }

        $totalOrders = $this->orders->countOrders($filter);

        if ($this->ordersCount * $page < $totalOrders) {
            $result = ['end' => false, 'page' => $page, 'totalpages' => $totalOrders / $this->ordersCount];
        } else {
            $result = ['end' => true, 'page' => $page, 'totalpages' => $totalOrders / $this->ordersCount];
        }

        fclose($f);

        return $result;
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
