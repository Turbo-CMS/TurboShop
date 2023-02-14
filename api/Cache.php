<?php

require_once('Turbo.php');

class Cache extends Turbo
{
	public function __construct()
	{
		$this->init();
	}

	public $mem;

	private $configuration = [
		'host' => '127.0.0.1',
		'port' => 11211,
		'lifeTimeCache' => 86400,
	];
	/**
	 * PHP extension type flag to use
	 * True - memcache
	 * False - memcached
	 */
	private $isMemcached = false;

	public function init()
	{
		if ($this->settings->cache_type == 1)
			$cache_type = 'memcached';
		else
			$cache_type = 'memcache';

		$this->isMemcached = $this->isMemcachedUse();
		if (!extension_loaded($cache_type)) {
			throw new Exception("Php extension {$cache_type} not found. Please install the memcache extension.");
		}
		$this->isMemcached ? $this->mem = new Memcached() : $this->mem = new Memcache();
		$this->mem->addServer($this->configuration['host'], $this->configuration['port']);
	}

	public function get($stringKey)
	{
		if ($this->mem != null)
			$result = $this->mem->get($this->stringToHash($stringKey));

		if (!empty($result))
			return $result;
		else
			return false;
	}

	/**
	 * Pushes a value into the cache by key
	 * @param string $stringKey key
	 * @param $value Result set (set of data to put into cache)
	 * @param $lifeCache cache lifetime 
	 */
	public function set($stringKey, $value)
	{
		if ($this->settings->cache_time > 0)
			$lifeCache = $this->settings->cache_time;
		else
			$lifeCache = $this->configuration['lifeTimeCache'];

		if ($this->isMemcached) {
			$this->mem->set($this->stringToHash($stringKey), $value, $lifeCache);
		} else {
			$this->mem->set($this->stringToHash($stringKey), $value, 0, $lifeCache); // For compression, replace 0 with MEMCACHE_COMPRESSED
		}
	}

	/**
	 * Removes a value from memory by key
	 * @var string $stringKey attribute labels
	 */
	public function del($stringKey)
	{
		$this->mem->delete($this->stringToHash($stringKey));
	}

	/**
	 * Invalidates all existing entries in the cache
	 * @var integer $delay The period of time after which to perform a complete clearing of the cache
	 * @return true or false
	 */
	public function clearall($delay = 0)
	{
		$this->mem->flush();
	}

	/**
	 * From regular string to md5 hash
	 * @var string $stringKey - Key
	 */
	private function stringToHash($stringKey)
	{
		// uniqueize the hash by domain
		$stringKey = $this->config->root_url . $stringKey;
		if ($this->isMemcached)
			return md5('key' . $stringKey);
		else
			return md5($stringKey);
	}

	/**
	 * Checks if PHP memcached extension is used
	 */
	private function isMemcachedUse()
	{
		if ($this->settings->cache_type == 1)
			return true;
	}
}
