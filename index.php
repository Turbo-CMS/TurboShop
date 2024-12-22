<?php

/**
 * @author Turbo CMS
 * @link https://github.com/Turbo-CMS
 */

$timeStart = microtime(true);
session_start();

require_once 'view/IndexView.php';

$view = new IndexView();

header("X-Powered-CMS: TurboCMS " . $view->config->version);

// ini_set('error_reporting', E_ALL);
// ini_set('display_startup_errors', 1);
// ini_set('display_errors', 1);

if (isset($_GET['logout'])) {
	header('WWW-Authenticate: Basic realm="Turbo CMS"');
	header('HTTP/1.0 401 Unauthorized');
	unset($_SESSION['admin']);
}

if (($res = $view->fetch()) !== false) {

	if (empty($_SESSION['last_visited_page']) || empty($_SESSION['current_page']) || $_SERVER['REQUEST_URI'] !== $_SESSION['current_page']) {
		if (!empty($_SESSION['current_page']) && !empty($_SESSION['last_visited_page']) && $_SESSION['last_visited_page'] !== $_SESSION['current_page']) {
			$_SESSION['last_visited_page'] = $_SESSION['current_page'];
		}
		$_SESSION['current_page'] = $_SERVER['REQUEST_URI'];
	}

	header('Content-Type: text/html; charset=UTF-8');
	print $res;
} else {
	header('http/1.0 404 not found');

	$_GET['page_url'] = '404';
	$_GET['module'] = 'PageView';
	print $view->fetch();
}

if ($view->config->debug) {
	print "<!--\r\n";
	$execTime = round(microtime(true) - $timeStart, 5);

	$files = get_included_files();
	print "+-------------- included files (" . count($files) . ") --------------+\r\n\n";
	foreach ($files as $file) {
		print $file . " \r\n";
	}

	print "\n\n" . "+------------- SQL (last 100 query) -------------+\r\n\n";
	$view->db->query('SHOW profiles;');
	$totalTimeSql = 0;
	$profilesSql = $view->db->results();

	foreach ($profilesSql as $sql) {
		echo $sql->Query_ID . ': ' . $sql->Duration . 's: ' . $sql->Query . "\r\n";
		$totalTimeSql += $sql->Duration;
	}
	print "\n" . count($profilesSql) . " queries, " . $totalTimeSql . "s";

	print "\n\n" . "+-------------- page generation time -------------+\r\n\n";
	print "page generation time: " . $execTime . "s\r\n";

	if (function_exists('memory_get_peak_usage')) {
		print "\n\n" . "+--------------- memory peak usage ---------------+\r\n\n";
		print "memory peak usage: " . (round(memory_get_peak_usage() / 1048576 * 100) / 100) . " mb\r\n";
	}

	print "-->";
} else {
	print "<!--\r\n";
	$timeEnd = microtime(true);
	$execTime = round($timeEnd - $timeStart, 3);

	if (function_exists('memory_get_peak_usage')) {
		print "memory peak usage: " . (round(memory_get_peak_usage() / 1048576 * 100) / 100) . " mb\r\n";
	}
	print "page generation time: " . $execTime . " s\r\n";
	print "-->";
}
