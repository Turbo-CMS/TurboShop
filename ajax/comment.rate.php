<?php
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

if (!isset($_SESSION)) {
	session_start();
}
require_once('../api/Turbo.php');
$turbo = new Turbo();

$output = array('success' => 0, 'value' => 0, 'message' => '');
if ($turbo->request->method('get') && $turbo->request->get('id') && $turbo->request->get('rate')) {
	$this_id = $turbo->request->get('id');

	if (!isset($_SESSION['comment_rate_ids'])) $_SESSION['comment_rate_ids'] = array();
	if (in_array($this_id, $_SESSION['comment_rate_ids'])) {
		echo json_encode($output);
		return false;
	}

	$this_comment = $turbo->comments->get_comment($this_id);

	if ($turbo->request->get('rate') == 'down') {
		$this_comment->rate -= 1;
		$output['value'] = $this_comment->rate;
	} else {
		$this_comment->rate += 1;
		$output['value'] = $this_comment->rate;
	}

	$turbo->comments->update_comment($this_id, $this_comment);

	$_SESSION['comment_rate_ids'][] = $this_id;
}
$output['success'] = 1;
echo json_encode($output);
return false;
