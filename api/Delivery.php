<?php

require_once 'Turbo.php';

class Delivery extends Turbo
{
	/**
	 * Get Delivery
	 */
	public function getDelivery($id)
	{
		$langSql = $this->languages->getQuery(['object' => 'delivery']);

		$query = $this->db->placehold(
			"SELECT 
				d.id,
				d.module,
				d.name,
				d.icon, 
				d.code,
				d.description,
				d.free_from,
				d.price,
				d.enabled,
				d.position,
				d.settings,
				d.separate_payment,
				$langSql->fields 
			FROM __delivery d
			 	$langSql->join
			WHERE id=? 
			LIMIT 1",
			(int) $id
		);

		$this->db->query($query);

		return $this->db->result();
	}

	/**
	 * Get Deliveries
	 */
	public function getDeliveries($filter = [])
	{
		$enabledFilter = '';

		if (!empty($filter['enabled'])) {
			$enabledFilter = $this->db->placehold('AND enabled=?', (int) $filter['enabled']);
		}

		$langSql = $this->languages->getQuery(['object' => 'delivery']);

		$query = $this->db->placehold(
			"SELECT
                d.id,
				d.module,
                d.name,
				d.icon, 
				d.code,
                d.description,
                d.free_from,
                d.price,
                d.enabled,
                d.position,
				d.settings,
                d.separate_payment,
                $langSql->fields
            FROM __delivery d
                $langSql->join
            WHERE 1
                $enabledFilter
            ORDER BY
                d.position"
		);

		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Get Delivery Settings
	 */
	public function getDeliverySettings($methodId)
	{
		$query = $this->db->placehold(
			"SELECT settings FROM __delivery WHERE id=? LIMIT 1",
			$methodId
		);

		$this->db->query($query);

		$settings = $this->db->result('settings');
		$settings = unserialize($settings);

		return $settings;
	}

	/**
	 * Get Delivery Modules
	 */
	public function getDeliveryModules()
	{
		$modulesDir = $this->config->root_dir . 'delivery/';

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
		$moduleDir = $this->config->root_dir . 'delivery/' . $dir;

		$lang = [];

		if (is_file($moduleDir . '/lang/' . $langLabel . '.php')) {
			include $moduleDir . '/lang/' . $langLabel . '.php';
		}

		return $lang;
	}

	/**
	 * Update Delivery Settings
	 */
	public function updateDeliverySettings($methodId, $settings)
	{
		if (!is_string($settings)) {
			$settings = serialize($settings);
		}

		$query = $this->db->placehold("UPDATE __delivery SET settings=? WHERE id IN(?@) LIMIT 1", $settings, (array) $methodId);
		$this->db->query($query);

		return $methodId;
	}

	/**
	 * Updates Delivery 
	 */
	public function updateDelivery($id, $delivery)
	{
		$delivery = (object) $delivery;

		$result = $this->languages->getDescription($delivery, 'delivery');

		$query = $this->db->placehold("UPDATE __delivery SET ?% WHERE id IN(?@)", $delivery, (array) $id);
		$this->db->query($query);

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'delivery', $this->languages->langId());
		}

		return $id;
	}

	/**
	 * Add Delivery
	 */
	public function addDelivery($delivery)
	{
		$delivery = (object) $delivery;

		$result = $this->languages->getDescription($delivery, 'delivery');

		$query = $this->db->placehold("INSERT INTO __delivery SET ?%", $delivery);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'delivery');
		}

		$this->db->query("UPDATE __delivery SET position=id WHERE id=?", (int) $id);

		return $id;
	}

	/**
	 * Deletes Delivery 
	 */
	public function deleteDelivery($id)
	{
		$query = $this->db->placehold("SELECT payment_method_id FROM __delivery_payment WHERE delivery_id=?", (int) $id);
		$this->db->query($query);

		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __delivery WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);

			$this->db->query("DELETE FROM __lang_delivery WHERE delivery_id=?", (int) $id);
		}
	}

	/**
	 * Get Delivery Payments
	 */
	public function getDeliveryPayments($id)
	{
		$query = $this->db->placehold("SELECT payment_method_id FROM __delivery_payment WHERE delivery_id=?", (int) $id);
		$this->db->query($query);

		return $this->db->results('payment_method_id');
	}

	/**
	 * Update Delivery Payments
	 */
	public function updateDeliveryPayments($id, $paymentMethodsIds)
	{
		$query = $this->db->placehold("DELETE FROM __delivery_payment WHERE delivery_id=?", (int) $id);
		$this->db->query($query);

		if (is_array($paymentMethodsIds)) {
			foreach ($paymentMethodsIds as $pId) {
				$this->db->query("INSERT INTO __delivery_payment SET delivery_id=?, payment_method_id=?", $id, $pId);
			}
		}
	}

	/**
	 * Delete Icon
	 */
	public function deleteIcon($delivery)
	{
		$delivery = (array) $delivery;

		$query = $this->db->placehold("SELECT icon FROM __delivery WHERE id IN(?@)", $delivery);

		if ($this->db->query($query)) {
			$filenames = $this->db->results('icon');
		}

		if (!empty($filenames)) {
			$query = $this->db->placehold("UPDATE __delivery SET icon=NULL WHERE id IN(?@)", $delivery);
			$this->db->query($query);

			foreach ($filenames as $filename) {
				$query = $this->db->placehold("SELECT COUNT(*) AS count FROM __delivery WHERE icon=?", $filename);
				$this->db->query($query);

				$count = $this->db->result('count');

				if ($count == 0) {
					@unlink($this->config->root_dir . $this->config->delivery_images_dir . $filename);
				}
			}
		}
	}
}
