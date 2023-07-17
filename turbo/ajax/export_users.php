<?php
session_start();
require_once '../../api/Turbo.php';

class ExportAjax extends Turbo
{
    private $columnsNames = [
        'name' => 'Name',
        'email' => 'Email',
        'phone' => 'Phone',
        'address' => 'Address',
        'group_name' => 'Group',
        'discount' => 'Discount',
        'enabled' => 'Enabled',
        'created' => 'Created',
        'last_ip' => 'IP',
    ];

    private $columnDelimiter = ';';
    private $usersCount = 10;
    private $exportFilesDir = '../files/export_users/';
    private $filename = 'users.csv';

    public function fetch()
    {
        if (!$this->managers->access('users')) {
            return false;
        }

        $this->db->query('SET NAMES cp1251');

        $page = $this->request->get('page');
        if (empty($page) || $page == 1) {
            $page = 1;

            if (is_writable($this->exportFilesDir . $this->filename)) {
                unlink($this->exportFilesDir . $this->filename);
            }
        }

        $f = fopen($this->exportFilesDir . $this->filename, 'ab');

        if ($page == 1) {
            fputcsv($f, $this->columnsNames, $this->columnDelimiter);
        }

        $filter = ['page' => $page, 'limit' => $this->usersCount,];

        if ($this->request->get('group_id')) {
            $filter['group_id'] = (int) $this->request->get('group_id');
        }

        $filter['sort'] = $this->request->get('sort');
        $filter['keyword'] = $this->request->get('keyword');

        $users = [];

        foreach ($this->users->getUsers($filter) as $u) {
            $data = [];

            foreach ($this->columnsNames as $n => $c) {
                $data[] = $u->$n;
            }

            fputcsv($f, $data, $this->columnDelimiter);
        }

        $totalUsers = $this->users->countUsers();

        if ($this->usersCount * $page < $totalUsers) {
            return ['end' => false, 'page' => $page, 'totalpages' => $totalUsers / $this->usersCount,];
        } else {
            return ['end' => true, 'page' => $page, 'totalpages' => $totalUsers / $this->usersCount,];
        }

        fclose($f);
    }
}

$export_ajax = new ExportAjax();
$json = json_encode($export_ajax->fetch(), JSON_THROW_ON_ERROR);

header('Content-type: application/json; charset=utf-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

echo $json;
