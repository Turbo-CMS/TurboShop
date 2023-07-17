<?php

require_once 'api/Turbo.php';

class ReportStatsAdmin extends Turbo
{
    public function fetch()
    {
        $filter = [];
        $dateFilter = $this->request->get('date_filter');

        if (!empty($dateFilter)) {
            $filter['date_filter'] = $dateFilter;
            $this->design->assign('date_filter', $dateFilter);
        }

        $dateFrom = $this->request->get('date_from');
        $dateTo = $this->request->get('date_to');

        if (!empty($dateFrom)) {
            $filter['date_from'] = date('Y-m-d 00:00:01', strtotime($dateFrom));
            $this->design->assign('date_from', $dateFrom);
        }

        if (!empty($dateTo)) {
            $filter['date_to'] = date('Y-m-d 23:59:00', strtotime($dateTo));
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

        $sortProd = $this->request->get('sort_prod');

        if (!empty($sortProd)) {
            $filter['sort_prod'] = $sortProd;
            $this->design->assign('sort_prod', $sortProd);
        } else {
            $sortProd = 'price';
            $this->design->assign('sort_prod', $sortProd);
        }

        $filter['page'] = max(1, $this->request->get('page', 'integer'));
        $filter['limit'] = 40;

        $catFilter = $this->request->get('category_id', 'integer');
        $tempFilter = $filter;

        unset($tempFilter['limit']);
        unset($tempFilter['page']);

        $statCount = $this->reportstat->getReportPurchasesCount($tempFilter);
        $this->design->assign('posts_count', $statCount);

        if ($this->request->get('page') == 'all') {
            $filter['limit'] = $statCount;
        }

        $this->design->assign('pages_count', ceil($statCount / $filter['limit']));
        $this->design->assign('current_page', $filter['page']);

        $reportStatPurchases = $this->reportstat->getReportPurchases($filter);

        foreach ($reportStatPurchases as $id => $r) {
            if (!empty($r->product_id)) {
                $tmpCat = $this->categories->getCategories(['product_id' => $r->product_id]);
                $tmpCat = reset($tmpCat);

                if (!empty($catFilter) && $tmpCat->id != $catFilter) {
                    unset($reportStatPurchases[$id]);
                } else {
                    $reportStatPurchases[$id]->category = $tmpCat;
                }
            }
        }

        $this->design->assign('report_stat_purchases', $reportStatPurchases);
        $this->design->assign('categories', $this->categories->getCategoriesTree());

        return $this->design->fetch('reportstats.tpl');
    }
}
