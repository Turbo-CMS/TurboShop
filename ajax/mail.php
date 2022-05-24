<?php
chdir('..');
require_once('api/Turbo.php');
$turbo = new Turbo();

$subscribe = new StdClass;
$subscribe->email = $turbo->request->post('email');

$subscribe_id = $turbo->subscribes->add_subscribe($subscribe);

$turbo->subscribes->add_subscribe(array('email' => $email));

$turbo->subscribes->email_subscribe_admin($subscribe_id);
