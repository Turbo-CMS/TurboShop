<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */


class Javascript extends Turbo
{

	protected $events = array();

	protected $gzip_level = null;

	protected $cache_dir = 'js/';

	protected $min_filesize = 256;

	protected $order_num = 0;

	/*
	* Register js file(s)
	* @param $id
	* @param $files
	* @param integer $priority
	*/
	public function add_files($id, $files, $priority = 10)
	{
		$event = $this->get_event($id);

		foreach ((array) $files as $path) {
			$file = trim($path, '/ ');
			$path = $this->config->root_dir . $file;
			if (is_file($path))
				$event->data[$path] = (object) array('type' => 'file', 'time' => filemtime($path), 'original' => $file, 'event' => $event->id);
		}

		if (!$event->data)
			return false;

		$event->priority = intval($priority);

		return $this->events[$event->id] = $event;
	}

	/*
	* Registration of arbitrary js code
	* @param $id
	* @param string $code
	* @param integer $priority
	*/
	public function add_code($id, $code, $priority = 10)
	{
		$event = $this->get_event($id);

		if (!$code = trim($code))
			return false;

		$event->data[$code] = (object) array('type' => 'code', 'time' => 0, 'event' => $event->id);
		$event->priority = intval($priority);

		return $this->events[$event->id] = $event;
	}

	/*
	* Unregister js file(s) or code
	* @param $id
	*/
	public function unplug($id)
	{
		unset($this->events[$id]);
	}

	/*
	* Output js file(s) or code
	* @param $event
	*/
	public function render($event_id = null, $minify = null, $combine = true)
	{

		if (is_null($minify))
			$minify = $this->config->minify_js;

		// compression can be used here
		// check if it is supported by the browser
		if (is_null($this->gzip_level)) {
			$this->gzip_level = 0;

			// Create the package if it doesn't exist
			$this->cache_dir =  $this->config->minify_cache_dir . $this->cache_dir;
			if (!is_dir($this->config->root_dir . $this->cache_dir))
				mkdir($this->config->root_dir . $this->cache_dir, 0755, true);


			if ($this->config->minify_gzip_level > 0 && isset($_SERVER['HTTP_ACCEPT_ENCODING'])) {
				if (stripos($_SERVER['HTTP_ACCEPT_ENCODING'], 'gzip') !== false) {
					if (function_exists('ob_gzhandler') && !ini_get('zlib.output_compression')) {
						$this->gzip_level = $this->config->minify_gzip_level;
					}
				}
			}
		}

		// If the resource ID is given, we will return only it
		if (!is_null($event_id)) {
			if (isset($this->events[$event_id])) {
				$events_data = $this->events[$event_id]->data;
				// Clean up from re-rendering
				$this->unplug($event_id);
			}
		} else {
			uasort($this->events, array($this, 'sort_priority_callback'));

			$events_data = array();
			foreach ($this->events as $ev)
				$events_data = array_merge($events_data, $ev->data);

			// Clean up from re-rendering
			$this->events = array();
		}

		$result = '';

		// If there is nothing to output
		if (empty($events_data))
			return $result;


		// All off give back originals 
		if (!$combine && !$minify) {
			foreach ($events_data as $js => $data) {
				if ($data->type == 'code')
					$result .= $this->render_tag($js);
				else
					$result .= $this->render_tag(false, $data->original);
			}
		} else // Something is enabled
		{

			// If we do not pack data into 1 file
			if (!$combine) {
				foreach ($events_data as $js => $e) {
					if ($e->type == 'code')
						$prefix = $e->event;
					else
						$prefix = pathinfo($e->original, PATHINFO_FILENAME);

					$result .= $this->proteced(array($js => $e), $prefix, $minify);
				}
			} else // Pack everything into 1 file
			{

				$prefix = 'pack';
				if (count($events_data) == 1) {
					$e = reset($events_data);
					if ($e->type == 'code')
						$prefix = $e->event;
					else
						$prefix = pathinfo($e->original, PATHINFO_FILENAME);
				} elseif (!is_null($event_id)) {
					$prefix = $event_id;
				}
				$result = $this->proteced($events_data, $prefix, $minify);
			}
		}


		return $result;
	}

	protected function proteced($data, $prefix, $minify)
	{

		if ($minify && substr($prefix, -4) !== '.min')
			$prefix .= '.min';

		list($cacheFile, $cachePath) = $this->get_cacheFile($data, $prefix);

		// No main cache file 
		if (!is_file($cachePath)) {
			$content = $this->minify($data, $cachePath, $minify);
			if ($this->gzip_level && !$content)
				$cacheFile = $cacheFile . '.gz' . $this->gzip_level;
		} else {
			$content = false;
			if (filesize($cachePath) < $this->min_filesize)
				$content = file_get_contents($cachePath);
			elseif ($this->gzip_level)
				$cacheFile = $cacheFile . '.gz' . $this->gzip_level;
		}

		return $this->render_tag($content, $cacheFile);
	}

	protected function get_event($event_id)
	{
		if (isset($this->events[$event_id]))
			return $this->events[$event_id];

		$event = new stdClass();
		$event->id = $event_id;
		$event->data = array();
		$event->order = $this->order_num++;
		return $event;
	}

	public function render_tag($content, $js_file = null)
	{
		$tag = '<script type="text/javascript"';
		if ($content)
			$tag .= '>' . $content;
		else
			$tag .= ' src="' . $js_file . '">';

		return $tag . '</script>';
	}

	protected function minify($data, $cache, $minify)
	{
		// Use compression
		if ($minify) {
			require_once $this->config->root_dir . '/minify/MatthiasMullie/autoload.php';

			$minifier = new MatthiasMullie\Minify\JS(array_keys($data));
			$content = $minifier->minify($cache);
		} else // Just glue
		{
			$content = '';
			foreach ($data as $js => $ev)
				$content .= ($ev->type == 'file' ? file_get_contents($js) : $js);

			file_put_contents($cache, $content);
		}

		// If the content is less than min_filesize then we give it to html
		if (strlen($content) > $this->min_filesize)
			$content = false;

		// Return content or false (if serving as files)
		return $content;
	}

	/*
	* We form the name of the cache file based on the parameters
	*/
	protected function get_cacheFile($data, $prefix)
	{
		$key = $this->hash(var_export($data, 1));

		$cacheFile = $this->cache_dir . $key . '_' . $prefix . '.js';
		return array($cacheFile, $this->config->root_dir . $cacheFile);
	}

	/*
	* String hashing
	*/
	protected function hash($str)
	{
		$hash = crc32($str);
		return ($hash >= 0 ? $hash : sprintf('%u', $hash));
	}

	/* 
	* Sort array by priority 
	*/
	public function sort_priority_callback($a, $b)
	{
		if ($a->priority == $b->priority)
			return ($a->order < $b->order) ? -1 : 1;

		return ($a->priority < $b->priority) ? 1 : -1;
	}
}
