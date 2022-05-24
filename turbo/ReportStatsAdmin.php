<?php

require_once('api/Turbo.php');

########################################
class ReportStatsAdmin extends Turbo
{
    public function fetch()
    {

        $filter = array();

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

        $sort_prod = $this->request->get('sort_prod');
        if (!empty($sort_prod)) {
            $filter['sort_prod'] = $sort_prod;
            $this->design->assign('sort_prod', $sort_prod);
        } else {
            $sort_prod = 'price';
            $this->design->assign('sort_prod', $sort_prod);
        }

        $filter['page'] = max(1, $this->request->get('page', 'integer'));
        $filter['limit'] = 40;
        $cat_filter = $this->request->get('category_id', 'integer');

        $temp_filter = $filter;
        unset($temp_filter['limit']);
        unset($temp_filter['page']);

        $stat_count = $this->reportstat->get_report_purchases_count($temp_filter);
        $this->design->assign('posts_count', $stat_count);

        if ($this->request->get('page') == 'all') {
            $filter['limit'] = $stat_count;
        }

        $this->design->assign('pages_count', ceil($stat_count / $filter['limit']));
        $this->design->assign('current_page', $filter['page']);

        $report_stat_purchases = $this->reportstat->get_report_purchases($filter);
        foreach ($report_stat_purchases as $id => $r) {
            if (!empty($r->product_id)) {
                $tmp_cat = $this->categories->get_categories(array('product_id' => $r->product_id));
                $tmp_cat = reset($tmp_cat);
                if (!empty($cat_filter) && $tmp_cat->id != $cat_filter) {
                    unset($report_stat_purchases[$id]);
                } else {
                    $report_stat_purchases[$id]->category = $tmp_cat;
                }
            }
        }

        $this->design->assign('report_stat_purchases', $report_stat_purchases);
        $this->design->assign('categories', $this->categories->get_categories_tree());

        return $this->design->fetch('reportstats.tpl');
    }
}
