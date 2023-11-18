<?php

session_start();

require_once '../../../api/Turbo.php';

$turbo = new Turbo();

$delieryId = $turbo->request->get('id', 'integer');
$delivery = $turbo->delivery->getDelivery($delieryId);
$settings = unserialize($delivery->settings);
$key = $settings['api_key'];

if ($key == '') {
    print(json_encode(array('error' => 'Key is empty')));
    die();
}

require_once('../../../delivery/NovaPoshta/api/NovaPoshtaApi2.php');

/* Nova Poshta */
$np = new NovaPoshtaApi2(
    $key,
    'ru',  // Language of response: ru (default) | ua | en
    FALSE, // Throw exceptions when in response is error: FALSE (default) | TRUE
    'curl' // Connection type: curl (defalut) | file_get_content
);

print json_encode($np->getCities());
