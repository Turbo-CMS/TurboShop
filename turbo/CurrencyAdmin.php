<?php

require_once 'api/Turbo.php';

class CurrencyAdmin extends Turbo
{
	public function fetch()
	{
		if ($this->request->isMethod('post')) {
			$currencies = [];

			foreach ((array) $this->request->post('currency') as $n => $va) {
				foreach ((array) $va as $i => $v) {
					if (!isset($currencies[$i])) {
						$currencies[$i] = new stdClass();
					}

					$currencies[$i]->$n = $v;
				}
			}

			$currenciesIds = [];

			foreach ($currencies as $currency) {
				if ($currency->id) {
					$this->money->updateCurrency((int) $currency->id, $currency);
				} else {
					$currency->id = (int) $this->money->addCurrency($currency);
				}

				$currenciesIds[] = (int) $currency->id;
			}

			$query = $this->db->placehold("DELETE FROM __currencies WHERE id NOT IN(?@)", $currenciesIds);
			$this->db->query($query);

			$oldCurrency = $this->money->getCurrency();
			$newCurrency = reset($currencies);

			if ($oldCurrency->id !== $newCurrency->id) {
				$coef = $newCurrency->rate_from / $newCurrency->rate_to;

				if ($this->request->post('recalculate') == 1) {
					$this->db->query("UPDATE __variants SET price=price*?, compare_price=compare_price*? where currency_id=0", $coef, $coef);
					$this->db->query("UPDATE __delivery SET price=price*?, free_from=free_from*?", $coef, $coef);
					$this->db->query("UPDATE __orders SET delivery_price=delivery_price*?", $coef);
					$this->db->query("UPDATE __orders SET total_price=total_price*?", $coef);
					$this->db->query("UPDATE __purchases SET price=price*?", $coef);
					$this->db->query("UPDATE __coupons SET value=value*? WHERE type='absolute'", $coef);
					$this->db->query("UPDATE __coupons SET min_order_price=min_order_price*?", $coef);
					$this->db->query("UPDATE __orders SET coupon_discount=coupon_discount*?", $coef);
				}

				$this->db->query("UPDATE __currencies SET rate_from=1.0*rate_from*$newCurrency->rate_to/$oldCurrency->rate_to");
				$this->db->query("UPDATE __currencies SET rate_to=1.0*rate_to*$newCurrency->rate_from/$oldCurrency->rate_from");
				$this->db->query("UPDATE __currencies SET rate_to = rate_from WHERE id=?", $newCurrency->id);
				$this->db->query("UPDATE __currencies SET rate_to = 1, rate_from = 1 WHERE (rate_to=0 OR rate_from=0) AND id=?", $newCurrency->id);
			}

			asort($currenciesIds);
			$i = 0;

			foreach ($currenciesIds as $currencyId) {
				$this->money->updateCurrency((int) $currenciesIds[$i], ['position' => (int) $currencyId]);
				$i++;
			}

			$action = $this->request->post('action');
			$id = (int) $this->request->post('action_id');

			if (!empty($action) && !empty($id)) {
				switch ($action) {
					case 'disable':
						$this->money->updateCurrency($id, ['enabled' => 0]);
						break;
					case 'enable':
						$this->money->updateCurrency($id, ['enabled' => 1]);
						break;
					case 'show_cents':
						$this->money->updateCurrency($id, ['cents' => 2]);
						break;
					case 'hide_cents':
						$this->money->updateCurrency($id, ['cents' => 0]);
						break;
					case 'delete':
						$this->money->deleteCurrency($id);
						break;
				}
			}
		}

		$currencies = $this->money->getCurrencies();
		$currency = $this->money->getCurrency();

		$this->design->assign('currency', $currency);
		$this->design->assign('currencies', $currencies);

		return $this->design->fetch('currency.tpl');
	}
}
