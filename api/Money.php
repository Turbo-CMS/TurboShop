<?php

require_once 'Turbo.php';

class Money extends Turbo
{
	private $currencies = [];
	private $currency;

	public function __construct()
	{
		parent::__construct();

		$this->design->smarty->registerPlugin('modifier', 'convert', [$this, 'convert']);
		$this->initCurrencies();
	}

	/**
	 * Initialize Currencies
	 */
	public function initCurrencies()
	{
		$langSql = $this->languages->getQuery(['object' => 'currency']);

		$this->currencies = [];

		$query = $this->db->placehold(
			"SELECT 
				c.id, 
				c.name, 
				c.sign, 
				c.code, 
				c.rate_from, 
				c.rate_to, 
				c.cents, 
				c.position, 
				c.enabled, 
				$langSql->fields
			FROM 
				__currencies c 
				$langSql->join 
			ORDER BY 
				position"
		);

		$this->db->query($query);
		$results = $this->db->results();

		foreach ($results as $c) {
			$this->currencies[$c->id] = $c;
		}

		$this->currency = reset($this->currencies);
	}

	/**
	 * Get Currencies
	 */
	public function getCurrencies($filter = [])
	{
		$currencies = [];
		foreach ($this->currencies as $id => $currency) {
			if ((isset($filter['enabled']) && $filter['enabled'] == 1 && $currency->enabled) || empty($filter['enabled'])) {
				$currencies[$id] = $currency;
			}
		}

		return $currencies;
	}

	/**
	 * Get Currency
	 */
	public function getCurrency($id = null)
	{
		if (!empty($id) && is_integer($id) && isset($this->currencies[$id])) {
			return $this->currencies[$id];
		}

		if (!empty($id) && is_string($id)) {
			foreach ($this->currencies as $currency) {
				if ($currency->code == $id) {
					return $currency;
				}
			}
		}

		return $this->currency;
	}

	/**
	 * Add Currency
	 */
	public function addCurrency($currency)
	{
		$currency = (object) $currency;
		$result = $this->languages->getDescription($currency, 'currency');
		$query = $this->db->placehold('INSERT INTO __currencies SET ?%', $currency);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insertId();

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'currency');
		}

		$this->db->query("UPDATE __currencies SET position=id WHERE id=?", $id);
		$this->initCurrencies();

		return $id;
	}

	/**
	 * Update Currency
	 */
	public function updateCurrency($id, $currency)
	{
		$currency = (object) $currency;
		$result = $this->languages->getDescription($currency, 'currency');
		$query = $this->db->placehold('UPDATE __currencies SET ?% WHERE id in (?@)', $currency, (array) $id);

		if (!$this->db->query($query)) {
			return false;
		}

		if (!empty($result->description)) {
			$this->languages->actionDescription($id, $result->description, 'currency', $this->languages->langId());
		}

		$this->initCurrencies();

		return $id;
	}

	/**
	 * Delete Currency
	 */
	public function deleteCurrency($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __currencies WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);
			$this->db->query("DELETE FROM __lang_currencies WHERE currency_id=?", (int) $id);
		}

		$this->initCurrencies();
	}

	/**
	 * Convert
	 */
	public function convert($price, $currency_id = null, $format = true)
	{
		if (isset($currency_id)) {
			if (is_numeric($currency_id)) {
				$currency = $this->getCurrency((int)$currency_id);
			} else {
				$currency = $this->getCurrency((string)$currency_id);
			}
		} elseif (isset($_SESSION['currency_id'])) {
			$currency = $this->getCurrency($_SESSION['currency_id']);
		} else {
			$currency = current($this->getCurrencies(['enabled' => 1]));
		}

		$result = $price;

		if (!empty($currency)) {
			$result = $result * $currency->rate_from / $currency->rate_to;
			$precision = isset($currency->cents) ? $currency->cents : 2;
		}

		if ($format) {
			$result = number_format($result, $precision, $this->settings->decimals_point, $this->settings->thousands_separator);
		} else {
			$result = round($result, $precision);
		}

		return $result;
	}
}
