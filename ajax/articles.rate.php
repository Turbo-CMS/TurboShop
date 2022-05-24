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
	$this_id = $turbo->request->get('id', 'integer');

	if (!isset($_SESSION['post_rate_ids'])) $_SESSION['post_rate_ids'] = array();
	if (in_array($this_id, $_SESSION['post_rate_ids'])) {
		echo json_encode($output);
		return false;
	}

	$this_post = $turbo->articles->get_article($this_id);

	if ($turbo->request->get('rate') == 'down') {
		$this_post->rate -= 1;
		$output['value'] = $this_post->rate;
	} else {
		$this_post->rate += 1;
		$output['value'] = $this_post->rate;
	}

	$turbo->articles->update_article($this_id, $this_post);

	$_SESSION['post_rate_ids'][] = $this_id;
}
$output['success'] = 1;
echo json_encode($output);
return false;
