<?php

session_start();
require_once '../../api/Turbo.php';

class ExportAjax extends Turbo
{
    private $columnsNames = [
        'category' => 'Category',
        'name' => 'Name',
        'price' => 'Price',
        'url' => 'URL',
        'visible' => 'Visible',
        'featured' => 'Featured',
        'brand' => 'Brand',
        'variant' => 'Variant',
        'color' => 'Variant color',
        'color_code' => 'Color code',
        'compare_price' => 'Compare price',
        'currency' => 'Currency ID',
        'weight' => 'Weight',
        'sku' => 'SKU',
        'stock' => 'Stock',
        'meta_title' => 'Meta title',
        'meta_keywords' => 'Meta keywords',
        'meta_description' => 'Meta description',
        'annotation' => 'Annotation',
        'body' => 'Description',
        'images' => 'Images',
    ];

    private $columnDelimiter = ';';
    private $subcategoryDelimiter = '/';
    private $productsCount = 10;
    private $exportFilesDir = '../files/export/';
    private $fileName = 'export.csv';

    public function fetch()
    {
        if (!$this->managers->access('export')) {
            return false;
        }

        $this->db->query('SET NAMES cp1251');

        $page = $this->request->get('page');
        if (empty($page) || $page == 1) {
            $page = 1;

            if (is_writable($this->exportFilesDir . $this->fileName)) {
                unlink($this->exportFilesDir . $this->fileName);
            }
        }

        $file = fopen($this->exportFilesDir . $this->fileName, 'ab');

        $features = $this->features->getFeatures();
        foreach ($features as $feature) {
            $this->columnsNames[$feature->name] = $feature->name;
        }

        if ($page == 1) {
            fputcsv($file, $this->columnsNames, $this->columnDelimiter);
        }

        $filter = ['page' => $page, 'limit' => $this->productsCount];

        if (($cid = $this->request->get('category_id', 'integer')) && ($category = $this->categories->getCategory($cid))) {
            $filter['category_id'] = $category->children;
        }

        if ($brandId = $this->request->get('brand_id', 'integer')) {
            $filter['brand_id'] = $brandId;
        }

        $products = [];

        foreach ($this->products->getProducts($filter) as $p) {
            $products[$p->id] = (array) $p;
            $options = $this->features->getProductOptions($p->id);

            foreach ($options as $option) {
                if (!isset($products[$option->product_id][$option->name])) {
                    $products[$option->product_id][$option->name] = str_replace(',', '.', trim($option->value));
                } else {
                    $products[$option->product_id][$option->name] .= '|' . $option->value;
                }
            }
        }

        if (empty($products)) {
            return false;
        }

        foreach ($products as $pId => &$product) {
            $categories = [];
            $cats = $this->categories->getProductCategories($pId);

            foreach ($cats as $category) {
                $path = [];
                $cat = $this->categories->getCategory((int)$category->category_id);

                if (!empty($cat)) {
                    foreach ($cat->path as $p) {
                        $path[] = str_replace($this->subcategoryDelimiter, '\\' . $this->subcategoryDelimiter, $p->name);
                    }

                    $categories[] = implode('/', $path);
                }
            }
            $product['category'] = implode(', ', $categories);
        }

        $images = $this->products->getImages(['product_id' => array_keys($products)]);

        foreach ($images as $image) {
            if (empty($products[$image->product_id]['images'])) {
                $products[$image->product_id]['images'] = $image->filename;
            } else {
                $products[$image->product_id]['images'] .= ', ' . $image->filename;
            }
        }

        $variants = $this->variants->getVariants(['product_id' => array_keys($products)]);

        foreach ($variants as $variant) {
            if (isset($products[$variant->product_id])) {
                $v = [];
                $v['variant'] = $variant->name;
                $v['color'] = $variant->color;
                $v['color_code'] = $variant->color_code;
                $v['price'] = $variant->oprice;
                $v['compare_price'] = $variant->compare_price;
                $v['sku'] = $variant->sku;
                $v['stock'] = $variant->stock;
                $v['weight'] = $variant->weight;
                $v['currency'] = $variant->currency_id;

                if ($variant->infinity) {
                    $v['stock'] = '';
                }

                $products[$variant->product_id]['variants'][] = $v;
            }
        }

        $allBrands = [];

        foreach ($this->brands->getBrands() as $b) {
            $allBrands[$b->id] = $b;
        }

        foreach ($products as &$product) {
            if ($product['brand_id'] && isset($allBrands[$product['brand_id']])) {
                $product['brand'] = $allBrands[$product['brand_id']]->name;
            }

            $variants = $product['variants'];
            unset($product['variants']);

            if (isset($variants)) {
                foreach ($variants as $variant) {
                    $result = array_merge($product, $variant);

                    foreach ($this->columnsNames as $internalName => $columnName) {
                        if (isset($result[$internalName])) {
                            $res[$internalName] = $result[$internalName];
                        } else {
                            $res[$internalName] = '';
                        }
                    }

                    fputcsv($file, $res, $this->columnDelimiter);
                }
            }
        }

        $totalProducts = $this->products->countProducts($filter);

        if ($this->productsCount * $page < $totalProducts) {
            return ['end' => false, 'page' => $page, 'totalpages' => $totalProducts / $this->productsCount];
        } else {
            return ['end' => true, 'page' => $page, 'totalpages' => $totalProducts / $this->productsCount];
        }

        fclose($file);
    }
}

$exportAjax = new ExportAjax();
$data = $exportAjax->fetch();

if ($data) {
    header('Content-type: application/json; charset=utf-8');
    header('Cache-Control: must-revalidate');
    header('Pragma: no-cache');
    header('Expires: -1');

    $json = json_encode($data);
    print $json;
}
