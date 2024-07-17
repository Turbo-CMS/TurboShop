<?php

require_once 'api/Turbo.php';

class ClearAdmin extends Turbo
{
	public function fetch()
	{
		return $this->design->fetch('clear.tpl');
	}
}
