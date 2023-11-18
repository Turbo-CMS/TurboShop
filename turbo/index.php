<?php

chdir('..');

$timeStart = microtime(true);

ini_set('session.gc_maxlifetime', 86400);
ini_set('session.cookie_lifetime', 0);

session_start();

$_SESSION['id'] = session_id();

require_once 'turbo/IndexAdmin.php';

header('Cache-Control: no-cache, must-revalidate');
header('Expires: -1');
header('Pragma: no-cache');

$_SESSION['admin'] = 'admin';

$backend = new IndexAdmin();

if (!$backend->request->checkSession()) {
    unset($_POST);
    trigger_error('Session expired', E_USER_WARNING);
}

print $backend->fetch();

if ($backend->config->debug) {
    print "<!--\r\n";
    $timeEnd = microtime(true);
    $execTime = round($timeEnd - $timeStart, 3);

    if (function_exists('memory_get_peak_usage')) {
        print 'memory peak usage: ' . (round(memory_get_peak_usage() / 1048576 * 100) / 100) . ' mb\r\n';
    }

    print "page generation time: $execTime s\r\n";
    print '-->';
}
