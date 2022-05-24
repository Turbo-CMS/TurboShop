<?php
if (!empty($_SERVER['HTTP_USER_AGENT'])) {
    session_name(md5($_SERVER['HTTP_USER_AGENT']));
}
session_start();
chdir('../../');
require_once('api/Turbo.php');

$turbo = new Turbo();

if (!$turbo->managers->access('orders')) {
    exit();
}

$turbo->design->set_templates_dir('turbo/design/html');
$turbo->design->set_compiled_dir('turbo/design/compiled');

$result = array();
// Accepting labels to take action on
if ($turbo->request->method("post")) {
    $order_id = $turbo->request->post("order_id", "integer");
    $state = $turbo->request->post("state", "string");
    $label_id = $turbo->request->post("label_id", "integer");

    if (empty($order_id) || empty($state)) {
        $result['success '] = false;
    } else {
        switch ($state) {
            case "add": {
                    $turbo->orders->add_order_labels($order_id, (array)$label_id);
                    $result['success'] = true;
                    break;
                }
            case "remove": {
                    $turbo->orders->delete_order_labels($order_id, (array)$label_id);
                    $result['success'] = true;
                    break;
                }
        }
        $order = new stdClass();
        $order->labels = $turbo->orders->get_order_labels((array)$order_id);
        $turbo->design->assign("order", $order);
        $result['data'] = $turbo->design->fetch("labels_ajax.tpl");
    }
} else {
    $result['success '] = false;
}
header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");
print json_encode($result);
