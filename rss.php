<?php

require_once 'api/Turbo.php';
$turbo = new Turbo();

$siteName    = $turbo->settings->site_name;
$rootUrl     = $turbo->config->root_url;
$companyName = $turbo->settings->company_name;
$lang        = 'en';
$dateRss     = 'D, d M Y H:i:s O';

print <<<HEAD
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:g="http://base.google.com/ns/1.0">
	 xmlns:media="http://search.yahoo.com/mrss/"
	 version="2.0">
	<channel>
		<turbo:cms_plugin>88AC70EEFE360CBE79E901D7CF751783</turbo:cms_plugin>
		<title>$siteName</title>
		<link>$rootUrl</link>
		<language>$lang</language>
HEAD;

$turbo->db->query(
    "SELECT 
        v.price, 
        v.id AS variant_id, 
        p.name AS product_name, 
        v.name AS variant_name, 
        v.position AS variant_position, 
        p.id AS product_id, 
        p.url, 
        p.annotation, 
        p.body, 
        pc.category_id, 
        i.filename AS image,
        p.created,
        c.name AS cat_name
    FROM 
        __variants v 
        LEFT JOIN __products p ON v.product_id=p.id
        LEFT JOIN __products_categories pc ON (
            p.id=pc.product_id 
            AND pc.position=(
                SELECT MIN(position) FROM __products_categories WHERE product_id=p.id LIMIT 1
            )
        )
        LEFT JOIN __categories c ON pc.category_id = c.id
        LEFT JOIN __images i ON (
            p.id=i.product_id 
            AND i.position=(
                SELECT MIN(position) FROM __images WHERE product_id=p.id LIMIT 1
            )	
        )
    WHERE 
        p.visible 
        AND (v.stock >0 OR v.stock IS NULL) 
        AND p.id 
    ORDER BY 
        p.id, 
        v.position"
);

$prevProductId = null;

while ($product = $turbo->db->result()) {
    $variantUrl = '';

    if ($prevProductId === $product->product_id) {
        $variantUrl = '?variant=' . $product->variant_id;
    }

    $prevProductId = $product->product_id;
    $productLink = $rootUrl . '/products/' . $product->url . $variantUrl;
    $productDate = date($dateRss, strtotime($product->created));
    $productText = ($product->annotation !== '') ? $product->annotation : $product->body;
    $productH1   = $product->product_name;
    $productH2   = $product->cat_name;
    $productImgUrl = $turbo->design->resizeModifier($product->image, 800, 600, false);

    print <<<ITEM
    <item turbo="true">
        <title>$product->product_name</title>
        <link>$productLink</link>
        <turbo:content><![CDATA[
            <header>
                <h1>$productH1</h1>
                <h2>$productH2</h2>
                <figure><img src="$productImgUrl"/></figure>
            </header>
            <div>$productText</div>
        ]]></turbo:content>
        <pubDate>$productDate</pubDate>
        <category>$product->cat_name</category>
    </item>
ITEM;
}

$turbo->db->query("SELECT * FROM __categories c WHERE c.visible");

while ($category = $turbo->db->result()) {
    $categoryLink = $rootUrl . '/catalog/' . $category->url;
    $categoryDate = date($dateRss);
    $categoryText = $category->description;
    $categoryH1   = $category->name;

    $categoryContent = "<header><h1>$categoryH1</h1>";

    if ($category->image) {
        $categoryImgUrl = $turbo->design->resizeCatalogModifier($category->image, 800, 600, false, $turbo->config->resized_category_images_dir);
        $categoryContent .= "<figure><img src=\"$categoryImgUrl\"/></figure>";
    }

    $categoryContent .= "</header><div>$categoryText</div>";

    print <<<ITEM
    <item turbo="true">
        <title>$category->name</title>
        <link>$categoryLink</link>
        <turbo:content><![CDATA[$categoryContent]]></turbo:content>
        <pubDate>$categoryDate</pubDate>
    </item>
ITEM;
}

$turbo->db->query("SELECT * FROM __pages p WHERE p.visible");
while ($page = $turbo->db->result()) {
    $pageLink = $rootUrl . $page->url;
    $pageDate = date($dateRss);
    $pageText = $page->body;
    $pageH1   = $page->name;

    $pageContent = "<header><h1>$pageH1</h1></header><div>$pageText</div>";

    print <<<ITEM
    <item turbo="true">
        <title>$page->name</title>
        <link>$pageLink</link>
        <turbo:content><![CDATA[$pageContent]]></turbo:content>
        <pubDate>$pageDate</pubDate>
    </item>
ITEM;
}

$turbo->db->query("SELECT * FROM __blog b WHERE b.visible");

while ($blog = $turbo->db->result()) {
    $blogLink       = $rootUrl . '/blog/' . $blog->url;
    $blogDate       = date($dateRss, strtotime($blog->date));
    $blogText       = ($blog->annotation !== '') ? $blog->annotation : $blog->description;
    $blogH1         = $blog->name;
    $blogImgUrl     = $turbo->design->resizePostsModifier($blog->image, 800, 600, false);

    print <<<ITEM
    <item turbo="true">
        <title>$blog->name</title>
        <link>$blogLink</link>
        <turbo:content><![CDATA[
            <header>
                <h1>$blogH1</h1>
                <figure><img src="$blogImgUrl"/></figure>
            </header>
            <div>$blogText</div>
        ]]></turbo:content>
        <pubDate>$blogDate</pubDate>
    </item>
ITEM;
}

$turbo->db->query("SELECT * FROM __articles_categories c WHERE c.visible");

while ($category = $turbo->db->result()) {
    $categoryLink = $rootUrl . '/articles/' . $category->url;
    $categoryDate = date($dateRss);
    $categoryText = $category->description;
    $categoryH1   = $category->name;

    $categoryContent = "<header><h1>$categoryH1</h1>";

    if ($category->image) {
        $categoryImgUrl = $turbo->design->resizeCatalogModifier($category->image, 800, 600, false, $turbo->config->resized_category_images_dir);
        $categoryContent .= "<figure><img src=\"$categoryImgUrl\"/></figure>";
    }

    $categoryContent .= "</header><div>$categoryText</div>";

    print <<<ITEM
		<item turbo="true">
			<title>$category->name</title>
			<link>$categoryLink</link>
			<turbo:content>
				<![CDATA[$categoryContent]]>
			</turbo:content>
			<pubDate>$categoryDate</pubDate>
		</item>
ITEM;
}

$turbo->db->query("SELECT * FROM __articles a WHERE a.visible");

while ($articles = $turbo->db->result()) {
    $articlesLink = $rootUrl . '/article/' . $articles->url;
    $articlesDate = date($dateRss, strtotime($articles->date));
    $articlesText = ($articles->annotation !== '') ? $articles->annotation : $articles->text;
    $articlesH1   = $articles->name;
    $articlesImgUrl = $turbo->design->resizeArticlesModifier($articles->image, 800, 600, false, $turbo->config->resized_articles_images_dir);

    print <<<ITEM
		<item turbo="true">
			<title>$articles->name</title>
			<link>$articlesLink</link>
			<turbo:content><![CDATA[
                <header>
                    <h1>$articlesH1</h1>
                    <figure><img src="$articlesImgUrl"/></figure>
                </header>
                <div>$articlesText</div>
            ]]></turbo:content>
			<pubDate>$articlesDate</pubDate>
		</item>
ITEM;
}

print <<<END
	</channel>
</rss>
END;

die;
