<?php

require_once('api/Turbo.php');

########################################
class ReportStatsProdAdmin extends Turbo
{
    public function fetch()
    {
        $filter = array();
        $variants = array();

        // Filter by label
        $label = $this->orders->get_label($this->request->get('label'));
        if (!empty($label)) {
            $filter['label'] = $label->id;
            $this->design->assign('label', $label);
        }

        $variant_id = $this->request->get('variant_id');
        if (!empty($variant_id)) {
            $filter['variant_id'] = $variant_id;
            $this->design->assign('variant_id', $variant_id);
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

        $status = $this->request->get('status', 'integer');
        if (!empty($status)) {

            switch ($status) {
                case '1':
                    $stat_o = 0;
                    break;
                case '2':
                    $stat_o = 1;
                    break;
                case '3':
                    $stat_o = 2;
                    break;
                case '4':
                    $stat_o = 3;
                    break;
            }
            $filter['status'] = $stat_o;
            $this->design->assign('status', $status);
        }

        $id = $this->request->get('id', 'integer');
        $product = $this->products->get_product(intval($id));
        $this->design->assign('product', $product);

        if ($product) {
            // Product variants
            $variants = $this->variants->get_variants(array('product_id' => $product->id));
            $this->design->assign('variants', $variants);
        }

        $product_report = $this->reportstat->get_report_product($filter, $id);
        $this->design->assign('product_report', $product_report);

        $product_report_stat = $this->reportstat->get_report_product_stat($filter, $id);
        $this->design->assign('product_report_stat', $product_report_stat);

        // Labels
        $labels = $this->orders->get_labels();
        $this->design->assign('labels', $labels);

        return $this->design->fetch('reportstatsprod.tpl');
    }
}
