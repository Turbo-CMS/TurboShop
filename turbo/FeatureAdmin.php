<?php

require_once('api/Turbo.php');

class FeatureAdmin extends Turbo
{
	function fetch()
	{
		$feature = new stdClass;
		if ($this->request->method('post')) {
			$feature->id = $this->request->post('id', 'integer');
			$feature->name = $this->request->post('name');
			$feature->in_filter = intval($this->request->post('in_filter'));
			$feature->is_color = intval($this->request->post('is_color'));
			$feature->url_in_product = intval($this->request->post('url_in_product'));
			$feature_categories = $this->request->post('feature_categories');
			$feature->url = $this->request->post('url');
			$feature->url = preg_replace("/[\s]+/ui", '', $feature->url);
			$feature->url = strtolower(preg_replace("/[^0-9a-z]+/ui", '', $feature->url));

			// Don't allow duplicate features URLs
			if (($c = $this->features->get_feature($feature->url)) && $c->id != $feature->id) {
				$this->design->assign('message_error', 'url_exists');
			} elseif (empty($feature->name)) {
				$this->design->assign('message_error', 'empty_name');
			} else {
				if (empty($feature->id)) {
					$feature->id = $this->features->add_feature($feature);
					$feature = $this->features->get_feature($feature->id);
					$this->design->assign('message_success', 'added');
				} else {
					$this->features->update_feature($feature->id, $feature);
					$feature = $this->features->get_feature($feature->id);
					$this->design->assign('message_success', 'updated');
				}
				$this->features->update_feature_categories($feature->id, $feature_categories);
			}
		} else {
			$feature->id = $this->request->get('id', 'integer');
			$feature = $this->features->get_feature($feature->id);
		}

		$feature_categories = array();
		$features_values = array();
		if ($feature) {
			$feature_categories = $this->features->get_feature_categories($feature->id);
			foreach ($this->features->get_options(array("feature_id" => $feature->id)) as $option)
				$features_values[$option->translit] = $option;
		}

		$categories = $this->categories->get_categories_tree();
		$this->design->assign('categories', $categories);
		$this->design->assign('feature', $feature);
		$this->design->assign('feature_categories', $feature_categories);
		$this->design->assign('features_values', $features_values);
		return $this->body = $this->design->fetch('feature.tpl');
	}
}
