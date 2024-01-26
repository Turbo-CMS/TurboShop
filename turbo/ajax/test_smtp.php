<?php

chdir('../..');
require_once 'api/Turbo.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';

$turbo = new Turbo();

if (!$turbo->managers->access('settings')) {
    exit();
}

use PHPMailer\PHPMailer\SMTP;

$host = $turbo->settings->smtp_server = $turbo->request->post('server');
$port = $turbo->settings->smtp_port = $turbo->request->post('port');
$username = $turbo->settings->smtp_user = $turbo->request->post('user');
$password = $turbo->settings->smtp_pass = $turbo->request->post('pass');

$result = [
    'status'  => false,
    'message' => '',
    'trace'   => ''
];

if ($port == 465) {
    $host = (strpos($host, "ssl://") === false) ? "ssl://" . $host : $host;
}

ob_start();

$smtp = new SMTP;

$smtp->do_debug = SMTP::DEBUG_CONNECTION;

if (!$smtp->connect($host, $port)) {
    $result['message'] = 'Connect failed';
}

if (!$smtp->hello(gethostname())) {
    $result['message'] = 'EHLO failed: ' . $smtp->getError()['error'];
}

$e = $smtp->getServerExtList();

if (is_array($e) && array_key_exists('STARTTLS', $e)) {
    $tlsok = $smtp->startTLS();

    if (!$tlsok) {
        $result['message'] = 'Failed to start encryption: ' . $smtp->getError()['error'];
    }

    if (!$smtp->hello(gethostname())) {
        $result['message'] = 'EHLO (2) failed: ' . $smtp->getError()['error'];
    }

    $e = $smtp->getServerExtList();
}

if (is_array($e) && array_key_exists('AUTH', $e)) {
    if ($smtp->authenticate($username, $password)) {
        $result['message'] = 'Connected ok!';
        $result['status']  = true;
    } else {
        $result['message'] = 'Authentication failed: ' . $smtp->getError()['error'];
    }
}

$smtp->quit(true);

$result['trace'] = nl2br(ob_get_contents());

ob_end_clean();

header("Content-type: application/json; charset=UTF-8");
header("Cache-Control: must-revalidate");
header("Pragma: no-cache");
header("Expires: -1");

print json_encode($result);
