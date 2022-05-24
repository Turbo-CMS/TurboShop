<?php

require_once('api/Turbo.php');
$turbo = new Turbo();

header("Content-type: text/xml; charset=UTF-8");

// Header
print
	"<?xml version='1.0'?>
<rss xmlns:g='http://base.google.com/ns/1.0' version='2.0'>

<channel>
<title>" . $turbo->settings->site_name . "</title>
<link>" . $turbo->config->root_url . "</link>
<description>" . $turbo->settings->company_name . "</description>
";

// Currencies
$currencies = $turbo->money->get_currencies(array('enabled' => 1));
$all_currencies = $turbo->money->get_currencies();
$main_currency = reset($currencies);
$currency_code = $main_currency->code;

// Categories (1)
/*$categories = array();
foreach($turbo->categories->get_categories() as $c){
  $categories[$c->id][] = $c->name;
  $parent_categories[$c->id][] = $c->parent_id;
}*/

// Products
$turbo->db->query("SET SQL_BIG_SELECTS=1");
// Products
$turbo->db->query("SELECT v.price, v.id as variant_id, p.name as product_name, v.name as variant_name, v.position as variant_position, v.sku AS variant_sku, v.currency_id, p.id as product_id, p.url, p.annotation, pc.category_id, b.name AS brand, i.filename as image
					FROM __variants v LEFT JOIN __products p ON v.product_id=p.id
					LEFT JOIN __brands b ON b.id = p.brand_id 
					LEFT JOIN __products_categories pc ON p.id = pc.product_id AND pc.position=(SELECT MIN(position) FROM __products_categories WHERE product_id=p.id LIMIT 1)	
					LEFT JOIN __images i ON p.id = i.product_id AND i.position=(SELECT MIN(position) FROM __images WHERE product_id=p.id LIMIT 1)	
					WHERE p.visible AND (v.stock >0 OR v.stock is NULL) AND p.to_export GROUP BY v.id ORDER BY p.id, v.position ");

// In the loop, we use not results(), but result(), that is, we select products from the database one at a time,
// so we don't need them at the same time - we still immediately send the goods for withdrawal.
// Thus, memory is used for only one product 
$prev_product_id = null;
while ($p = $turbo->db->result()) {
	$variant_url = '';
	if ($prev_product_id === $p->product_id)
		$variant_url = '?variant=' . $p->variant_id;
	$prev_product_id = $p->product_id;

	if ($p->currency_id > 0) {
		$price = round($p->price * $all_currencies[$p->currency_id]->rate_to / $all_currencies[$p->currency_id]->rate_from, 2);
	} else {
		$price = round($turbo->money->convert($p->price, $main_currency->id, false), 2);
	}

	print
		"
	<item>
		<g:id>" . $p->variant_id . "</g:id>
		<g:title>" . htmlspecialchars($p->product_name) . ($p->variant_name ? ' ' . htmlspecialchars($p->variant_name) : '') . "</g:title>
		<g:description>" . htmlspecialchars(strip_tags($p->annotation)) . "</g:description>
		<g:link>" . $turbo->config->root_url . '/products/' . $p->url . $variant_url . "</g:link>";
	print "
		<g:price>$price $currency_code</g:price>
		<g:condition>new</g:condition>
		<g:availability>in stock</g:availability>
		";
	if ($p->image)
		print "<g:image_link>" . $turbo->design->resize_modifier($p->image, 1024, 768, 'w') . "</g:image_link>
		";
	if ($p->brand)
		print "<g:brand>" . $p->brand . "</g:brand>";

	// Categories (2)
	/*if(isset($categories[$p->category_id])){
			$c = $categories[$p->category_id];
		}	

		if(isset($parent_categories[$p->category_id])){
			$parent_id = $parent_categories[$p->category_id];
			$p_id = $parent_id[0];
			$parentc = $categories[$p_id];
		}	

		if(!empty($parentc[0]))
			$path = htmlspecialchars($parentc[0]).' &gt; '.htmlspecialchars($c[0]);
		else
			$path = htmlspecialchars($c[0]);

		if(!empty($path))
			print "<g:product_type>$path</g:product_type>";*/
	// Categories @ (2)

	if (!empty($p->variant_sku))
		print "<g:mpn>$p->variant_sku</g:mpn>";
	else
		print "<g:mpn>$p->variant_id</g:mpn>";

	print "<g:adult>no</g:adult>";

	print "</item>";
}
print "</channel>
";

print "</rss>
";
