<?php

require_once('api/Turbo.php');
$turbo = new Turbo();

header("Content-type: text/xml; charset=UTF-8");
print(pack('CCC', 0xef, 0xbb, 0xbf));
// Header 
print
	"<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE yml_catalog SYSTEM 'shops.dtd'>
<yml_catalog date='" . date('Y-m-d H:i') . "'>
<shop>
<name>" . $turbo->settings->site_name . "</name>
<company>" . $turbo->settings->company_name . "</company>
<url>" . $turbo->config->root_url . "</url>
<platform>TurboCMS</platform>
<version>" . $turbo->config->version . "</version>
";

// Currencies
$currencies = $turbo->money->get_currencies(array('enabled' => 1));
$main_currency = reset($currencies);
print "<currencies>
";
foreach ($currencies as $c)
	if ($c->enabled)
		print "<currency id='" . $c->code . "' rate='" . $c->rate_to / $c->rate_from * $main_currency->rate_from / $main_currency->rate_to . "'/>
";
print "</currencies>
";


// Categories
$categories = $turbo->categories->get_categories();
print "<categories>
";
foreach ($categories as $c) {
	print "<category id='$c->id'";
	if ($c->parent_id > 0)
		print " parentId='$c->parent_id'";
	print ">" . htmlspecialchars($c->name) . "</category>
";
}
print "</categories>
";

$features = array();
$stock_filter = $turbo->settings->export_export_not_in_stock ? '' : ' AND (v.stock >0 OR v.stock is NULL) ';
$price_filter = $turbo->settings->export_no_export_without_price ? ' AND v.price >0 ' : '';

// Products
$turbo->db->query("SET SQL_BIG_SELECTS=1");
$turbo->db->query("SELECT 
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
		$stock_filter 
	GROUP BY v.id 
	ORDER BY p.id, v.position ");
print "<offers>
";

$currency_code = reset($currencies)->code;
$prev_product_id = null;

$products = $turbo->db->results();
$p_ids = array();
foreach ($products as $p) {
	if (!in_array($p->product_id, $p_ids)) {
		$p_ids[] = $p->product_id;
	}
}
$p_images = array();
foreach ($turbo->products->get_images(array('product_id' => $p_ids)) as $image) {
	$p_images[$image->product_id][] = $image->filename;
}

foreach ($products as $p) {
	$variant_url = '';
	if ($prev_product_id === $p->product_id) {
		$variant_url = '?variant=' . $p->variant_id;
	}
	$prev_product_id = $p->product_id;

	//if the variant currency is set - transfer to the main one
	if ($p->currency_id > 0) {
		if ($p->rate_from != $p->rate_to) {
			$p->price = $p->price * $p->rate_to / $p->rate_from;
			$p->compare_price = $p->compare_price * $p->rate_to / $p->rate_from;
		}
		$price = round($p->price, 2);
		$old_price = round($p->compare_price, 2);
	} else {
		$price = round($turbo->money->convert($p->price, $main_currency->id, false), 2);
		$old_price = round($turbo->money->convert($p->compare_price, $main_currency->id, false), 2);
	}
	$old_price = ($old_price > 0 ? "<oldprice>$old_price</oldprice>" : '');
	print
		"
	<offer id='$p->variant_id' type='vendor.model' available='" . ($p->stock > 0 || $p->stock === null ? 'true' : 'false') . "'>
	<url>" . $turbo->config->root_url . '/products/' . $p->url . $variant_url . "</url>";
	print "
	<price>$price</price>
	$old_price
	<currencyId>" . $currency_code . "</currencyId>
	<categoryId>" . $p->category_id . "</categoryId>
	";

	if (!empty($p_images[$p->product_id])) {
		foreach ($p_images[$p->product_id] as $img) {
			print "<picture>" . $turbo->design->resize_modifier($img, 800, 600) . "</picture>";
		}
	}

	print "
	<store>" . ($turbo->settings->export_available_for_retail_store ? 'true' : 'false') . "</store>
	<pickup>" . ($turbo->settings->export_available_for_reservation ? 'true' : 'false') . "</pickup>
	<delivery>true</delivery>
	<vendor>$p->vendor</vendor>
	" . ($p->sku ? '<vendorCode>' . $p->sku . '</vendorCode>' : '') . "
	";

	print "<model>" . htmlspecialchars($p->product_name) . ($p->variant_name ? ' ' . htmlspecialchars($p->variant_name) : '') . "</model>
	<description>" . htmlspecialchars(strip_tags(($turbo->settings->export_short_description ? $p->body : $p->annotation))) . "</description>
	" . ($turbo->settings->export_sales_notes ? "<sales_notes>" . htmlspecialchars(strip_tags($turbo->settings->export_sales_notes)) . "</sales_notes>" : "") . "
	";

	print "
	<manufacturer_warranty>" . ($turbo->settings->export_has_manufacturer_warranty ? 'true' : 'false') . "</manufacturer_warranty>
	<seller_warranty>" . ($turbo->settings->export_has_seller_warranty ? 'true' : 'false') . "</seller_warranty>
	";

	if (!in_array($p->product_id, array_keys($features))) {
		$features[$p->product_id] = $turbo->features->get_product_options(array('product_id' => $p->product_id));
	}
	if (!empty($features[$p->product_id])) {
		foreach ($features[$p->product_id] as $feature) {
			print "
			<param name='" . htmlspecialchars($feature->name) . "'>" . htmlspecialchars($feature->value) . "</param>
			";
		}
	}
	print "</offer>";
}

print "</offers>
";
print "</shop>
</yml_catalog>
";
