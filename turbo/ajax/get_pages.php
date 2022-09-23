<?php

function process_page($page, $menu_id, $level, &$new_array, $exclude)
{
	if ($page->menu_id != $menu_id || in_array($page->id, $exclude))
		return;
	$new_array[] = array('id' => $page->id, 'text' => str_repeat('--', $level) . $page->name);
	if (isset($page->subpages))
		foreach ($page->subpages as $subpage)
			if ($subpage->menu_id == $menu_id && !in_array($subpage->id, $exclude))
				process_page($subpage, $menu_id, $level + 1, $new_array, $exclude);
}

session_start();
require_once('../../api/Turbo.php');
$turbo = new Turbo();

$backend_translations = $turbo->backend_translations;
$file = $_SERVER['DOCUMENT_ROOT'] . '/turbo/lang/' . $turbo->settings->lang . '.php';
if (!file_exists($file)) {
	foreach (glob($_SERVER['DOCUMENT_ROOT'] . '/turbo/lang/??.php') as $f) {
		$file = $_SERVER['DOCUMENT_ROOT'] . '/turbo/lang/' . pathinfo($f, PATHINFO_FILENAME) . '.php';
		break;
	}
}
require_once($file);

$result = array();

$menu_id = $turbo->request->post('menu_id', 'integer');
$exclude = explode(',', $turbo->request->post('exclude', 'string'));
$pages_tree = $turbo->pages->get_pages_tree(array('menu_id' => $menu_id));
$new_pages = array(array('id' => 0, 'text' => '' . $turbo->backend_translations->page_not_selected . ''));

foreach ($pages_tree as $page)
	process_page($page, $menu_id, 0, $new_pages, $exclude);

$result = array('success' => true, 'data' => $new_pages);

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
$json = json_encode($result);
print $json;
