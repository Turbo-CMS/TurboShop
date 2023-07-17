<?php

require_once 'api/Turbo.php';

class CategoryStatsAdmin extends Turbo
{
    public $totalPrice;
    public $totalAmount;

    public function fetch()
    {
        $filter = [];
        $this->totalPrice = 0;
        $this->totalAmount = 0;

        $dateFrom = $this->request->get('date_from');
        $dateTo = $this->request->get('date_to');

        if (!empty($dateFrom) || !empty($dateTo)) {
            if (!empty($dateFrom)) {
                $filter['date_from'] = date("Y-m-d 00:00:01", strtotime($dateFrom));
                $this->design->assign('date_from', $dateFrom);
            }

            if (!empty($dateTo)) {
                $filter['date_to'] = date("Y-m-d 23:59:00", strtotime($dateTo));
                $this->design->assign('date_to', $dateTo);
            }
        }

        $categoryId = $this->request->get('category', 'integer');

        if (!empty($categoryId)) {
            $category = $this->categories->getCategory($categoryId);
            $this->design->assign('category', $category);
            $filter['category_id'] = $category->children;
        }

        $brandId = $this->request->get('brand', 'integer');

        if (!empty($brandId)) {
            $filter['brand_id'] = $brandId;
            $brand = $this->brands->getBrand($brandId);
            $this->design->assign('brand', $brand);
        }

        $brandsFilter = [];
        $categories = $this->categories->getCategoriesTree();

        if (!empty($category)) {
            $brandsFilter['category_id'] = $category->children;
        }

        $brands = $this->brands->getBrands($brandsFilter);

        $purchases = $this->reportstat->getCategorizedStat($filter);

        if (!empty($category)) {
            $categoriesList = $this->catTree([$category], $purchases);
        } else {
            $categoriesList = $this->catTree($categories, $purchases);
        }

        $this->design->assign('categories_list', $categoriesList);
        $this->design->assign('categories', $categories);
        $this->design->assign('brands', $brands);
        $this->design->assign('total_price', $this->totalPrice);
        $this->design->assign('total_amount', $this->totalAmount);

        return $this->design->fetch('category_stats.tpl');
    }

    private function catTree($categories, $purchases = [])
    {
        foreach ($categories as $k => $v) {
            if (isset($v->subcategories)) {
                $this->catTree($v->subcategories, $purchases);
            }

            if (isset($purchases[$v->id])) {
                $price = floatval($purchases[$v->id]->price);
                $amount = intval($purchases[$v->id]->amount);
            } else {
                $price = 0;
                $amount = 0;
            }

            $categories[$k]->price = $price;
            $categories[$k]->amount = $amount;
            $this->totalPrice += $price;
            $this->totalAmount += $amount;
        }

        return $categories;
    }
}
