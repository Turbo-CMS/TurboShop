<?php

function processPage($page, $menuId, $level, &$newArray, $exclude)
{
    if ($page->menu_id != $menuId || in_array($page->id, $exclude)) {
        return;
    }

    $newArray[] = ['id'   => $page->id, 'text' => str_repeat('-- ', $level) . $page->name];

    if (isset($page->subpages)) {
        foreach ($page->subpages as $subpage) {
            if ($subpage->menu_id == $menuId && !in_array($subpage->id, $exclude)) {
                processPage($subpage, $menuId, $level + 1, $newArray, $exclude);
            }
        }
    }
}

session_start();
require_once '../../api/Turbo.php';

$turbo = new Turbo();

$backendTranslations = $turbo->backendTranslations;
$file = $_SERVER['DOCUMENT_ROOT'] . '/turbo/lang/' . $turbo->settings->lang . '.php';

if (!file_exists($file)) {
    foreach (glob($_SERVER['DOCUMENT_ROOT'] . '/turbo/lang/??.php') as $f) {
        $file = $_SERVER['DOCUMENT_ROOT'] . '/turbo/lang/' . pathinfo($f, PATHINFO_FILENAME) . '.php';
        break;
    }
}

require_once($file);

$result = [];

$menuId = $turbo->request->post('menu_id', 'integer');
$exclude = explode(',', $turbo->request->post('exclude', 'string'));
$pagesTree = $turbo->pages->getPagesTree(['menu_id' => $menuId]);
$newPages = [['id' => 0, 'text' => '' . $turbo->backendTranslations->page_not_selected . '']];

foreach ($pagesTree as $page) {
    processPage($page, $menuId, 0, $newPages, $exclude);
}

$result = ['success' => true, 'data' => $newPages];

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
$json = json_encode($result);

print $json;
