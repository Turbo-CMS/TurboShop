<?php

require_once 'Turbo.php';

class Stylesheet extends Turbo
{
	protected $events = [];
	protected $gzip_level = null;
	protected $cache_dir = 'css/';
	protected $min_filesize = 256;
	protected $order_num = 0;
	protected $less_used = false;
	protected $less_object = null;

	/**
	 * Add File
	 */
	public function addFiles($id, $files, $priority = 10, $less = false)
	{
		$event = $this->getEvent($id);

		foreach ((array) $files as $path) {
			$file = trim($path, '/ ');
			$path = $this->config->root_dir . $file;

			if (is_file($path)) {
				$event->data[$path] = (object) [
					'type' => 'file',
					'time' => ($less ? 0 : filemtime($path)),
					'original' => $file,
					'event' => $event->id,
					'less' => $less,
				];
			}
		}

		if (!$event->data) {
			return false;
		}

		$event->priority = (int) $priority;

		if ($less) {
			$this->less_used = true;
		}

		return $this->events[$event->id] = $event;
	}

	/**
	 * Add Code
	 */
	public function addCode($id, $code, $priority = 10, $less = false)
	{
		$event = $this->getEvent($id);

		if (!$code = trim($code)) {
			return false;
		}

		$event->data[$code] = (object) [
			'type' => 'code',
			'time' => 0,
			'event' => $event->id,
			'less' => $less,
		];

		$event->priority = (int) $priority;

		if ($less) {
			$this->less_used = true;
		}

		return $this->events[$event->id] = $event;
	}

	/**
	 * Unregister
	 */
	public function unplug($id)
	{
		unset($this->events[$id]);
	}

	/**
	 * Render
	 */
	public function render($eventId = null, $minify = null, $combine = true)
	{

		if (is_null($minify)) {
			$minify = $this->config->minify_css;
		}

		if (is_null($this->gzip_level)) {
			$this->gzip_level = 0;
			$this->cache_dir =  $this->config->minify_cache_dir . $this->cache_dir;

			if (!is_dir($this->config->root_dir . $this->cache_dir)) {
				mkdir($this->config->root_dir . $this->cache_dir, 0755, true);
			}

			if ($this->config->minify_gzip_level > 0 && isset($_SERVER['HTTP_ACCEPT_ENCODING'])) {
				if (stripos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false) {
					if (function_exists('ob_gzhandler') && !ini_get('zlib.output_compression')) {
						$this->gzip_level = $this->config->minify_gzip_level;
					}
				}
			}
		}

		if (!is_null($eventId)) {
			if (isset($this->events[$eventId])) {
				$events_data = $this->events[$eventId]->data;
				$this->unplug($eventId);
			}
		} else {
			uasort($this->events, [$this, 'sortPriorityCallback']);

			$events_data = [];

			foreach ($this->events as $ev) {
				$events_data = array_merge($events_data, $ev->data);
			}

			$this->events = [];
		}

		$result = '';

		if (empty($events_data)) {
			return $result;
		}

		if (!$combine && !$minify) {
			foreach ($events_data as $css => $data) {
				if ($data->less) {
					$this->verifyLess($css, $data);
				}

				if ($data->type == 'code') {
					$result .= $this->renderTag($css, "");
				} else {
					$result .= $this->renderTag(false, $data->original);
				}
			}
		} else {
			if (!$combine) {
				foreach ($events_data as $css => $e) {
					if ($e->type == 'code') {
						$prefix = $e->event;
					} else {
						$prefix = pathinfo($e->original, PATHINFO_FILENAME);
					}

					$result .= $this->proteced(array($css => $e), $prefix, $minify);
				}
			} else {

				$prefix = 'pack';

				if (count($events_data) == 1) {
					$e = reset($events_data);

					if ($e->type == 'code') {
						$prefix = $e->event;
					} else {
						$prefix = pathinfo($e->original, PATHINFO_FILENAME);
					}
				} elseif (!is_null($eventId)) {
					$prefix = $eventId;
				}

				$result = $this->proteced($events_data, $prefix, $minify);
			}
		}

		return $result;
	}

