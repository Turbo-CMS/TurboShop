<?php

require_once 'api/Turbo.php';

$turbo = new Turbo();

header("Content-type: text/xml; charset=UTF-8");

echo "<?xml version='1.0'?>
    <rss xmlns:g='http://base.google.com/ns/1.0' version='2.0'>
    <channel>
    <title>" . $turbo->settings->site_name . "</title>
    <link>" . $turbo->config->root_url . "</link>
    <description>" . $turbo->settings->company_name . "</description>";

$currencies = $turbo->money->getCurrencies(['enabled' => 1]);
$allCurrencies = $turbo->money->getCurrencies();
$mainCurrency = reset($currencies);
$currencyCode = $mainCurrency->code;

$turbo->db->query("SET SQL_BIG_SELECTS=1");
$turbo->db->query(
       "SELECT v.price, v.id AS variant_id, p.name AS product_name, 
           v.name AS variant_name, v.position AS variant_position, 
           v.sku AS variant_sku, v.currency_id, p.id AS product_id, 
           p.url, p.annotation, pc.category_id, b.name AS brand, 
           i.filename AS image
    FROM __variants v 
    LEFT JOIN __products p ON v.product_id=p.id
    LEFT JOIN __brands b ON b.id = p.brand_id 
    LEFT JOIN __products_categories pc ON p.id = pc.product_id AND 
           pc.position=(SELECT MIN(position) FROM __products_categories 
           WHERE product_id=p.id LIMIT 1)	
    LEFT JOIN __images i ON p.id = i.product_id AND 
           i.position=(SELECT MIN(position) FROM __images 
           WHERE product_id=p.id LIMIT 1)	
    WHERE p.visible AND (v.stock > 0 OR v.stock IS NULL) AND p.to_export 
    GROUP BY v.id 
    ORDER BY p.id, v.position"
);

$prevProductId = null;

while ($product = $turbo->db->result()) {
       $variantUrl = '';
       if ($prevProductId === $product->product_id) {
              $variantUrl = '?variant=' . $product->variant_id;
       }
       $prevProductId = $product->product_id;

       if ($product->currency_id > 0) {
              $price = round(
                     $product->price * $allCurrencies[$product->currency_id]->rate_to / $allCurrencies[$product->currency_id]->rate_from,
                     2
              );
       } else {
              $price = round($turbo->money->convert($product->price, $mainCurrency->id, false), 2);
       }

       echo "<item>
            <g:id>" . $product->variant_id . "</g:id>
            <g:title>" . htmlspecialchars($product->product_name) . ($product->variant_name ? ' ' . htmlspecialchars($product->variant_name) : '') . "</g:title>
            <g:description>" . htmlspecialchars(strip_tags($product->annotation)) . "</g:description>
            <g:link>" . $turbo->config->root_url . '/products/' . $product->url . $variantUrl . "</g:link>";
       echo "<g:price>$price $currencyCode</g:price>
            <g:condition>new</g:condition>
            <g:availability>in stock</g:availability>";

       if ($product->image) {
              echo "<g:image_link>" . $turbo->design->resizeModifier($product->image, 1024, 768, 'w') . "</g:image_link>";
       }

       if ($product->brand) {
              echo "<g:brand>" . $product->brand . "</g:brand>";
       }

       if (!empty($product->variant_sku)) {
              echo "<g:mpn>" . htmlspecialchars($product->variant_sku) . "</g:mpn>";
       } else {
              echo "<g:mpn>$product->variant_id</g:mpn>";
       }

       echo "<g:adult>no</g:adult>";

       echo "</item>";
}
echo "</channel>
    </rss>";
