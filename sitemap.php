<?php

chdir(__DIR__);
require_once('api/Turbo.php');
$turbo = new Turbo();

header("Content-type: text/xml; charset=UTF-8");
print '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
print '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

$languages = $turbo->languages->languages();
$lang_link = '';
if (!empty($languages)) {
	$first_lang = reset($languages);
	if ($_GET['lang_label']) {
		$language = $turbo->languages->languages(array('id' => $turbo->languages->lang_id()));
	} else {
		$turbo->languages->set_lang_id($first_lang->id);
	}
	if (!empty($language) && is_object($language) && $language->id != $first_lang->id) {
		$lang_link = $language->label . '/';
	}
}

// Main page
$url = $turbo->config->root_url . '/' . $lang_link;
$lastmod = date("Y-m-d");
print "\t<url>" . "\n";
print "\t\t<loc>$url</loc>" . "\n";
print "\t\t<lastmod>$lastmod</lastmod>" . "\n";
print "\t\t<changefreq>daily</changefreq>" . "\n";
print "\t\t<priority>1.0</priority>" . "\n";
print "\t</url>" . "\n";

// Pages
foreach ($turbo->pages->get_pages() as $p) {
	if ($p->visible && $p->url && $p->url != '404') {
		$url = $turbo->config->root_url . '/' . $lang_link . esc($p->url);
		print "\t<url>" . "\n";
		print "\t\t<loc>$url</loc>" . "\n";
		if ($p->url == 'blog') {
			print "\t\t<lastmod>" . date('Y-m-d', strtotime($turbo->settings->lastModifyPosts)) . "</lastmod>";
		} elseif ($p->url == 'faq') {
			print "\t\t<lastmod>" . date('Y-m-d', strtotime($turbo->settings->lastModifyFAQ)) . "</lastmod>";
		} elseif ($p->url == 'reviews') {
			print "\t\t<lastmod>" . date('Y-m-d', strtotime($turbo->settings->lastModifyReviews)) . "</lastmod>";
		} else {
			print "\t\t<lastmod>" . date('Y-m-d', strtotime($p->last_modified)) . "</lastmod>";
		}
		print "\t\t<changefreq>daily</changefreq>" . "\n";
		print "\t\t<priority>1.0</priority>" . "\n";
		print "\t</url>" . "\n";
	}
}

// Blog
foreach ($turbo->blog->get_posts(array('visible' => 1)) as $p) {
	$url = $turbo->config->root_url . '/' . $lang_link . 'blog/' . esc($p->url);
	print "\t<url>" . "\n";
	print "\t\t<loc>$url</loc>" . "\n";
	print "\t\t<lastmod>" . date('Y-m-d', strtotime($p->last_modified)) . "</lastmod>";
	print "\t\t<changefreq>daily</changefreq>" . "\n";
	print "\t\t<priority>1.0</priority>" . "\n";
	print "\t</url>" . "\n";
}

// Categories articles
foreach ($turbo->articles_categories->get_articles_categories() as $c) {
	if ($c->visible) {
		$url = $turbo->config->root_url . '/' . $lang_link . 'articles/' . esc($c->url);
		print "\t<url>" . "\n";
		print "\t\t<loc>$url</loc>" . "\n";
		print "\t\t<lastmod>" . date('Y-m-d', strtotime($c->last_modified)) . "</lastmod>";
		print "\t\t<changefreq>daily</changefreq>" . "\n";
		print "\t\t<priority>1.0</priority>" . "\n";
		print "\t</url>" . "\n";
	}
}

// Articles
$turbo->db->query("SELECT url, last_modified FROM __articles WHERE visible=1");
foreach ($turbo->db->results() as $p) {
	$url = $turbo->config->root_url . '/' . $lang_link . 'article/' . esc($p->url);
	print "\t<url>" . "\n";
	print "\t\t<loc>$url</loc>" . "\n";
	print "\t\t<lastmod>" . date('Y-m-d', strtotime($p->last_modified)) . "</lastmod>";
	print "\t\t<changefreq>daily</changefreq>" . "\n";
	print "\t\t<priority>1.0</priority>" . "\n";
	print "\t</url>" . "\n";
}

// Categories
foreach ($turbo->categories->get_categories() as $c) {
	if ($c->visible) {
		$url = $turbo->config->root_url . '/' . $lang_link . 'catalog/' . esc($c->url);
		print "\t<url>" . "\n";
		print "\t\t<loc>$url</loc>" . "\n";
		print "\t\t<lastmod>" . date('Y-m-d', strtotime($c->last_modified)) . "</lastmod>";
		print "\t\t<changefreq>daily</changefreq>" . "\n";
		print "\t\t<priority>1.0</priority>" . "\n";
		print "\t</url>" . "\n";
	}
}

// Brands
foreach ($turbo->brands->get_brands() as $b) {
	$url = $turbo->config->root_url . '/' . $lang_link . 'brands/' . esc($b->url);
	print "\t<url>" . "\n";
	print "\t\t<loc>$url</loc>" . "\n";
	print "\t\t<lastmod>" . date('Y-m-d', strtotime($b->last_modified)) . "</lastmod>";
	print "\t\t<changefreq>daily</changefreq>" . "\n";
	print "\t\t<priority>1.0</priority>" . "\n";
	print "\t</url>" . "\n";
}

// Products
$turbo->db->query("SELECT url, last_modified FROM __products WHERE visible=1");
foreach ($turbo->db->results() as $p) {
	$url = $turbo->config->root_url . '/' . $lang_link . 'products/' . esc($p->url);
	print "\t<url>" . "\n";
	print "\t\t<loc>$url</loc>" . "\n";
	print "\t\t<lastmod>" . date('Y-m-d', strtotime($p->last_modified)) . "</lastmod>";
	print "\t\t<changefreq>weekly</changefreq>" . "\n";
	print "\t\t<priority>0.5</priority>" . "\n";
	print "\t</url>" . "\n";
}

print '</urlset>' . "\n";

function esc($s)
{
	return (htmlspecialchars($s, ENT_QUOTES, 'UTF-8'));
}
