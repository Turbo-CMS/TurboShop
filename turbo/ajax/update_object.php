<?php

session_start();
require_once '../../api/Turbo.php';

$turbo = new Turbo();

if (!$turbo->request->checkSession()) {
	trigger_error('Session expired', E_USER_WARNING);
	exit();
}

$id = intval($turbo->request->post('id'));
$object = $turbo->request->post('object');
$values = $turbo->request->post('values');

switch ($object) {
	case 'product':
		if ($turbo->managers->access('products')) {
			$result = $turbo->products->updateProduct($id, $values);
		}
		break;
	case 'category':
		if ($turbo->managers->access('categories')) {
			$result = $turbo->categories->updateCategory($id, $values);
		}
		break;
	case 'brands':
		if ($turbo->managers->access('brands')) {
			$result = $turbo->brands->updateBrand($id, $values);
		}
		break;
	case 'feature':
		if ($turbo->managers->access('features')) {
			$result = $turbo->features->updateFeature($id, $values);
		}
		break;
	case 'page':
		if ($turbo->managers->access('pages')) {
			$result = $turbo->pages->updatePage($id, $values);
		}
		break;
	case 'menu':
		if ($turbo->managers->access('menus')) {
			$result = $turbo->pages->updateMenu($id, $values);
		}
		break;
	case 'blog':
		if ($turbo->managers->access('blog')) {
			$result = $turbo->blog->updatePost($id, $values);
		}
		break;
	case 'articles_category':
		if ($turbo->managers->access('blog')) {
			$result = $turbo->articlesCategories->updateArticlesCategory($id, $values);
		}
		break;
	case 'articles':
		if ($turbo->managers->access('blog')) {
			$result = $turbo->articles->updateArticle($id, $values);
		}
		break;
	case 'delivery':
		if ($turbo->managers->access('delivery')) {
			$result = $turbo->delivery->updateDelivery($id, $values);
		}
		break;
	case 'payment':
		if ($turbo->managers->access('payment')) {
			$result = $turbo->payment->updatePaymentMethod($id, $values);
		}
		break;
	case 'currency':
		if ($turbo->managers->access('currency')) {
			if (!empty($values['cents'])) {
				$values['cents'] = 2;
			}
			$result = $turbo->money->updateCurrency($id, $values);
		}
		break;
	case 'comment':
		if ($turbo->managers->access('comments')) {
			$result = $turbo->comments->updateComment($id, $values);
		}
		break;
	case 'callback':
		if ($turbo->managers->access('callbacks')) {
			$result = $turbo->callbacks->updateCallback($id, $values);
		}
		break;
	case 'subscribe':
		if ($turbo->managers->access('subscribes')) {
			$result = $turbo->subscribes->updateSubscribe($id, $values);
		}
		break;
	case 'feedback':
		if ($turbo->managers->access('feedbacks')) {
			$result = $turbo->feedbacks->updateFeedback($id, $values);
		}
		break;
	case 'faq':
		if ($turbo->managers->access('faq')) {
			$result = $turbo->faq->updateFaq($id, $values);
		}
		break;
	case 'user':
		if ($turbo->managers->access('users')) {
			$result = $turbo->users->updateUser($id, $values);
		}
		break;
	case 'label':
		if ($turbo->managers->access('labels')) {
			$result = $turbo->orders->updateLabel($id, $values);
		}
		break;
	case 'banner':
		if ($turbo->managers->access('banners')) {
			$result = $turbo->banners->updateBanner($id, $values);
		}
		break;
	case 'banners_image':
		if ($turbo->managers->access('banners')) {
			$result = $turbo->banners->updateBannersImage($id, $values);
		}
		break;
	case 'language':
		if ($turbo->managers->access('languages')) {
			$result = $turbo->languages->updateLanguage($id, $values);
		}
		break;
}

$json = json_encode($result);

header('Content-type: application/json; charset=UTF-8');
header('Cache-Control: must-revalidate');
header('Pragma: no-cache');
header('Expires: -1');

print $json;
