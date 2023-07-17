<?php

require_once 'api/Turbo.php';

class TemplatesAdmin extends Turbo
{
    public function fetch()
    {
        $mainDir = 'design/' . $this->settings->theme . '/';

        if ($this->request->get("dir")) {
            $subdir = $this->request->get('dir') . "/";
            $templatesDir = 'design/' . $this->settings->theme . '/html/' . $subdir . '/';
        } else {
            $templatesDir = 'design/' . $this->settings->theme . '/html/';
        }

        $templates = [];
        $folders = [];

        if ($handle = opendir($templatesDir)) {
            while (false !== ($file = readdir($handle))) {
                if (is_file($templatesDir . $file) && $file[0] != '.'  && pathinfo($file, PATHINFO_EXTENSION) == 'tpl') {
                    $templates[] = $file;
                }
            }

            closedir($handle);
            asort($templates);
        }

        if ($handle = opendir($templatesDir)) {
            while (false !== ($dir = readdir($handle))) {
                if (is_dir($templatesDir . $dir) && $dir[0] != '.') {
                    $folders[] = $dir;
                }
            }

            closedir($handle);
            asort($folders);
        }

        $templateFile = $this->request->get('file');

        if (!empty($templateFile) && pathinfo($templateFile, PATHINFO_EXTENSION) != 'tpl') {
            exit();
        }

        if (!isset($templateFile)) {
            $templateFile = reset($templates);
        }

        $this->design->assign('template_file', $templateFile);

        if (is_readable($templatesDir . $templateFile)) {
            $templateContent = file_get_contents($templatesDir . $templateFile);
            $this->design->assign('template_content', $templateContent);
        }

        if (!empty($templateFile) && !is_writable($templatesDir . $templateFile) && !is_file($mainDir . '/locked')) {
            $this->design->assign('message_error', 'permissions');
        } elseif (is_file($mainDir . '/locked')) {
            $this->design->assign('message_error', 'theme_locked');
        } else {
            $_SESSION['last_edited_template'] = $templateFile;
        }

        $this->design->assign('theme', $this->settings->theme);
        $this->design->assign('folders', $folders);
        $this->design->assign('templates', $templates);

        return $this->design->fetch('templates.tpl');
    }
}
