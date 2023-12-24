<?php

require_once('api/Turbo.php');

class FeatureAdmin extends Turbo
{
    public function fetch()
    {
        $feature = new stdClass();

        if ($this->request->isMethod('POST')) {
            $feature->id = $this->request->post('id', 'integer');
            $feature->name = $this->request->post('name');
            $feature->in_filter = (int) $this->request->post('in_filter');
            $feature->is_color = (int) $this->request->post('is_color');
            $feature->is_size = (int) $this->request->post('is_size');
            $feature->url_in_product = (int) $this->request->post('url_in_product');
            $feature->url = $this->request->post('url');
            $feature->url = preg_replace("/[\s]+/ui", '', $feature->url);
            $feature->url = strtolower(preg_replace("/[^0-9a-z]+/ui", '', $feature->url));

            $featureCategories = $this->request->post('feature_categories');

            if (($c = $this->features->getFeature($feature->url)) && $c->id != $feature->id) {
                $this->design->assign('message_error', 'url_exists');
            } elseif (empty($feature->name)) {
                $this->design->assign('message_error', 'empty_name');
            } else {
                if (empty($feature->id)) {
                    $feature->id = $this->features->addFeature($feature);
                    $feature = $this->features->getFeature($feature->id);
                    $this->design->assign('message_success', 'added');
                } else {
                    $this->features->updateFeature($feature->id, $feature);
                    $feature = $this->features->getFeature($feature->id);
                    $this->design->assign('message_success', 'updated');
                }
                $this->features->updateFeatureCategories($feature->id, $featureCategories);
            }

            $options = [];
            if ($this->request->post('options')) {
                foreach ($this->request->post('options') as $n => $o) {
                    foreach ($o as $i => $v) {
                        if (empty($options[$i])) {
                            $options[$i] = new stdClass;
                        }
                        $options[$i]->$n = $v;
                    }
                }
            }

            if ($optionsDelete = $this->request->post('options_delete')) {
                foreach ($options as $k => $o) {
                    if (in_array($o->id, $optionsDelete)) {
                        unset($options[$k]);
                        $this->features->deleteOption($o->id);
                    }
                }
            }

            $optionsIds = [];
            foreach ($options as $option) {
                if ($option->value) {
                    $option->feature_id = $feature->id;
                    if (!empty($option->id)) {
                        $this->features->updateOption($option->id, $option);
                    } else {
                        unset($option->id);
                        $option->id = $this->features->addOption($option);
                    }
                    $optionsIds[] = $option->id;
                }
            }

            asort($optionsIds);
            $i = 0;
            foreach ($optionsIds as $optionsId) {
                $this->features->updateOption($optionsIds[$i], ['position' => $optionsId]);
                $i++;
            }
        } else {
            $feature->id = $this->request->get('id', 'integer');
            $feature = $this->features->getFeature($feature->id);
        }

        if ($feature && $feature->id) {
            $options = [];
            $filter = ['feature_id' => $feature->id];
            $filter['limit'] = $this->settings->features_num_admin;

            $filter['page'] = max(1, $this->request->get('page', 'integer'));

            $optionsCount = $this->features->countOptions($filter);

            if ($this->request->get('page') == 'all') {
                $filter['limit'] = $optionsCount;
            }

            if ($filter['limit'] > 0) {
                $pagesCount = ceil($optionsCount / $filter['limit']);
            } else {
                $pagesCount = 0;
            }

            $filter['page'] = min($filter['page'], $pagesCount);
            $this->design->assign('options_count', $optionsCount);
            $this->design->assign('pages_count', $pagesCount);
            $this->design->assign('current_page', $filter['page']);

            foreach ($this->features->getOptions($filter) as $option) {
                $options[$option->translit] = $option;
            }

            $this->design->assign('options', $options);
        }

        $featureCategories = [];
        if ($feature) {
            $featureCategories = $this->features->getFeatureCategories($feature->id);
        }

        $categories = $this->categories->getCategoriesTree();
        $this->design->assign('categories', $categories);
        $this->design->assign('feature', $feature);
        $this->design->assign('feature_categories', $featureCategories);

        $body = $this->design->fetch('feature.tpl');

        return $body;
    }
}
