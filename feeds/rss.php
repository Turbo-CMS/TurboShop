<?php

require_once '../api/Turbo.php';

$turbo = new Turbo();

header("Content-type: text/xml; charset=UTF-8");

$languages = $turbo->languages->languages();

$langId = $turbo->languages->langId();
$langLabel = '';

if ($langId && $languages) {
	$langLabel = $languages[$langId]->label;
}

print '<?xml version="1.0" encoding="utf-8"?><rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:atom="http://www.w3.org/2005/Atom"><channel>';
print '<title>' . htmlspecialchars($turbo->settings->site_name) . '</title>';
print '<link>' . $turbo->config->root_url . '</link>';
print '<lastBuildDate>' . date("D, d M Y H:i:s O") . '</lastBuildDate>';
print '<language>' . $langLabel . '</language>';
print '<description>' . htmlspecialchars($turbo->settings->site_name) . '</description>';

$langLink = '';

if (!empty($languages)) {
	$firstLang = reset($languages);

	if (isset($_GET['lang_label'])) {
		$language = $turbo->languages->languages(array('id' => $turbo->languages->langId()));
	} else {
		$turbo->languages->setLangId($firstLang->id);
	}

	if (!empty($language) && is_object($language) && $language->id !== $firstLang->id) {
		$langLink = $language->label . '/';
	}
}

$url = $turbo->config->root_url . '/' . $langLink;

$filter['visible'] = 1;
$blog = $turbo->blog->getPosts($filter);

foreach ($blog as $b) {
	print '<item>';
	print '<title>' . htmlspecialchars($b->name) . '</title>';
	print '<link>' . $url .  'blog/' . $b->url . '</link>';
	print '<guid>' . $url .  'blog/' . $b->url . '</guid>';

	$imageUrl = $turbo->design->resizePostsModifier($b->image, 800, 600, false);
	$fileExtension = pathinfo($imageUrl, PATHINFO_EXTENSION);

	switch ($fileExtension) {
		case 'jpg':
		case 'jpeg':
			$mimeType = 'image/jpeg';
			break;
		case 'png':
			$mimeType = 'image/png';
			break;
		case 'gif':
			$mimeType = 'image/gif';
			break;
		default:
			$mimeType = 'application/octet-stream';
	}

	print '<enclosure url="' . $imageUrl . '" type="' . $mimeType . '"/>';
	print '<pubDate>' . date("D, d M Y H:i:s O", strtotime($b->date)) . '</pubDate>';

	if ($b->annotation) {
		print '<description><![CDATA[' . $b->annotation . ']]></description>';
	}

	if ($b->text) {
		print '<content:encoded><![CDATA[' . $b->text . ']]></content:encoded>';
	}

	print '</item>';
}

$articles = $turbo->articles->getArticles($filter);
$articlesCategories = $turbo->articlesCategories->getArticlesCategories();

foreach ($articles as $a) {
	print '<item>';
	print '<title>' . htmlspecialchars($a->name) . '</title>';
	print '<link>' . $url .  'article/' . $a->url . '</link>';
	print '<guid>' . $url .  'article/' . $a->url . '</guid>';

	if ($a->author) {
		print '<author>'. $a->author .'</author>';
	}

	if (isset($articlesCategories[$a->category_id])) {
		print '<category>' . $articlesCategories[$a->category_id]->name . '</category>';
	}

	$imageUrl = $turbo->design->resizeArticlesModifier($a->image, 800, 600, false);
	$fileExtension = pathinfo($imageUrl, PATHINFO_EXTENSION);

	switch ($fileExtension) {
		case 'jpg':
		case 'jpeg':
			$mimeType = 'image/jpeg';
			break;
		case 'png':
			$mimeType = 'image/png';
			break;
		case 'gif':
			$mimeType = 'image/gif';
			break;
		default:
			$mimeType = 'application/octet-stream';
	}

	print '<enclosure url="' . $imageUrl . '" type="' . $mimeType . '"/>';
	print '<pubDate>' . date("D, d M Y H:i:s O", strtotime($a->date)) . '</pubDate>';

	if ($a->annotation) {
		print '<description><![CDATA[' . $a->annotation . ']]></description>';
	}

	if ($a->text) {
		print '<content:encoded><![CDATA[' . $a->text . ']]></content:encoded>';
	}
	
	print '</item>';
}

print '</channel></rss>';
