<?php

require_once 'api/Turbo.php';

class SeoAdmin extends Turbo
{
    public function fetch()
    {
        if ($this->request->isMethod('post')) {
            $this->seo->update('am_url', $this->request->post('am_url'));
            $this->seo->update('am_name', $this->request->post('am_name'));
            $this->seo->update('am_phone', $this->request->post('am_phone'));
            $this->seo->update('am_email', $this->request->post('am_email'));
            $this->seo->update('category_meta_title', $this->request->post('category_meta_title'));
            $this->seo->update('category_brand_meta_title', $this->request->post('category_brand_meta_title'));
            $this->seo->update('brand_meta_title', $this->request->post('brand_meta_title'));
            $this->seo->update('product_meta_title', $this->request->post('product_meta_title'));
            $this->seo->update('page_meta_title', $this->request->post('page_meta_title'));
            $this->seo->update('post_meta_title', $this->request->post('post_meta_title'));
            $this->seo->update('category_article_meta_title', $this->request->post('category_article_meta_title'));
            $this->seo->update('article_meta_title', $this->request->post('article_meta_title'));
            $this->seo->update('category_meta_keywords', $this->request->post('category_meta_keywords'));
            $this->seo->update('category_brand_meta_keywords', $this->request->post('category_brand_meta_keywords'));
            $this->seo->update('brand_meta_keywords', $this->request->post('brand_meta_keywords'));
            $this->seo->update('product_meta_keywords', $this->request->post('product_meta_keywords'));
            $this->seo->update('page_meta_keywords', $this->request->post('page_meta_keywords'));
            $this->seo->update('post_meta_keywords', $this->request->post('post_meta_keywords'));
            $this->seo->update('category_article_meta_keywords', $this->request->post('category_article_meta__keywords'));
            $this->seo->update('article_meta_keywords', $this->request->post('article_meta_keywords'));
            $this->seo->update('category_meta_description', $this->request->post('category_meta_description'));
            $this->seo->update('category_brand_meta_description', $this->request->post('category_brand_meta_description'));
            $this->seo->update('brand_meta_description', $this->request->post('brand_meta_description'));
            $this->seo->update('product_meta_description', $this->request->post('product_meta_description'));
            $this->seo->update('page_meta_description', $this->request->post('page_meta_description'));
            $this->seo->update('post_meta_description', $this->request->post('post_meta_description'));
            $this->seo->update('category_article_meta_description', $this->request->post('category_article_meta_description'));
            $this->seo->update('article_meta_description', $this->request->post('article_meta_description'));
            $this->seo->seo_automation = $this->request->post('seo_automation');

            $this->design->assign('message_success', 'saved');
        }

        return $this->design->fetch('settings_seo.tpl');
    }
}
