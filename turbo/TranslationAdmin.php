<?php

require_once('api/Turbo.php');

class TranslationAdmin extends Turbo
{

    public function fetch()
    {
        $languages = $this->languages->get_languages();

        $admin_theme = $this->settings->admin_theme;
        if ($admin_theme) {
            $locked_theme = is_file('design/' . $admin_theme . '/locked');
        } else {
            $locked_theme = is_file('design/' . $this->settings->theme . '/locked');
        }
        $this->design->assign('locked_theme', $locked_theme);

        $translation = new stdClass;
        if (!$locked_theme && $this->request->method('post')) {
            $translation->id = $this->request->post('id', 'intgeger');

            $translation->label = trim($this->request->post('label'));
            $translation->label = str_replace(" ", '_', $translation->label);

            $translation->in_config = $this->request->post('in_config', 'boolean');

            if ($languages) {
                foreach ($languages as $lang) {
                    $field = 'lang_' . $lang->label;
                    $translation->$field = $this->request->post($field);
                }
            }

            $this->db->query("SELECT * FROM __translations WHERE label=? LIMIT 1", $translation->label);
            $exist_label = $this->db->result();

            if (!$translation->label) {
                $this->design->assign('message_error', 'label_empty');
            } elseif ($exist_label && $exist_label->id != $translation->id) {
                $this->design->assign('message_error', 'label_exists');
            } else {
                if (empty($translation->id)) {
                    $translation->id = $this->languages->add_translation($translation);
                    $this->design->assign('message_success', 'added');
                } else {
                    $this->languages->update_translation($translation->id, $translation);
                    $this->design->assign('message_success', 'updated');
                }

                $translations = $this->languages->get_translations();

                $theme_dir = 'design/' . $this->settings->theme;

                // All
                $filephp = $theme_dir . '/translation.php';
                $filephp = fopen($filephp, 'w');
                $row = "<?php\n\n";
                foreach ($languages as $l) {
                    $row .= "$" . "languages[" . $l->label . "]='" . $l->name . "';\n";
                }
                foreach ($languages as $l) {
                    $row .= "\n//" . $l->name . "\n\n";

                    foreach ($translations as $t) {
                        $lang = 'lang_' . $l->label;
                        $row .= "$" . "lang[" . $l->label . "][" . $t->label . "] = '" . $this->db->escape($t->$lang) . "';\n";
                    }
                }
                fwrite($filephp, $row);
                fclose($filephp);

                $this->languages->update_translation_config_js();
            }
        } else {
            $translation->id = $this->request->get('id', 'integer');
            if (!empty($translation->id)) {
                $translation = $this->languages->get_translation($translation->id);
            }
        }

        $this->design->assign('languages', $languages);

        $this->design->assign('translation', $translation);
        return $this->design->fetch('translation.tpl');
    }
}
