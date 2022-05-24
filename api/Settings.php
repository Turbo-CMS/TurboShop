<?php

/**
 * Manage store settings stored in the database
 * Unlike the Config class, it operates with settings available to the admin and stored in the database
 *
 *
 * @author		Turbo CMS
 * @link		https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Settings extends Turbo
{

    private $vars;
    private $vars_lang;

    public function __construct()
    {
        parent::__construct();
        $this->init_settings();
    }

    public function __get($name)
    {
        if ($res = parent::__get($name)) {
            return $res;
        }

        if (isset($this->vars_lang[$name])) {
            return $this->vars_lang[$name];
        } elseif (isset($this->vars[$name])) {
            return $this->vars[$name];
        } else {
            return null;
        }
    }

    // Write data to general settings
    public function __set($name, $value)
    {
        if (isset($this->vars_lang[$name])) {
            return;
        }
        $this->vars[$name] = $value;

        if (is_array($value)) {
            $value = serialize($value);
        } else {
            $value = (string) $value;
        }

        $this->db->query('SELECT count(*) as count FROM __settings WHERE name=?', $name);
        if ($this->db->result('count') > 0) {
            $this->db->query('UPDATE __settings SET value=? WHERE name=?', $value, $name);
        } else {
            $this->db->query('INSERT INTO __settings SET value=?, name=?', $value, $name);
        }
    }

    // Fetch all data from settings tables
    public function init_settings()
    {
        // We select GENERAL settings from the database and write them to a variable
        $this->vars = array();
        $this->db->query('SELECT name, value FROM __settings');
        foreach ($this->db->results() as $result) {
            if (!($this->vars[$result->name] = @unserialize($result->value))) {
                $this->vars[$result->name] = $result->value;
            }
        }

        // Choose from the base settings with translations to the current language
        $this->vars_lang = array();
        $multi = $this->get_settings();
        if (is_array($multi)) {
            foreach ($multi as $s) {
                if (!($this->vars_lang[$s->name] = @unserialize($s->value))) {
                    $this->vars_lang[$s->name] = $s->value;
                }
            }
        }
    }

    /* Multilanguage settings */
    /**
     * Adding a new setting for all languages
     * @param string $name
     * @param string $value
     * @return bool
     */
    private function add($name, $value)
    {
        $languages = $this->languages->get_languages();
        if (!empty($languages)) {
            foreach ($languages as $l) {
                $this->db->query("REPLACE INTO __settings_lang SET lang_id=?, name=?, value=?", $l->id, $name, $value);
            }
        } else {
            $q = $this->db->placehold("REPLACE INTO __settings_lang SET name=?, value=?", $name, $value);
            if (!$this->db->query($q)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Updating by @param $name(current language), or adding;
     * if a setting with specified $name is exist - it will be updated,
     * otherwise it will be added(called add() function).
     * @param string $name
     * @param string $value
     * @return bool
     */
    public function update($name, $value)
    {
        if (empty($name)) {
            return false;
        }
        $this->vars_lang[$name] = $value;
        $value = is_array($value) ? serialize($value) : (string) $value;

        $lang_id  = $this->languages->lang_id();
        $into_lang = '';
        if ($lang_id) {
            $into_lang = $this->db->placehold("lang_id=?, ", $lang_id);
        }

        $this->db->query("SELECT 1 FROM __settings_lang WHERE name=? LIMIT 1", $name);
        if (!$this->db->result()) {
            return $this->add($name, $value);
        } else {
            $q = $this->db->placehold("REPLACE INTO __settings_lang SET $into_lang name=?, value=?", $name, $value);
            return $this->db->query($q) ? true : false;
        }
    }

    /**
     * Getting settings.
     * if $lang_id is not specified, a current language will be returned.
     * $lang_id = 0 is wrong, will be returned false.
     * @param string $lang_id
     * @return mixed
     */
    public function get_settings($lang_id = null)
    {
        if (!is_null($lang_id) && !($l = $this->languages->get_language(intval($lang_id)))) {
            return false;
        }
        $lang_id  = !is_null($lang_id) ? $lang_id : $this->languages->lang_id();
        $lang_id_filter = '';
        if ($lang_id) {
            $lang_id_filter = $this->db->placehold("AND lang_id=?", $lang_id);
        }
        $this->db->query("SELECT * FROM __settings_lang WHERE 1 $lang_id_filter");
        return $this->db->results();
    }
}
