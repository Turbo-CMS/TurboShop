<?php

/**
 * Turbo CMS
 *
 * This class uses the template main.tpl
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('View.php');

class MainView extends View
{

    function fetch()
    {
        if ($this->page) {
            $this->design->assign('meta_title', $this->page->meta_title);
            $this->design->assign('meta_keywords', $this->page->meta_keywords);
            $this->design->assign('meta_description', $this->page->meta_description);

            // Last-Modified
            $LastModified_unix = strtotime($this->page->last_modified); // time when the page was last modified
            $LastModified = gmdate("D, d M Y H:i:s \G\M\T", $LastModified_unix);
            $IfModifiedSince = false;
            if (isset($_ENV['HTTP_IF_MODIFIED_SINCE']))
                $IfModifiedSince = strtotime(substr($_ENV['HTTP_IF_MODIFIED_SINCE'], 5));
            if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']))
                $IfModifiedSince = strtotime(substr($_SERVER['HTTP_IF_MODIFIED_SINCE'], 5));
            if ($IfModifiedSince && $IfModifiedSince >= $LastModified_unix) {
                header($_SERVER['SERVER_PROTOCOL'] . ' 304 Not Modified');
                exit;
            }
            header('Last-Modified: ' . $LastModified);
        }

        return $this->design->fetch('main.tpl');
    }
}
