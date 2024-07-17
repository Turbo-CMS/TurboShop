<?php

require_once 'api/Turbo.php';

class FeedsAdmin extends Turbo
{
	public function fetch()
	{
		return $this->design->fetch('feeds.tpl');
	}
}
