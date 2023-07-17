<?php
require_once 'api/Turbo.php';
$turbo = new Turbo();

header("Content-type: application/rss+xml; charset=UTF-8");
echo '<?xml version="1.0" encoding="utf-8"?>';
echo '<rss xmlns:g="http://base.google.com/ns/1.0"
    xmlns:media="http://search.yahoo.com/mrss/"
    version="2.0">';
echo '<channel>';
echo '<turbo:cms_plugin>B72BDECFC64B5820494C626D5455F4B2</turbo:cms_plugin>';
echo '<title>' . htmlspecialchars($turbo->settings->site_name) . '</title>';
echo '<link>' . $turbo->config->root_url . '</link>';
echo '<description>' . htmlspecialchars($turbo->settings->site_name) . '</description>';

$filter['visible'] = 1;
$rss = $turbo->blog->getPosts($filter);
$languages = $turbo->languages->languages();
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

foreach ($rss as $r) {
	echo '<item turbo="true">';
	echo '<title>' . htmlspecialchars($r->name) . '</title>';
	echo '<link>' . $turbo->config->root_url . '/' . $langLink . 'blog/' . $r->url . '</link>';
	echo '<turbo:topic>' . htmlspecialchars($r->name) . '</turbo:topic>';
	echo '<turbo:source>' . $turbo->config->root_url . '/' . $langLink . 'blog/' . $r->url . '</turbo:source>';
	echo '<pubDate>' . $r->last_modified . '</pubDate>';
	echo '<turbo:content><![CDATA[';

	if (!empty($r->image)) {
		echo '<figure><img src="' . $turbo->design->resizePostsModifier($r->image, 400, 400, false) . '"/></figure>';
	}

	if (!empty($r->text)) {
		$content = $r->text;
	} elseif (!empty($r->annotation)) {
		$content = $r->annotation;
	} elseif (!empty($r->meta_description)) {
		$content = $r->meta_description;
	}

	if (!empty($content)) {
		$content = preg_replace('/[\x00-\x1F\x7F]/u', '', $content);
		$content = preg_replace('/«/', '"', $content);
		$content = preg_replace('/»/', '"', $content);
		$content = preg_replace('/&nbsp;/', ' ', $content);
		$content = preg_replace('/&mdash;/', '-', $content);
		$content = preg_replace('/&amp;/', '&', $content);
		$content = preg_replace('/&lt;/', '<', $content);
		$content = preg_replace('/&gt;/', '>', $content);
		$content = preg_replace('/^\s*\/\/<!\[CDATA\[([\s\S]*)\/\/\]\]>\s*\z/', '$1', $content);
		$content = preg_replace('/<!--(.|\s)*?-->/', '', $content);
		$content = preg_replace('#&[^\s]([^\#])(?![a-z1-4]{1,10};)#i', '&#x26;$1', $content);

		$content = preg_replace('/(<img\s(.+?)\/?>)/is', '<figure>$1</figure>', $content);
		$pattern = "/<iframe title=\"(.*?)\"(.*?) allow=\"(.*?)\"(.*?)><\/iframe>/i";
		$replacement = '<iframe$2 allowfullscreen="true"></iframe>';
		$content = preg_replace($pattern, $replacement, $content);

		echo $content;
	}

	if (!empty($r->text)) {
		echo '<button formaction="' . $turbo->config->root_url . '/' . $langLink . 'blog/' . $r->url . '" data-background-color="#0893b9" data-color="#ffffff" data-turbo="false" data-primary="true">&#129122;</button>';
	}

	echo ']]></turbo:content>';

	echo '</item>';
}
echo ' </channel></rss>';
