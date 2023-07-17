<?php

require_once 'View.php';

class BrandsView extends View
{
    public function fetch()
    {
        $brands = $this->brands->getBrands();
        $this->design->assign('brands', $brands);

        if ($this->page) {
            $this->design->assign('meta_title', $this->page->meta_title);
            $this->design->assign('meta_keywords', $this->page->meta_keywords);
            $this->design->assign('meta_description', $this->page->meta_description);
        }

        $autoMeta = new stdClass();

        $autoMeta->title = $this->seo->page_meta_title ?: '';
        $autoMeta->keywords = $this->seo->page_meta_keywords ?: '';
        $autoMeta->description = $this->seo->page_meta_description ?: '';

        $autoMetaParts = [
            '{page}' => $this->page ? $this->page->header : '',
            '{site_url}' => $this->seo->am_url ?: '',
            '{site_name}' => $this->seo->am_name ?: '',
            '{site_phone}' => $this->seo->am_phone ?: '',
            '{site_email}' => $this->seo->am_email ?: '',
        ];

        $autoMeta->title = strtr($autoMeta->title, $autoMetaParts);
        $autoMeta->keywords = strtr($autoMeta->keywords, $autoMetaParts);
        $autoMeta->description = strtr($autoMeta->description, $autoMetaParts);

        $autoMeta->title = preg_replace("/\{.*\}/", '', $autoMeta->title);
        $autoMeta->keywords = preg_replace("/\{.*\}/", '', $autoMeta->keywords);
        $autoMeta->description = preg_replace("/\{.*\}/", '', $autoMeta->description);

        $this->design->assign('auto_meta', $autoMeta);

        if (isset($lastModifiedUnix)) {
            $lastModified = gmdate("D, d M Y H:i:s \G\M\T", $lastModifiedUnix);
            $ifModifiedSince = false;

            if (isset($_ENV['HTTP_IF_MODIFIED_SINCE'])) {
                $ifModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
            }

            if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE'])) {
                $ifModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
            }

            if ($ifModifiedSince && $ifModifiedSince >= $lastModifiedUnix) {
                header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
                exit;
            }

            header('Last-Modified: ' . $lastModified);
        }

        return $this->design->fetch('brands.tpl');
    }
}
