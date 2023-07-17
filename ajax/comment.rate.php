<?php

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

session_start();
require_once '../api/Turbo.php';

$turbo = new Turbo();

$output = ['success' => 0, 'value' => 0, 'message' => ''];

if ($turbo->request->isMethod('get') && $turbo->request->get('id') && $turbo->request->get('rate')) {

    $commentId = $turbo->request->get('id');

    if (!isset($_SESSION['comment_rate_ids'])) {
        $_SESSION['comment_rate_ids'] = [];
    }

    if (in_array($commentId, $_SESSION['comment_rate_ids'])) {
        echo json_encode($output);
        return false;
    }

    $comment = $turbo->comments->getComment($commentId);

    if ($turbo->request->get('rate') == 'down') {
        $comment->rate -= 1;
    } else {
        $comment->rate += 1;
    }

    $output['value'] = $comment->rate;
    $turbo->comments->updateComment($commentId, $comment);
    $_SESSION['comment_rate_ids'][] = $commentId;
}

$output['success'] = 1;

echo json_encode($output);

return false;
