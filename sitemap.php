<?php

chdir(__DIR__);
require_once 'api/Turbo.php';

$turbo = new Turbo();

header('Content-type: text/xml; charset=UTF-8');

echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

$languages = $turbo->languages->languages();
$langLink = '';

if (!empty($languages)) {
    $firstLang = reset($languages);

    if (isset($_GET['lang_label'])) {
        $language = $turbo->languages->languages(array('id' => $turbo->languages->langId()));
    } else {
        $turbo->languages->setLangId($firstLang->id);
    }

    if (!empty($language) && is_object($language) && $language->id != $firstLang->id) {
        $langLink = $language->label . '/';
    }
}

$url = $turbo->config->root_url . '/' . $langLink;
$lastmod = date('Y-m-d');

echo "\t<url>\n";
echo "\t\t<loc>$url</loc>\n";
echo "\t\t<lastmod>$lastmod</lastmod>\n";
echo "\t\t<changefreq>daily</changefreq>\n";
echo "\t\t<priority>1.0</priority>\n";
echo "\t</url>\n";

foreach ($turbo->pages->getPages() as $page) {
    if ($page->visible && $page->url && $page->url != '404') {
        $url = $turbo->config->root_url . '/' . $langLink . esc($page->url);

        echo "\t<url>\n";
        echo "\t\t<loc>$url</loc>\n";

        if ($page->url == 'blog') {
            echo "\t\t<lastmod>" . date('Y-m-d', strtotime($turbo->settings->lastModifyPosts)) . "</lastmod>";
        } elseif ($page->url == 'faq') {
            echo "\t\t<lastmod>" . date('Y-m-d', strtotime($turbo->settings->lastModifyFAQ)) . "</lastmod>";
        } elseif ($page->url == 'reviews') {
            echo "\t\t<lastmod>" . date('Y-m-d', strtotime($turbo->settings->lastModifyReviews)) . "</lastmod>";
        } else {
            echo "\t\t<lastmod>" . date('Y-m-d', strtotime($page->last_modified)) . "</lastmod>";
        }

        echo "\t\t<changefreq>daily</changefreq>\n";
        echo "\t\t<priority>1.0</priority>\n";
        echo "\t</url>\n";
    }
}

foreach ($turbo->blog->getPosts(array('visible' => 1)) as $post) {
    $url = $turbo->config->root_url . '/' . $langLink . 'blog/' . esc($post->url);

    echo "\t<url>\n";
    echo "\t\t<loc>$url</loc>\n";
    echo "\t\t<lastmod>" . date('Y-m-d', strtotime($post->last_modified)) . "</lastmod>";
    echo "\t\t<changefreq>daily</changefreq>\n";
    echo "\t\t<priority>1.0</priority>\n";
    echo "\t</url>\n";
}

foreach ($turbo->articlesCategories->getArticlesCategories() as $category) {
    if ($category->visible) {
        $url = $turbo->config->root_url . '/' . $langLink . 'articles/' . esc($category->url);

        echo "\t<url>" . "\n";
        echo "\t\t<loc>$url</loc>" . "\n";
        echo "\t\t<lastmod>" . date('Y-m-d', strtotime($category->last_modified)) . "</lastmod>";
        echo "\t\t<changefreq>daily</changefreq>\n";
        echo "\t\t<priority>1.0</priority>\n";
        echo "\t</url>\n";
    }
}

$turbo->db->query("SELECT url, last_modified FROM __articles WHERE visible=1");

foreach ($turbo->db->results() as $article) {
    $url = $turbo->config->root_url . '/' . $langLink . 'article/' . esc($article->url);

    echo "\t<url>\n";
    echo "\t\t<loc>$url</loc>\n";
    echo "\t\t<lastmod>" . date('Y-m-d', strtotime($article->last_modified)) . "</lastmod>";
    echo "\t\t<changefreq>daily</changefreq>\n";
    echo "\t\t<priority>1.0</priority>\n";
    echo "\t</url>\n";
}

foreach ($turbo->categories->getCategories() as $category) {
    if (isset($category->visible) && $category->visible) {
        $url = $turbo->config->root_url . '/' . $langLink . 'catalog/' . esc($category->url);

        echo "\t<url>\n";
        echo "\t\t<loc>$url</loc>\n";
        echo "\t\t<lastmod>" . date('Y-m-d', strtotime($category->last_modified)) . "</lastmod>";
        echo "\t\t<changefreq>daily</changefreq>\n";
        echo "\t\t<priority>1.0</priority>\n";
        echo "\t</url>\n";
    }
}

foreach ($turbo->brands->getBrands() as $brand) {
    $url = $turbo->config->root_url . '/' . $langLink . 'brands/' . esc($brand->url);

    echo "\t<url>\n";
    echo "\t\t<loc>$url</loc>\n";
    echo "\t\t<lastmod>" . date('Y-m-d', strtotime($brand->last_modified)) . "</lastmod>";
    echo "\t\t<changefreq>daily</changefreq>\n";
    echo "\t\t<priority>1.0</priority>\n";
    echo "\t</url>\n";
}

$turbo->db->query("SELECT url, last_modified FROM __products WHERE visible=1");

foreach ($turbo->db->results() as $product) {
    $url = $turbo->config->root_url . '/' . $langLink . 'products/' . esc($product->url);

    echo "\t<url>\n";
    echo "\t\t<loc>$url</loc>\n";
    echo "\t\t<lastmod>" . date('Y-m-d', strtotime($product->last_modified)) . "</lastmod>";
    echo "\t\t<changefreq>weekly</changefreq>\n";
    echo "\t\t<priority>0.5</priority>\n";
    echo "\t</url>\n";
}

echo '</urlset>' . "\n";

function esc($s)
{
    return htmlspecialchars($s, ENT_QUOTES, 'UTF-8');
}
