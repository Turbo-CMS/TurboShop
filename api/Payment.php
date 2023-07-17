<?php

require_once 'Turbo.php';

class Payment extends Turbo
{
	/**
	 * Get payment methods
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
	 * Get payment method
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
	 * Get payment settings
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
	 * Get payment modules
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
					$module = new stdClass();

					$module->name = (string)$xml->name;
					$module->settings = [];

					foreach ($xml->settings as $setting) {
						$moduleSettings = new stdClass();
						$moduleSettings->name = (string) $setting->name;
						$moduleSettings->variable = (string) $setting->variable;

						$moduleSettings->options = [];
						foreach ($setting->options as $option) {
							$optionDetails = new stdClass();
							$optionDetails->name = (string) $option->name;
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
	 * Get payment deliveries
	 */
	public function getPaymentDeliveries($id)
	{
		$query = $this->db->placehold("SELECT delivery_id FROM __delivery_payment WHERE payment_method_id=?", (int) $id);
		$this->db->query($query);

		return $this->db->results('delivery_id');
	}

	/**
	 * Update payment method
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
	 * Update payment settings
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
	 * Update payment deliveries
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
	 * Add payment method
	 */
	public function addPaymentMethod($paymentMethod)
	{
		$result = $this->languages->getDescription($paymentMethod, 'payment');
		$paymentMethod = (object)$paymentMethod;

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
	 * Delete payment method
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
}
