<?php

session_start();

require_once('../../api/Turbo.php');

$turbo = new Turbo();

// Session check to protect against xss
if (!$turbo->request->check_session()) {
    trigger_error('Session expired', E_USER_WARNING);
    exit();
}

$id = intval($turbo->request->post('id'));
$object = $turbo->request->post('object');
$values = $turbo->request->post('values');

switch ($object) {
    case 'product':
        if ($turbo->managers->access('products'))
            $result = $turbo->products->update_product($id, $values);
        break;
    case 'category':
        if ($turbo->managers->access('categories'))
            $result = $turbo->categories->update_category($id, $values);
        break;
    case 'brands':
        if ($turbo->managers->access('brands'))
            $result = $turbo->brands->update_brand($id, $values);
        break;
    case 'feature':
        if ($turbo->managers->access('features'))
            $result = $turbo->features->update_feature($id, $values);
        break;
    case 'page':
        if ($turbo->managers->access('pages'))
            $result = $turbo->pages->update_page($id, $values);
        break;
    case 'menu':
        if ($turbo->managers->access('menus'))
            $result = $turbo->pages->update_menu($id, $values);
        break;
    case 'blog':
        if ($turbo->managers->access('blog'))
            $result = $turbo->blog->update_post($id, $values);
        break;
    case 'articles_category':
        if ($turbo->managers->access('blog'))
            $result = $turbo->articles_categories->update_articles_category($id, $values);
        break;
    case 'articles':
        if ($turbo->managers->access('blog'))
            $result = $turbo->articles->update_article($id, $values);
        break;
    case 'delivery':
        if ($turbo->managers->access('delivery'))
            $result = $turbo->delivery->update_delivery($id, $values);
        break;
    case 'payment':
        if ($turbo->managers->access('payment'))
            $result = $turbo->payment->update_payment_method($id, $values);
        break;
    case 'currency':
        if ($turbo->managers->access('currency'))
            if (!empty($values['cents'])) {
                $values['cents'] = 2;
            }
        $result = $turbo->money->update_currency($id, $values);
        break;
    case 'comment':
        if ($turbo->managers->access('comments'))
            $result = $turbo->comments->update_comment($id, $values);
        break;
    case 'callback':
        if ($turbo->managers->access('callbacks'))
            $result = $turbo->callbacks->update_callback($id, $values);
        break;
    case 'subscribe':
        if ($turbo->managers->access('subscribes'))
            $result = $turbo->subscribes->update_subscribe($id, $values);
        break;
    case 'feedback':
        if ($turbo->managers->access('feedbacks'))
            $result = $turbo->feedbacks->update_feedback($id, $values);
        break;
    case 'faq':
        if ($turbo->managers->access('faq'))
            $result = $turbo->faq->update_faq($id, $values);
        break;
    case 'user':
        if ($turbo->managers->access('users'))
            $result = $turbo->users->update_user($id, $values);
        break;
    case 'label':
        if ($turbo->managers->access('labels'))
            $result = $turbo->orders->update_label($id, $values);
        break;
    case 'banner':
        if ($turbo->managers->access('banners'))
            $result = $turbo->banners->update_banner($id, $values);
        break;
    case 'banners_image':
        if ($turbo->managers->access('banners'))
            $result = $turbo->banners->update_banners_image($id, $values);
        break;
    case 'language':
        if ($turbo->managers->access('languages'))
            $result = $turbo->languages->update_language($id, $values);
        break;
}

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
$json = json_encode($result);
print $json;
