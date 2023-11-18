<?php

require_once 'Turbo.php';

class Payment extends Turbo
{
	/**
	 * Get Payment Methods
	 */
	public function getPaymentMethods($filter = [])
	{
		$deliveryFilter = '';

		if (!empty($filter['delivery_id'])) {
			$deliveryFilter = $this->db->placehold('AND id IN (SELECT payment_method_id FROM __delivery_payment dp WHERE dp.delivery_id=?)', (int) $filter['delivery_id']);
		}

		$enabledFilter = '';

		if (!empty($filter['enabled'])) {
			$enabledFilter = $this->db->placehold('AND enabled=?', (int) $filter['enabled']);
		}

		$langSql = $this->languages->getQuery(['object' => 'payment']);

		$query = $this->db->placehold(
			"SELECT *, $langSql->fields
			FROM __payment_methods p
			$langSql->join
			WHERE 1 
				$deliveryFilter
				$enabledFilter
			ORDER BY p.position"
		);

		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Get Payment Method
	 */
	public function getPaymentMethod($id)
	{
		$langSql = $this->languages->getQuery(['object' => 'payment']);

		$query = $this->db->placehold("SELECT *, $langSql->fields FROM __payment_methods p $langSql->join WHERE id=? LIMIT 1", (int) $id);

		$this->db->query($query);
		$paymentMethod = $this->db->result();

		return $paymentMethod;
	}

	/**
	 * Get Payment Settings
	 */
	public function getPaymentSettings($methodId)
	{
		$query = $this->db->placehold(
			"SELECT settings FROM __payment_methods WHERE id=? LIMIT 1",
			$methodId
		);

		$this->db->query($query);

		$settings = $this->db->result('settings');
		$settings = unserialize($settings);

		return $settings;
	}

	/**
	 * Get Payment Modules
	 */
	public function getPaymentModules()
	{
		$modulesDir = $this->config->root_dir . 'payment/';

		$modules = [];
		$handler = opendir($modulesDir);

		while ($dir = readdir($handler)) {
			$dir = preg_replace("/[^A-Za-z0-9]+/", "", $dir);

			if (!empty($dir) && $dir != "." && $dir != ".." && is_dir($modulesDir . $dir)) {
				if (is_readable($modulesDir . $dir . '/settings.xml') && $xml = simplexml_load_file($modulesDir . $dir . '/settings.xml')) {
					$moduleTranslations = $this->getModuleBackendTranslations($dir);

					$module = new stdClass();
					$module->name = (string)$xml->name;
					$module->settings = [];

					foreach ($xml->settings as $setting) {
						$settingName = (string) $setting->name;
						$translationName = preg_replace('~{\$lang->(.+)?}~', '$1', $settingName);
						$settingName = isset($moduleTranslations[$translationName]) ? $moduleTranslations[$translationName] : $settingName;
						$moduleSettings = new stdClass();
						$moduleSettings->name = $settingName;
						$moduleSettings->variable = (string) $setting->variable;
						$moduleSettings->options = [];

						foreach ($setting->options as $option) {
							$optionName = (string) $option->name;
							$translationName = preg_replace('~{\$lang->(.+)?}~', '$1', $optionName);
							$optionName = isset($moduleTranslations[$translationName]) ? $moduleTranslations[$translationName] : $optionName;
							$optionDetails = new stdClass();
							$optionDetails->name = $optionName;
							$optionDetails->value = (string) $option->value;
							$moduleSettings->options[(string) $option->value] = $optionDetails;
						}

						$module->settings[(string) $setting->variable] = $moduleSettings;
					}

					$modules[$dir] = $module;
				}
			}
		}

		closedir($handler);

		return $modules;
	}

	/**
	 * Get Module Translations
	 */
	public function getModuleBackendTranslations($dir)
	{
		$langLabel = $this->settings->lang;
		$moduleDir = $this->config->root_dir . 'payment/' . $dir;

		$lang = [];

		if (is_file($moduleDir . '/lang/' . $langLabel . '.php')) {
			include $moduleDir . '/lang/' . $langLabel . '.php';
		}

		return $lang;
	}

	/**
	 * Get Payment Deliveries
	 */
	public function getPaymentDeliveries($id)
	{
		$query = $this->db->placehold("SELECT delivery_id FROM __delivery_payment WHERE payment_method_id=?", (int) $id);
		$this->db->query($query);

		return $this->db->results('delivery_id');
	}

	/**
	 * Update Payment Method
	 */
	public function updatePaymentMethod($id, $paymentMethod)
	{
		$result = $this->languages->getDescription($paymentMethod, 'payment');

		if (!empty($result->data)) {
			$paymentMethod = $result->data;
		}

		$query = $this->db->placehold("UPDATE __payment_methods SET ?% WHERE id IN(?@)", (array) $paymentMethod, (array) $id);
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'payment', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Update Payment Settings
	 */
	public function updatePaymentSettings($methodId, $settings)
	{
		if (!is_string($settings)) {
			$settings = serialize($settings);
		}

		$query = $this->db->placehold("UPDATE __payment_methods SET settings=? WHERE id IN(?@) LIMIT 1", $settings, (array) $methodId);
		$this->db->query($query);

		return $methodId;
	}

	/**
	 * Update Payment Deliveries
	 */
	public function updatePaymentDeliveries($id, $deliveriesIds)
	{
		$query = $this->db->placehold("DELETE FROM __delivery_payment WHERE payment_method_id=?", (int) $id);
		$this->db->query($query);

		if (is_array($deliveriesIds)) {
			foreach ($deliveriesIds as $deliveryId) {
				$this->db->query("INSERT INTO __delivery_payment SET payment_method_id=?, delivery_id=?", $id, $deliveryId);
			}
		}
	}

	/**
	 * Add Payment Method
	 */
	public function addPaymentMethod($paymentMethod)
	{
		$result = $this->languages->getDescription($paymentMethod, 'payment');
		$paymentMethod = (object) $paymentMethod;

		if (!$this->db->query('INSERT INTO __payment_methods SET ?%', $paymentMethod)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'payment');
		}

		$this->db->query("UPDATE __payment_methods SET position=id WHERE id=?", $id);

		return $id;
	}

	/**
	 * Delete Payment Method
	 */
	public function deletePaymentMethod($id)
	{
		$query = $this->db->placehold('DELETE FROM __delivery_payment WHERE payment_method_id=?', (int) $id);
		$this->db->query($query);

		if (!empty($id)) {
			$query = $this->db->placehold('DELETE FROM __payment_methods WHERE id=? LIMIT 1', (int) $id);
			$this->db->query($query);

			$this->db->query('DELETE FROM __lang_payment_methods WHERE payment_id=?', (int) $id);
		}
	}

	/**
	 * Delete Icon
	 */
	public function deleteIcon($paymentMethod)
	{
		$paymentMethod = (array) $paymentMethod;
		$query = $this->db->placehold("SELECT icon FROM __payment_methods WHERE id IN(?@)", $paymentMethod);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('icon');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __payment_methods SET icon=NULL WHERE id IN(?@)", $paymentMethod);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT COUNT(*) AS count FROM __payment_methods WHERE icon=?", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					unlink($this->config->root_dir . $this->config->payment_images_dir . $filename);
				}
			}
		}
	}
}
