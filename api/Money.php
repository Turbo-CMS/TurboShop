<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Money extends Turbo
{
	private $currencies = array();
	private $currency;

	public function __construct()
	{
		parent::__construct();

		if (isset($this->settings->price_decimals_point))
			$this->decimals_point = $this->settings->price_decimals_point;

		if (isset($this->settings->price_thousands_separator))
			$this->thousands_separator = $this->settings->price_thousands_separator;

		$this->design->smarty->registerPlugin('modifier', 'convert', array($this, 'convert'));

		$this->init_currencies();
	}

	public function init_currencies()
	{
		$lang_sql = $this->languages->get_query(array('object' => 'currency'));
		$this->currencies = array();

		// Select from base currency 
		$query = "SELECT c.id, c.name, c.sign, c.code, c.rate_from, c.rate_to, c.cents, c.position, c.enabled, $lang_sql->fields FROM __currencies c $lang_sql->join ORDER BY position";
		$this->db->query($query);

		$results = $this->db->results();

		foreach ($results as $c) {
			$this->currencies[$c->id] = $c;
		}

		$this->currency = reset($this->currencies);
	}

	public function get_currencies($filter = array())
	{
		$currencies = array();
		foreach ($this->currencies as $id => $currency)
			if ((isset($filter['enabled']) && $filter['enabled'] == 1 && $currency->enabled) || empty($filter['enabled']))
				$currencies[$id] = $currency;

		return $currencies;
	}

	public function get_currency($id = null)
	{
		if (!empty($id) && is_integer($id) && isset($this->currencies[$id]))
			return $this->currencies[$id];

		if (!empty($id) && is_string($id)) {
			foreach ($this->currencies as $currency) {
				if ($currency->code == $id)
					return $currency;
			}
		}

		return $this->currency;
	}

	public function add_currency($currency)
	{
		$currency = (object)$currency;
		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($currency, 'currency');

		$query = $this->db->placehold('INSERT INTO __currencies SET ?%', $currency);

		if (!$this->db->query($query)) {
			return false;
		}

		$id = $this->db->insert_id();

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'currency');
		}

		$this->db->query("UPDATE __currencies SET position=id WHERE id=?", $id);
		$this->init_currencies();
		return $id;
	}

	public function update_currency($id, $currency)
	{
		$currency = (object)$currency;
		// Check if there is multilingualism and pick up descriptions for translation
		$result = $this->languages->get_description($currency, 'currency');

		$query = $this->db->placehold('UPDATE __currencies SET ?% WHERE id in (?@)', $currency, (array)$id);
		if (!$this->db->query($query)) {
			return false;
		}

		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'currency', $this->languages->lang_id());
		}

		$this->init_currencies();
		return $id;
	}

	public function delete_currency($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("DELETE FROM __currencies WHERE id=? LIMIT 1", intval($id));
			$this->db->query($query);
			$this->db->query("DELETE FROM __lang_currencies WHERE currency_id=?", intval($id));
		}
		$this->init_currencies();
	}

	public function convert($price, $currency_id = null, $format = true)
	{
		if (isset($currency_id)) {
			if (is_numeric($currency_id))
				$currency = $this->get_currency((int)$currency_id);
			else
				$currency = $this->get_currency((string)$currency_id);
		} elseif (isset($_SESSION['currency_id']))
			$currency = $this->get_currency($_SESSION['currency_id']);
		else
			$currency = current($this->get_currencies(array('enabled' => 1)));

		$result = $price;

		if (!empty($currency)) {

			// Multiply by the exchange rate
			$result = $result * $currency->rate_from / $currency->rate_to;

			// Display precision, decimal places
			$precision = isset($currency->cents) ? $currency->cents : 2;
		}

		// Price formatting
		if ($format)
			$result = number_format($result, $precision, $this->settings->decimals_point, $this->settings->thousands_separator);
		else
			$result = round($result, $precision);

		return $result;
	}
}
