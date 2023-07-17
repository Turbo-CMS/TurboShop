<?php

require_once 'api/Turbo.php';

class TranslationAdmin extends Turbo
{
    public function fetch()
    {
        $languages = $this->languages->getLanguages();
        $lockedTheme = is_file('design/' . $this->settings->theme . '/locked');
        $this->design->assign('locked_theme', $lockedTheme);
        $translation = new stdClass();

        if (!$lockedTheme && $this->request->isMethod('post')) {
            $translation->id = $this->request->post('id', 'integer');
            $translation->label = trim($this->request->post('label'));
            $translation->label = str_replace(' ', '_', $translation->label);

            if ($languages) {
                foreach ($languages as $lang) {
                    $field = 'lang_' . $lang->label;
                    $translation->$field = isset($translation->$field) ? $translation->$field : '';
                    $translation->$field = $this->request->post($field);
                }
            }

            $this->db->query('SELECT * FROM __translations WHERE label=? LIMIT 1', $translation->label);
            $existLabel = $this->db->result();

            if (!$translation->label) {
                $this->design->assign('message_error', 'label_empty');
            } elseif ($existLabel && $existLabel->id != $translation->id) {
                $this->design->assign('message_error', 'label_exists');
            } else {
                if (empty($translation->id)) {
                    $translation->id = $this->languages->addTranslation($translation);
                    $this->design->assign('message_success', 'added');
                } else {
                    $this->languages->updateTranslation($translation->id, $translation);
                    $this->design->assign('message_success', 'updated');
                }
            }
        } else {
            $translation->id = $this->request->get('id', 'integer');

            if (!empty($translation->id)) {
                $translation = $this->languages->getTranslation($translation->id);
            }
        }

        $this->design->assign('languages', $languages);
        $this->design->assign('translation', $translation);

        return $this->design->fetch('translation.tpl');
    }
}
