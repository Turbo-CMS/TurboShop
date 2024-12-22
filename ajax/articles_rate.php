<?php

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

session_start();

require_once '../api/Turbo.php';

$turbo = new Turbo();

$output = [
	'success' => 0,
	'value' => 0,
	'message' => '',
];

if ($turbo->request->method('get') && $turbo->request->get('id') && $turbo->request->get('rate')) {
	$postId = $turbo->request->get('id', 'integer');

	if (!isset($_SESSION['post_rate_ids'])) {
		$_SESSION['post_rate_ids'] = [];
	}

	if (in_array($postId, $_SESSION['post_rate_ids'], true)) {
		echo json_encode($output);
		return false;
	} else {
		$_SESSION['post_rate_ids'][] = $postId;
	}

	$article = $turbo->articles->getArticle($postId);

	if ($turbo->request->get('rate') == 'down') {
		$article->rate--;
		$output['value'] = $article->rate;
	} else {
		$article->rate++;
		$output['value'] = $article->rate;
	}

	$turbo->articles->updateArticle($postId, $article);
}

$output['success'] = 1;

echo json_encode($output);

return false;
