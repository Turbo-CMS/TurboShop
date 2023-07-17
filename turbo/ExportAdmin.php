<?php

require_once 'api/Turbo.php';

class ExportAdmin extends Turbo
{
    private $exportFilesDir = 'turbo/files/export/';

    public function fetch()
    {
        $this->design->assign('export_files_dir', $this->exportFilesDir);

        if (!is_writable($this->exportFilesDir)) {
            $this->design->assign('message_error', 'no_permission');
        }

        $this->design->assign('brands', $this->brands->getBrands());
        $this->design->assign('categories', $this->categories->getCategoriesTree());

        return $this->design->fetch('export.tpl');
    }
}
