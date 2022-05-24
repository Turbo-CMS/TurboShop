<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */


class Stylesheet extends Turbo
{

	protected $events = array();

	protected $gzip_level = null;

	protected $cache_dir = 'css/';

	protected $min_filesize = 256;

	protected $order_num = 0;

	// lessphp
	protected $less_used = false;
	protected $less_object = null;

	/*
	* Registration css file(s)
	* @param $id
	* @param $files
	* @param integer $priority
	*/
	public function add_files($id, $files, $priority = 10, $less = false)
	{
		$event = $this->get_event($id);

		foreach ((array) $files as $path) {
			$file = trim($path, '/ ');
			$path = $this->config->root_dir . $file;
			if (is_file($path))
				$event->data[$path] = (object) array('type' => 'file', 'time' => ($less ? 0 : filemtime($path)), 'original' => $file, 'event' => $event->id, 'less' => $less);
		}

		if (!$event->data)
			return false;

		$event->priority = intval($priority);

		if ($less)
			$this->less_used = true;

		return $this->events[$event->id] = $event;
	}

	/*
	* Register custom css code
	* @param $id
	* @param string $code
	* @param integer $priority
	*/
	public function add_code($id, $code, $priority = 10, $less = false)
	{
		$event = $this->get_event($id);

		if (!$code = trim($code))
			return false;

		$event->data[$code] = (object) array('type' => 'code', 'time' => 0, 'event' => $event->id, 'less' => $less);
		$event->priority = intval($priority);

		if ($less)
			$this->less_used = true;

		return $this->events[$event->id] = $event;
	}

	/*
	* Unregister css file(s) or code
	* @param $id
	*/
	public function unplug($id)
	{
		unset($this->events[$id]);
	}


	/*
	* Output css file(s) or code
	* @param $event
	*/
	public function render($event_id = null, $minify = null, $combine = true)
	{

		if (is_null($minify))
			$minify = $this->config->minify_css;

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
			foreach ($events_data as $css => $data) {
				if ($data->less)
					$this->verify_less($css, $data);

				if ($data->type == 'code')
					$result .= $this->render_tag($css);
				else
					$result .= $this->render_tag(false, $data->original);
			}
		} else // Something is enabled
		{

			// If we do not pack data into 1 file
			if (!$combine) {
				foreach ($events_data as $css => $e) {
					if ($e->type == 'code')
						$prefix = $e->event;
					else
						$prefix = pathinfo($e->original, PATHINFO_FILENAME);

					$result .= $this->proteced(array($css => $e), $prefix, $minify);
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

		// There is less. Let's check its caches
		$less_verify = array();

		if ($this->less_used) {
			$new_data = array();
			foreach ($data as $css => $_data) {
				if ($_data->less)
					$less_verify[] = $this->verify_less($css, $_data);

				$new_data[$css] = $_data;
			}
			$data = $new_data;
		}

		// Something is wrong with the cache less. Let's update
		if (in_array(false, $less_verify) && is_file($cachePath))
			unlink($cachePath);

		// No main cache file 
		if (!is_file($cachePath)) {
			$minifier = $this->get_minifier(array_keys($data), $minify);
			$content = $minifier->minify($cachePath);

			// If the content is less than min_filesize then we give it to html
			if (strlen($content) > $this->min_filesize)
				$content = false;

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

	/*
	* Handling less syntax
	*/
	protected function verify_less(&$resource, &$data)
	{
		$valid = true;

		try {

			$key = $this->hash(var_export($data, 1));

			if ($data->type == 'code')
				$prefix = $data->event;
			else
				$prefix = pathinfo($data->original, PATHINFO_FILENAME);

			list($outputFile, $outputPath) = $this->get_cacheFile($data, $prefix . '.less');

			$cachePath = $outputPath . '.cache';

			// no cache or target file
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

			// Less has changed
			if (!$valid) {
				include_once $this->config->root_dir . '/minify/less/lessc.inc.php';
				$cache = lessc::cexecute($resource);

				if ($data->type == 'file') {
					// Change path to application files
					$minifier = $this->get_minifier($cache['compiled'], false);
					$minifier->setRootSource($data->original);
					$cache['compiled'] = $minifier->minify($outputPath);
				} else {
					file_put_contents($outputPath, $cache['compiled']);
				}
				unset($cache['compiled']); // To reduce cache size 
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

	/*
	* Get MatthiasMullie minify object
	*/
	protected function get_minifier($data, $minify)
	{
		// Use compression
		require_once $this->config->root_dir . '/minify/MatthiasMullie/autoload.php';

		if ($minify) {
			$minifier = new MatthiasMullie\Minify\CSS($data);

			// Disable import of application files. Soon I will finalize their caching
			$minifier->setMaxImportSize(0);
			$minifier->setImportExtensions(array());
		} else // Просто клеим
			$minifier = new MatthiasMullie\Minify\CSSPacker($data);

		// Return content	
		return $minifier;
	}

	/*
	* We form the name of the cache file based on the parameters
	*/
	protected function get_cacheFile($data, $prefix)
	{
		$key = $this->hash(var_export($data, 1));

		$cacheFile = $this->cache_dir . $key . '_' . $prefix . '.css';
		return array($cacheFile, $this->config->root_dir . $cacheFile);
	}

	protected function render_tag($content, $css_file)
	{
		if ($content)
			return '<style type="text/css">' . $content . '</style>';
		else
			return '<link href="' . $css_file . '" rel="stylesheet"/>';
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