	/**
	 * Proteced
	 */
	protected function proteced($data, $prefix, $minify)
	{

		if ($minify && substr($prefix, -4) !== '.min') {
			$prefix .= '.min';
		}

		list($cacheFile, $cachePath) = $this->getCacheFile($data, $prefix);

		$lessVerify = [];

		if ($this->less_used) {
			$new_data = [];

			foreach ($data as $css => $_data) {
				if ($_data->less) {
					$lessVerify[] = $this->verifyLess($css, $_data);
				}

				$new_data[$css] = $_data;
			}

			$data = $new_data;
		}

		if (in_array(false, $lessVerify) && is_file($cachePath)) {
			unlink($cachePath);
		}

		if (!is_file($cachePath)) {
			$minifier = $this->getMinifier(array_keys($data), $minify);
			$content = $minifier->minify($cachePath);

			if (strlen($content) > $this->min_filesize) {
				$content = false;
			}

			if ($this->gzip_level && !$content) {
				$cacheFile = $cacheFile . '.gz' . $this->gzip_level;
			}
		} else {
			$content = false;

			if (filesize($cachePath) < $this->min_filesize) {
				$content = file_get_contents($cachePath);
			} elseif ($this->gzip_level) {
				$cacheFile = $cacheFile . '.gz' . $this->gzip_level;
			}
		}

		return $this->renderTag($content, $cacheFile);
	}

	/**
	 * Get Event
	 */
	protected function getEvent($eventId)
	{
		if (isset($this->events[$eventId])) {
			return $this->events[$eventId];
		}

		$event = new stdClass();
		$event->id = $eventId;
		$event->data = [];
		$event->order = $this->order_num++;
		return $event;
	}

	/**
	 * Verify Less
	 */
	protected function verifyLess(&$resource, &$data)
	{
		$valid = true;

		try {
			$key = $this->hash(var_export($data, 1));

			if ($data->type == 'code') {
				$prefix = $data->event;
			} else {
				$prefix = pathinfo($data->original, PATHINFO_FILENAME);
			}

			list($outputFile, $outputPath) = $this->getCacheFile($data, $prefix . '.less');

			$cachePath = $outputPath . '.cache';

			if (!is_file($outputPath) || !is_readable($cachePath) || !is_array($cache = @unserialize(file_get_contents($cachePath)))) {
				$valid = false;
			} else {
				foreach ($cache['files'] as $fname => $ftime) {
					if (!is_file($fname) or filemtime($fname) > $ftime) {
						$valid = false;
						break;
					}
				}
			}

			if (!$valid) {
				include_once $this->config->root_dir . '/minify/less/lessc.inc.php';
				$cache = lessc::cexecute($resource);

				if ($data->type == 'file') {
					$minifier = $this->getMinifier($cache['compiled'], false);
					$minifier->setRootSource($data->original);
					$cache['compiled'] = $minifier->minify($outputPath);
				} else {
					file_put_contents($outputPath, $cache['compiled']);
				}

				unset($cache['compiled']);
				file_put_contents($cachePath, serialize($cache));
			}

			$resource = $outputPath;
			$data->original = $outputFile;
		} catch (exception $e) {
			trigger_error("Less error: " . $e->getMessage(), E_USER_ERROR);
			$valid = false;
		}

		return $valid;
	}

	/**
	 * Get Minifier
	 */
	protected function getMinifier($data, $minify)
	{
		require_once $this->config->root_dir . '/minify/MatthiasMullie/autoload.php';

		if ($minify) {
			$minifier = new MatthiasMullie\Minify\CSS($data);
			$minifier->setMaxImportSize(0);
			$minifier->setImportExtensions(array());
		} else {
			$minifier = new MatthiasMullie\Minify\CSSPacker($data);
		}

		return $minifier;
	}

	/**
	 * Get Cache File
	 */
	protected function getCacheFile($data, $prefix)
	{
		$key = $this->hash(var_export($data, 1));
		$cacheFile = $this->cache_dir . $key . '_' . $prefix . '.css';

		return [$cacheFile, $this->config->root_dir . $cacheFile];
	}

	protected function renderTag($content, $cssFile)
	{
		if ($content) {
			return '<style type="text/css">' . $content . '</style>';
		} else {
			return '<link href="' . $cssFile . '" rel="stylesheet"/>';
		}
	}

	/**
	 * String Hashing
	 */
	protected function hash($str)
	{
		$hash = crc32($str);
		return ($hash >= 0 ? $hash : sprintf('%u', $hash));
	}

	/** 
	 * Sort Priority Callback
	 */
	public function sortPriorityCallback($a, $b)
	{
		if ($a->priority == $b->priority) {
			return ($a->order < $b->order) ? -1 : 1;
		}

		return ($a->priority < $b->priority) ? 1 : -1;
	}
}
