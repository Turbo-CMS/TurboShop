<?php
require_once('api/Turbo.php');
$turbo = new Turbo();

header("Content-type: application/rss+xml; charset=UTF-8");
print '<?xml version="1.0" encoding="utf-8"?>';
print '<rss 
	xmlns:g="http://base.google.com/ns/1.0">
    xmlns:media="http://search.yahoo.com/mrss/"
    version="2.0">
';
print '<channel>';
print '<turbo:cms_plugin>B72BDECFC64B5820494C626D5455F4B2</turbo:cms_plugin>';
print '<title>' . htmlspecialchars($turbo->settings->site_name) . '</title>';
print '<link>' . $turbo->config->root_url . '</link>';
print '<description>' . htmlspecialchars($turbo->settings->site_name) . '</description>';

$filter['visible'] = 1;
$rss = $turbo->blog->get_posts($filter);

foreach ($rss as $r) {
	print '<item turbo="true">';
	print '<title>' . htmlspecialchars($r->name) . '</title>';
	print '<link>' . $turbo->config->root_url . '/blog/' . $r->url . '</link>';
	print '<turbo:topic>' . htmlspecialchars($r->name) . '</turbo:topic>';
	print '<turbo:source>' . $turbo->config->root_url . '/blog/' . $r->url . '</turbo:source>';
	print '<pubDate>' . $r->last_modified . '</pubDate>'; // D, d M Y H:i:s +0000
	print '<turbo:content><![CDATA[';

	// Display image
	if (!empty($r->image)) {
		print '<figure><img src="' . $turbo->design->resize_posts_modifier($r->image, 400, 400, false) . '"/></figure>';
	}

	if (!empty($r->text)) {
		$content = $r->text;
	} elseif (!empty($r->annotation)) {
		$content = $r->annotation;
	} elseif (!empty($r->meta_description)) {
		$content = $r->meta_description;
	}

	if (!empty($content)) {
		// Decoding special characters
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
		// add alt if it is not present at all in the img tag
		/*$pattern = "/<img(?!([^>]*\b)alt=)([^>]*?)>/i";
			$replacement = '<img alt="'.htmlspecialchars($r->name).'"$1$2>';
			$content = preg_replace( $pattern, $replacement, $content );*/
		// set alt to post name if empty
		/*$pattern = "/<img alt=\"\" (.*?) \/>/i";
			$replacement = '<img alt="'.htmlspecialchars($r->name).'" $1 />';
			$content = preg_replace($pattern, $replacement, $content);*/
		// wrap images in figure
		$content = preg_replace('/(<img\s(.+?)\/?>)/is', '<figure>$1</figure>', $content);
		// convert iframe from video
		$pattern = "/<iframe title=\"(.*?)\"(.*?) allow=\"(.*?)\"(.*?)><\/iframe>/i";
		$replacement = '<iframe$2 allowfullscreen="true"></iframe>';
		$content = preg_replace($pattern, $replacement, $content);

		print $content;
	}

	if (!empty($r->text)) {
		print '<button formaction="' . $turbo->config->root_url . '/blog/' . $r->url . '" data-background-color="#0893b9" data-color="#ffffff" data-turbo="false" data-primary="true" >Полная версия ...</button>';
	}

	print ']]></turbo:content>';

	print '</item>';
}
print ' </channel></rss>';
