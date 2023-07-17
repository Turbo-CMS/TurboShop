<?php

require_once 'api/Turbo.php';

$turbo = new Turbo();

header("Content-Type: text/xml; charset=UTF-8");
print(pack('CCC', 0xEF, 0xBB, 0xBF));

print "<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE yml_catalog SYSTEM 'shops.dtd'>
<yml_catalog date='" . date('Y-m-d H:i') . "'>
<shop>
    <name>" . $turbo->settings->site_name . "</name>
    <company>" . $turbo->settings->company_name . "</company>
    <url>" . $turbo->config->root_url . "</url>
    <platform>TurboCMS</platform>
    <version>" . $turbo->config->version . "</version>";

$currencies = $turbo->money->getCurrencies(['enabled' => 1]);
$mainCurrency = reset($currencies);

print "<currencies>";
foreach ($currencies as $currency) {
    if ($currency->enabled) {
        print "<currency id='" . $currency->code . "' rate='" . $currency->rate_to / $currency->rate_from * $mainCurrency->rate_from / $mainCurrency->rate_to . "'/>";
    }
}
print "</currencies>";

$categories = $turbo->categories->getCategories();

print "<categories>";
foreach ($categories as $category) {
    if (property_exists($category, 'id')) {
        print "<category id='{$category->id}'";
        
        if (property_exists($category, 'parent_id') && $category->parent_id > 0) {
            print " parentId='{$category->parent_id}'";
        }
        
        print ">" . htmlspecialchars($category->name) . "</category>";
    }
}
print "</categories>";


$features = [];
$stockFilter = $turbo->settings->export_export_not_in_stock ? '' : ' AND (v.stock >0 OR v.stock is NULL) ';
$price_filter = $turbo->settings->export_no_export_without_price ? ' AND v.price >0 ' : '';

$turbo->db->query("SET SQL_BIG_SELECTS=1");
$turbo->db->query("
    SELECT 
        p.body, 
        b.name as vendor, 
        v.stock, 
        v.compare_price, 
        v.sku, 
        v.price, 
        v.id as variant_id, 
        p.name as product_name, 
        v.name as variant_name, 
        v.position as variant_position, 
        p.id as product_id, 
        p.url, 
        p.annotation, 
        pc.category_id, 
        c.rate_from, 
        c.rate_to, 
        v.currency_id 
    FROM __variants v 
    LEFT JOIN __products p ON v.product_id=p.id
    left join __currencies as c on(c.id=v.currency_id)
    LEFT JOIN __products_categories pc ON p.id = pc.product_id AND pc.position=(SELECT MIN(position) FROM __products_categories WHERE product_id=p.id LIMIT 1)
    LEFT JOIN __brands b on (b.id = p.brand_id)
    WHERE 
        1 
        AND p.visible 
        $stockFilter 
    GROUP BY v.id 
    ORDER BY p.id, v.position
");

print "<offers>";

$currencyCode = reset($currencies)->code;
$prevProductId = null;

$products = $turbo->db->results();
$productIds = [];
foreach ($products as $product) {
    if (!in_array($product->product_id, $productIds)) {
        $productIds[] = $product->product_id;
    }
}

$productImages = [];
foreach ($turbo->products->getImages(['product_id' => $productIds]) as $image) {
    $productImages[$image->product_id][] = $image->filename;
}

foreach ($products as $product) {
    $variantUrl = '';
    if ($prevProductId === $product->product_id) {
        $variantUrl = '?variant=' . $product->variant_id;
    }
    $prevProductId = $product->product_id;

    if ($product->currency_id > 0) {
        if ($product->rate_from != $product->rate_to) {
            $product->price = $product->price * $product->rate_to / $product->rate_from;
            $product->compare_price = $product->compare_price * $product->rate_to / $product->rate_from;
        }
        $price = round($product->price, 2);
        $oldPrice = round($product->compare_price, 2);
    } else {
        $price = round($turbo->money->convert($product->price, $mainCurrency->id, false), 2);
        $oldPrice = round($turbo->money->convert($product->compare_price, $mainCurrency->id, false), 2);
    }

    $oldPrice = ($oldPrice > 0 ? "<oldprice>$oldPrice</oldprice>" : '');

    print "
    <offer id='{$product->variant_id}' type='vendor.model' available='" . ($product->stock > 0 || $product->stock === null ? 'true' : 'false') . "'>
        <url>" . $turbo->config->root_url . '/products/' . $product->url . $variantUrl . "</url>
        <price>$price</price>
        $oldPrice
        <currencyId>{$currencyCode}</currencyId>
        <categoryId>{$product->category_id}</categoryId>";

    if (!empty($productImages[$product->product_id])) {
        foreach ($productImages[$product->product_id] as $img) {
            print "<picture>" . $turbo->design->resizeModifier($img, 800, 600) . "</picture>";
        }
    }

    print "
        <store>" . ($turbo->settings->export_available_for_retail_store ? 'true' : 'false') . "</store>
        <pickup>" . ($turbo->settings->export_available_for_reservation ? 'true' : 'false') . "</pickup>
        <delivery>true</delivery>
        <vendor>{$product->vendor}</vendor>";

    if ($product->sku) {
        print "<vendorCode>" . $product->sku . "</vendorCode>";
    }

    print "<model>" . htmlspecialchars($product->product_name) . ($product->variant_name ? ' ' . htmlspecialchars($product->variant_name) : '') . "</model>
        <description>" . htmlspecialchars(strip_tags(($turbo->settings->export_short_description ? $product->body : $product->annotation))) . "</description>";

    if ($turbo->settings->export_sales_notes) {
        print "<sales_notes>" . htmlspecialchars(strip_tags($turbo->settings->export_sales_notes)) . "</sales_notes>";
    }

    print "
        <manufacturer_warranty>" . ($turbo->settings->export_has_manufacturer_warranty ? 'true' : 'false') . "</manufacturer_warranty>
        <seller_warranty>" . ($turbo->settings->export_has_seller_warranty ? 'true' : 'false') . "</seller_warranty>";

    if (!in_array($product->product_id, array_keys($features))) {
        $features[$product->product_id] = $turbo->features->getProductOptions(['product_id' => $product->product_id]);
    }

    if (!empty($features[$product->product_id])) {
        foreach ($features[$product->product_id] as $feature) {
            print "
                <param name='" . htmlspecialchars($feature->name) . "'>" . htmlspecialchars($feature->value) . "</param>";
        }
    }

    print "</offer>";
}

print "</offers>";
print "</shop></yml_catalog>";
