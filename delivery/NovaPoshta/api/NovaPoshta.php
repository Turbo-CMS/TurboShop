<?php

require_once 'api/Turbo.php';

class NovaPoshta extends Turbo
{

	public function delivery_form($deliveryId)
	{
		$langId = $this->languages->langId();
		$language = $this->languages->languages(['id' => $langId]);
		$langLink = '';
		$firstLang = $this->languages->languages();

		if (!empty($firstLang)) {
			$firstLang = reset($firstLang);

			if ($firstLang->id !== $language->id) {
				$langLink = $language->label;
			}
		}

		$translations = $this->translations;
		$file = "delivery/NovaPoshta/design/lang/" . $langLink . ".php";

		if (!file_exists($file)) {
			foreach (glob("delivery/NovaPoshta/design/lang/??.php") as $f) {
				$file = "delivery/NovaPoshta/design/lang/" . pathinfo($f, PATHINFO_FILENAME) . ".php";
				break;
			}
		}

		require_once($file);

		$delivery = $this->delivery->getDelivery($deliveryId);
		$deliverySettings = $this->delivery->getDeliverySettings($deliveryId);

		$this->design->assign('delivery_settings', $deliverySettings);
		$this->design->assign('delivery', $delivery);

		$this->design->assign('translate', $translations);

		return $this->design->fetch('delivery/NovaPoshta/design/html/delivery_form.tpl');
	}
}
