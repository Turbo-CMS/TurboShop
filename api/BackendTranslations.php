<?php

require_once 'Turbo.php';

class BackendTranslations
{
    public function get_translation($var)
    {
        return $this->$var;
    }
}
