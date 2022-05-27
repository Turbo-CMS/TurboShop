<?php
    
session_start();
require_once('../../api/Turbo.php');

class ExportAjax extends Turbo 
{
    
    private $columns_names = array(
        'email'=>            'Email'
    );
    
    private $column_delimiter = ';';
    private $count_subscribes = 5;
    private $export_files_dir = '../files/export_users/';
    private $filename = 'subscribes.csv';
    
    public function fetch() 
	{
        
		if(!$this->managers->access('subscribes')) {
            return false;
        }
        
        // Excel only eats 1251
        $this->db->query('SET NAMES cp1251');
        
        // Page to be exported
        $page = $this->request->get('page');
        if(empty($page) || $page==1) {
            $page = 1;
            // If you started over, delete the old export file
            if(is_writable($this->export_files_dir.$this->filename)) {
                unlink($this->export_files_dir.$this->filename);
            }
        }
        
        // Opening the export file for adding
        $f = fopen($this->export_files_dir.$this->filename, 'ab');
        
        // If you started from the beginning - add the column names to the first line
        if($page == 1) {
            fputcsv($f, $this->columns_names, $this->column_delimiter);
        }
        
        $filter = array();
        $filter['page'] = $page;
        $filter['limit'] = $this->count_subscribes;
        $filter['sort'] = $this->request->get('sort');
        $filter['keyword'] = $this->request->get('keyword');
        
        // Select users
        $users = array();
        foreach($this->subscribes->get_subscribes($filter) as $s) {
            $str = array();
            foreach($this->columns_names as $n=>$c) {
                $str[] = $s->$n;
            }
            
            fputcsv($f, $str, $this->column_delimiter);
        }
        
        $total_subscribes = $this->subscribes->count_subscribes();
        
        if($this->count_subscribes*$page < $total_subscribes) {
            return array('end'=>false, 'page'=>$page, 'totalpages'=>$total_subscribes/$this->count_subscribes);
        } else {
            return array('end'=>true, 'page'=>$page, 'totalpages'=>$total_subscribes/$this->count_subscribes);
        }
        
        fclose($f);
    }
    
}

$export_ajax = new ExportAjax();
$data = $export_ajax->fetch();
if ($data) {
    header("Content-type: application/json; charset=utf-8");
    header("Cache-Control: must-revalidate");
    header("Pragma: no-cache");
    header("Expires: -1");
    $json = json_encode($data);
    print $json;
}
