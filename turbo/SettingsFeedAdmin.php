<?php

require_once 'api/Turbo.php';

class SettingsFeedAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$this->settings->export_export_not_in_stock = $this->request->post('export_export_not_in_stock', 'boolean');
			$this->settings->export_available_for_retail_store = $this->request->post('export_available_for_retail_store', 'boolean');
			$this->settings->export_available_for_reservation = $this->request->post('export_available_for_reservation', 'boolean');
			$this->settings->export_short_description = $this->request->post('export_short_description', 'boolean');
			$this->settings->export_has_manufacturer_warranty = $this->request->post('export_has_manufacturer_warranty', 'boolean');
			$this->settings->export_has_seller_warranty = $this->request->post('export_has_seller_warranty', 'boolean');
			$this->settings->export_no_export_without_price = $this->request->post('export_no_export_without_price', 'boolean');
			$this->settings->export_sales_notes = $this->request->post('export_sales_notes');

			$this->design->assign('message_success', 'saved');
		}

		return $this->design->fetch('settings_feed.tpl');
	}
}
