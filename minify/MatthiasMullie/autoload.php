<?php





spl_autoload_register(function($class){

	if (substr($class, 0, 15) !== 'MatthiasMullie\\') {
		return;
	}

	$path = __DIR__ . '/' . str_replace('\\', '/', substr($class, 15)) . '.php';

	
	if (is_readable($path))
		require_once $path;

});

