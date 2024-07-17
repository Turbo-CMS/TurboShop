<?php

require_once '../api/Turbo.php';

$turbo = new Turbo();

header("Content-Type: text/xml; charset=UTF-8");

print "<?xml version='1.0'?>
		<rss xmlns:g='http://base.google.com/ns/1.0' version='2.0'>
		<channel>
		<title>" . $turbo->settings->site_name . "</title>
		<link>" . $turbo->config->root_url . "</link>
		<description>" . $turbo->settings->company_name . "</description>";

$currencies = $turbo->money->getCurrencies(['enabled' => 1]);
$mainCurrency = reset($currencies);
$categories = $turbo->categories->getCategories();
$features = [];
$stockFilter = $turbo->settings->export_export_not_in_stock ? '' : ' AND (v.stock >0 OR v.stock is NULL) ';
$priceFilter = $turbo->settings->export_no_export_without_price ? ' AND v.price >0 ' : '';

$languages = $turbo->languages->languages();
$langLink = '';

if (!empty($languages)) {
	$firstLang = reset($languages);

	if (isset($_GET['lang_label'])) {
		$language = $turbo->languages->languages(['id' => $turbo->languages->langId()]);
	} else {
		$turbo->languages->setLangId($firstLang->id);
	}

	if (!empty($language) && is_object($language) && $language->id != $firstLang->id) {
		$langLink = $language->label . '/';
	}
}

$url = $turbo->config->root_url . '/' . $langLink;

$langId = $turbo->languages->langId();
$px = ($langId ? 'l' : 'p');
$fpx = ($langId ? 'lf' : 'v');
$bpx = ($langId ? 'lb' : 'b');

$langSqlProduct = $turbo->languages->getQuery(['object' => 'product', 'px_lang' => $px, 'px' => 'p']);
$langSqlVariant = $turbo->languages->getQuery(['object' => 'variant', 'px_lang' => $fpx, 'px' => 'v']);
$langSqlBrand = $turbo->languages->getQuery(['object' => 'brand', 'px_lang' => $bpx, 'px' => 'b']);

$turbo->db->query("SET SQL_BIG_SELECTS=1");
$turbo->db->query("
    SELECT 
        p.body, 
        CASE WHEN $langId THEN lb.name ELSE b.name END AS brand,
        v.stock, 
        (v.stock IS NULL) AS infinity, 
        v.compare_price, 
        v.sku, 
        v.price, 
        v.id AS variant_id, 
        p.name, 
        CASE WHEN $langId THEN lf.name ELSE v.name END AS variant_name,
        v.position as variant_position, 
        p.id AS product_id, 
        p.url, 
        p.annotation, 
        pc.category_id, 
        c.rate_from, 
        c.rate_to, 
        v.currency_id,
		$langSqlProduct->fields 
    FROM __variants v 
    LEFT JOIN __products p ON v.product_id=p.id
    LEFT JOIN __currencies AS c ON(c.id=v.currency_id)
    LEFT JOIN __products_categories pc ON p.id = pc.product_id AND pc.position=(SELECT MIN(position) FROM __products_categories WHERE product_id=p.id LIMIT 1)
    LEFT JOIN __brands b ON (b.id = p.brand_id)
		$langSqlProduct->join
		$langSqlVariant->join
		$langSqlBrand->join
    WHERE 1 
        AND p.visible
		AND p.to_xml 
        $stockFilter 
        $priceFilter 
    GROUP BY v.id 
    ORDER BY p.id, v.position
");

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
	} else {
		$price = round($turbo->money->convert($product->price, $mainCurrency->id, false), 2);
	}

	print "<item>
			<title>" . htmlspecialchars($product->name) . ($product->variant_name ? ' ' . htmlspecialchars($product->variant_name) : '') . "</title>
			<link>" . $url . 'products/' . $product->url . $variantUrl . "</link>
			<description>" . htmlspecialchars(strip_tags(($turbo->settings->export_short_description ? $product->body : $product->annotation))) . "</description>
			<g:id>" . $product->variant_id . "</g:id>";

	if (!empty($product->variant_sku)) {
		print "<g:mpn>" . htmlspecialchars($product->variant_sku) . "</g:mpn>";
	} else {
		print "<g:mpn>$product->variant_id</g:mpn>";
	}

	print "<g:condition>new</g:condition>
		   <g:price>$price $currencyCode</g:price>
		   <g:availability>in stock</g:availability>";

	if ($product->brand) {
		print "<g:brand>" . $product->brand . "</g:brand>";
	}

	print "<g:adult>false</g:adult>";

	if (!in_array($product->product_id, array_keys($features))) {
		$features[$product->product_id] = $turbo->features->getProductOptions(['product_id' => $product->product_id]);
	}

	if (!empty($features[$product->product_id])) {
		foreach ($features[$product->product_id] as $feature) {

			if ($feature->is_color) {
				continue;
			}

			print "<g:product_detail>
				   		<g:attribute_name>" . htmlspecialchars($feature->name) . "</g:attribute_name>
				   		<g:attribute_value>" . htmlspecialchars($feature->value) . "</g:attribute_value>
				   </g:product_detail>";
		}
	}

	if (isset($categories[$product->category_id])) {
		print "<g:product_type>" . $categories[$product->category_id]->name . "</g:product_type>";
	}

	if (!empty($productImages[$product->product_id])) {
		$imageCount = count($productImages[$product->product_id]);
		foreach ($productImages[$product->product_id] as $key => $img) {
			if ($key === 0 && $imageCount === 1) {
				print "<g:image_link>" . $turbo->design->resizeModifier($img, 1200, 1200) . "</g:image_link>";
			} elseif ($key === 0 && $imageCount > 1) {
				print "<g:image_link>" . $turbo->design->resizeModifier($img, 1200, 1200) . "</g:image_link>";
			} else {
				print "<g:additional_image_link>" . $turbo->design->resizeModifier($img, 1200, 1200) . "</g:additional_image_link>";
			}
		}
	}

	print "</item>";
}

print "</channel></rss>";
