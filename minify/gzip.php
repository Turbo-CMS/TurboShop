<?php


$request = trim($_SERVER['REQUEST_URI'], ' /');

$source = realpath('../'.substr($request, 0, -4));
$level = intval(substr($request, -1));

if(!$source || !$level)
{
	header("http/1.0 404 not found");
	exit; 
}

$content = file_get_contents($source);
$content = gzencode($content, $level, FORCE_GZIP);

file_put_contents($source.'.gz'.$level, $content);


$sourceExt = pathinfo($source, PATHINFO_EXTENSION);


header('Content-Encoding: gzip');
header('Content-type: ' . ($sourceExt=='css' ? 'text/css' : 'text/javascript'));

echo $content;
