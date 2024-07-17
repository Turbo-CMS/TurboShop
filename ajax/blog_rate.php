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

if ($turbo->request->isMethod('get') && $turbo->request->get('id') && $turbo->request->get('rate')) {
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

	$post = $turbo->blog->getPost($postId);

	if ($turbo->request->get('rate') == 'down') {
		$post->rate--;
		$output['value'] = $post->rate;
	} else {
		$post->rate++;
		$output['value'] = $post->rate;
	}

	$turbo->blog->updatePost($postId, $post);
}

$output['success'] = 1;

echo json_encode($output);

return false;
