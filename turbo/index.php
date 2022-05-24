<?php

chdir('..');

// Timekeeping
$time_start = microtime(true);
session_start();
$_SESSION['id'] = session_id();

@ini_set('session.gc_maxlifetime', 86400); // 86400 = 24 hours
@ini_set('session.cookie_lifetime', 0); // 0 - until the browser is closed

require_once('turbo/IndexAdmin.php');

// We do not need caching in the admin panel
Header("Cache-Control: no-cache, must-revalidate");
header("Expires: -1");
Header("Pragma: no-cache");

/* ini_set('error_reporting', E_ALL);
ini_set('display_startup_errors', 1);
ini_set('display_errors', 1); */

// Set a session variable so that the frontend recognizes us as an admin
$_SESSION['admin'] = 'admin';

$backend = new IndexAdmin();

// Session check to protect against xss
if (!$backend->request->check_session()) {
	unset($_POST);
	trigger_error('Session expired', E_USER_WARNING);
}

print $backend->fetch();

// Debugging Information
if ($backend->config->debug) {
	print "<!--\r\n";
	$i = 0;
	$sql_time = 0;
	foreach ($page->db->queries as $q) {
		$i++;
		print "$i.\t$q->exec_time sec\r\n$q->sql\r\n\r\n";
		$sql_time += $q->exec_time;
	}

	$time_end = microtime(true);
	$exec_time = $time_end - $time_start;

	if (function_exists('memory_get_peak_usage'))
		print "memory peak usage: " . memory_get_peak_usage() . " bytes\r\n";
	print "page generation time: " . $exec_time . " seconds\r\n";
	print "sql queries time: " . $sql_time . " seconds\r\n";
	print "php run time: " . ($exec_time - $sql_time) . " seconds\r\n";
	print "-->";
}
