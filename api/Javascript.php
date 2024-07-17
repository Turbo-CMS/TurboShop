<?php

require_once 'Turbo.php';

class Javascript extends Turbo
{
	protected $events = [];
	protected $gzip_level = null;
	protected $cache_dir = 'js/';
	protected $min_filesize = 256;
	protected $order_num = 0;

	/**
	 * Add File
	 */
	public function addFiles($id, $files, $priority = 10)
	{
		$event = $this->getEvent($id);

		foreach ((array) $files as $path) {
			$file = trim($path, '/ ');
			$path = $this->config->root_dir . $file;

			if (is_file($path)) {
				$event->data[$path] = (object) [
					'type' => 'file',
					'time' => filemtime($path),
					'original' => $file,
					'event' => $event->id
				];
			}
		}

		if (!$event->data) {
			return false;
		}

		$event->priority = (int) $priority;

		return $this->events[$event->id] = $event;
	}

	/**
	 * Add Code
	 */
	public function addCode($id, $code, $priority = 10)
	{
		$event = $this->getEvent($id);

		if (!$code = trim($code)) {
			return false;
		}

		$event->data[$code] = (object) [
			'type' => 'code',
			'time' => 0,
			'event' => $event->id
		];

		$event->priority = (int) $priority;

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
			$minify = $this->config->minify_js;
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
			foreach ($events_data as $js => $data) {
				if ($data->type == 'code') {
					$result .= $this->renderTag($js);
				} else {
					$result .= $this->renderTag(false, $data->original);
				}
			}
		} else {

			if (!$combine) {
				foreach ($events_data as $js => $e) {
					if ($e->type == 'code') {
						$prefix = $e->event;
					} else {
						$prefix = pathinfo($e->original, PATHINFO_FILENAME);
					}

					$result .= $this->proteced(array($js => $e), $prefix, $minify);
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

		if (!is_file($cachePath)) {
			$content = $this->minify($data, $cachePath, $minify);

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
	 * Render Tag
	 */
	public function renderTag($content, $js_file = null)
	{
		$tag = '<script type="text/javascript"';

		if ($content) {
			$tag .= '>' . $content;
		} else {
			$tag .= ' src="' . $js_file . '">';
		}

		return $tag . '</script>';
	}

	/**
	 * Minify
	 */
	protected function minify($data, $cache, $minify)
	{
		if ($minify) {
			$minifier = new MatthiasMullie\Minify\JS(array_keys($data));
			$content = $minifier->minify($cache);
		} else {
			$content = '';

			foreach ($data as $js => $ev) {
				$content .= ($ev->type == 'file' ? file_get_contents($js) : $js);
			}

			file_put_contents($cache, $content);
		}

		if (strlen($content) > $this->min_filesize) {
			$content = false;
		}

		return $content;
	}

	/**
	 * Get Cache File
	 */
	protected function getCacheFile($data, $prefix)
	{
		$key = $this->hash(var_export($data, 1));

		$cacheFile = $this->cache_dir . $key . '_' . $prefix . '.js';

		return [$cacheFile, $this->config->root_dir . $cacheFile];
	}

	/**
	 * Hashing
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
