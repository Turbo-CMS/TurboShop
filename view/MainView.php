<?php

require_once 'View.php';

class MainView extends View
{
    public function fetch()
    {
        if ($this->page) {
            // Meta Tags
            $this->design->assign('meta_title', $this->page->meta_title);
            $this->design->assign('meta_keywords', $this->page->meta_keywords);
            $this->design->assign('meta_description', $this->page->meta_description);

            // Last Modified
            $lastModifiedUnix = strtotime($this->page->last_modified);
            $lastModified = gmdate('D, d M Y H:i:s \G\M\T', $lastModifiedUnix);
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

        // Display
        return $this->design->fetch('main.tpl');
    }
}
