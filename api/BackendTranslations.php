<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class BackendTranslations
{
	public function get_translation($var)
	{
		return $this->$var;
	}
}
