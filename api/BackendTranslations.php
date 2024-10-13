<?php

require_once 'Turbo.php';

class BackendTranslations
{
	private $data = [];

	public function __get($name)
	{
		return $this->data[$name] ?? null;
	}

	public function __set($name, $value)
	{
		$this->data[$name] = $value;
	}

	public function get_translation($var)
	{
		return $this->$var;
	}
}
