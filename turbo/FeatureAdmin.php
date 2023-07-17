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
        } else {
            $feature->id = $this->request->get('id', 'integer');
            $feature = $this->features->getFeature($feature->id);
        }

        $featureCategories = [];
        $featuresValues = [];

        if ($feature) {
            $featureCategories = $this->features->getFeatureCategories($feature->id);

            foreach ($this->features->getOptions(['feature_id' => $feature->id]) as $option) {
                $featuresValues[$option->translit] = $option;
            }
        }

        $categories = $this->categories->getCategoriesTree();

        $this->design->assign('categories', $categories);
        $this->design->assign('feature', $feature);
        $this->design->assign('feature_categories', $featureCategories);
        $this->design->assign('features_values', $featuresValues);

        $body = $this->design->fetch('feature.tpl');

        return $body;
    }
}
