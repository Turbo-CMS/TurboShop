<?php

require_once 'api/Turbo.php';

class ImportYmlAdmin extends Turbo
{
	public $importFilesDir = 'turbo/files/import/';
	public $importFile = 'import.yml';
	public $importFileCsv = 'import.csv';
	public $allowedExtensions = ['yml', 'gz'];
	private $locale = 'en_US.UTF-8';

	private $columns = [
		'name' => 'name',
		'url' => 'url',
		'visible' => 'visible',
		'featured' => 'featured',
		'category' => 'category',
		'brand' => 'brand',
		'variant' => 'variant',
		'price' => 'price',
		'currency' => 'currency',
		'weight' => 'weight',
		'compare price' => 'compare_price',
		'sku' => 'sku',
		'stock' => 'stock',
		'meta title' => 'meta_title',
		'meta keywords' => 'meta_keywords',
		'meta description' => 'meta_description',
		'annotation' => 'annotation',
		'description' => 'description',
		'images' => 'images',
	];

	private $columnsMin = [
		'name' => '###1###',
		'url' => '###2###',
		'visible' => '###3###',
		'featured' => '###4###',
		'category' => '###5###',
		'brand' => '###6###',
		'variant' => '###7###',
		'price' => '###8###',
		'currency' => '###9###',
		'weight' => '###10###',
		'compare price' => '###11###',
		'sku' => '###12###',
		'stock' => '###13###',
		'meta title' => '###14###',
		'meta keywords' => '###15###',
		'meta description' => '###16###',
		'annotation' => '###17###',
		'description' => '###18###',
		'images' => '###19###',
	];

	private $columnsCompared = [
		'vendorCode' => 'sku',
		'offer_available' => 'visible',
		'price' => 'price',
		'oldprice' => 'compare price',
		'categoryId' => 'category',
		'picture' => 'images',
		'stock' => 'stock',
		'vendor' => 'brand',
		'model' => 'name',
		'name' => 'name',
		'description' => 'description',
	];

	public function fetch()
	{
		$this->design->assign('import_files_dir', $this->importFilesDir);

		if (!is_writable($this->importFilesDir)) {
			$this->design->assign('message_error', 'no_permission');
		}

		$oldLocale = setlocale(LC_ALL, 0);
		setlocale(LC_ALL, $this->locale);

		if (setlocale(LC_ALL, 0) != $this->locale) {
			$this->design->assign('message_error', 'locale_error');
			$this->design->assign('locale', $this->locale);
		}

		setlocale(LC_ALL, $oldLocale);

		if ($this->request->isMethod('post') && ($this->request->files("file") || $this->request->post("file_url"))) {

			$temp = tempnam($this->importFilesDir, 'temp_');

			if (!$this->request->post("file_url")) {
				$uploadedName = $this->request->files("file", "tmp_name");

				if (!$fileOk = move_uploaded_file($uploadedName, $temp)) {
					$this->design->assign('message_error', 'upload_error');
				}
			} else {
				$fileUrl = $this->request->post("file_url");
				$fileOk = copy($fileUrl, $temp);

				if (!$fileOk) {
					$this->design->assign('message_error', 'download_error');
				}
			}

			if ($fileOk && $isGzip = $this->isGzip($temp)) {
				$temp2 = $temp;
				$temp = tempnam($this->importFilesDir, 'temp_');
				$gzOpen = gzopen($temp2, "r");
				$fOpen = fopen($temp, "w");

				while (!feof($gzOpen)) {
					$data = gzread($gzOpen, 2097152);
					fwrite($fOpen, $data);
				}

				fclose($fOpen);
				gzclose($gzOpen);
				unlink($temp2);
			}

			$isXml = $this->isXml($temp);

			if ($fileOk && !$isXml) {
				$content = file_get_contents($temp, false, null, 0, 50);
				$this->design->assign('message_error', "XML ERROR. WRONG HEADER '$content'");
			} else {
				if (!$this->convertFile($temp, $this->importFilesDir . $this->importFile)) {
					$this->design->assign('message_error', 'convert_error');
				}
			}

			unlink($temp);
		} elseif ($this->request->isMethod('post') && $this->request->post("file_fields")) {
			$ymlCurrencies = $this->getYmlCurrencies($this->importFilesDir . $this->request->post("file_fields"));

			if (!empty($ymlCurrencies)) {
				$_SESSION['yml_currencies'] = $ymlCurrencies;
			}

			$ymlParams = $this->getYmlOffersParams($this->importFilesDir . $this->request->post("file_fields"));

			$langId = $this->languages->langId();
			$px = ($langId ? 'l' : 'f');
			$langSql = $this->languages->getQuery(array('object' => 'feature', 'px' => 'f'));
			$this->db->query('SELECT ' . $px . '.name FROM __features f ' . $langSql->join . ' ORDER BY f.position');
			$features = $this->db->results('name');

			$this->design->assign('features',  $features);
			$this->design->assign('yml_params',  $ymlParams);
			$this->design->assign('yml_currencies',  $ymlCurrencies);
			$this->design->assign('columns',  $this->columns);
			$this->design->assign('columns_compared',  $this->columnsCompared);
		}

		if ($this->request->isMethod('post') && $this->isXml($this->importFilesDir . $this->importFile)) {
			$filenameYmlSize = $this->humanFilesize(filesize($this->importFilesDir . $this->importFile));
			$this->design->assign('filename_yml',  $this->importFile);
			$this->design->assign('filename_yml_size',  $filenameYmlSize);
		}

		if ($this->request->isMethod('post') && $this->request->post("start_import_yml")) {

			$ymlParams = $_POST['yml_params'];

			foreach ($ymlParams as $k => $p) {
				if (mb_substr($p, 0, 6) == 'param_') {
					$ymlParams[$k] = mb_substr($p, 6);
				}
			}

			if ($_POST['convert_only'] == 1) {
				$this->design->assign('convert_only',  1);
			}

			if (isset($_POST['yml_import_currency'])) {
				$ymlCurrencies = $_SESSION['yml_currencies'];
				$ymlCurrency['id'] = $_POST['yml_import_currency'];
				$ymlCurrency['rate'] =  $ymlCurrencies[$ymlCurrency['id']]['rate'];
				$dbCurrency = $this->money->getCurrency($ymlCurrency['id']);

				if ($dbCurrency->code != $ymlCurrency['id']) {
					$this->money->addCurrency([
						'name' => $ymlCurrency['id'],
						'sign' => $ymlCurrency['id'],
						'code' => $ymlCurrency['id'],
						'rate_from' => '1.00',
						'rate_to' => '1.00'
					]);

					$ymlCurrency['dbid'] = $this->money->getCurrency($ymlCurrency['id'])->id;
				} else {
					$ymlCurrency['dbid'] = $dbCurrency->id;
				}
			}

			$ymlParams = $this->addMinimumParams($ymlParams, $this->columnsMin);
			$this->convertYmlToCsv($this->importFilesDir . $this->importFile, $this->importFilesDir . $this->importFileCsv, $ymlParams, $ymlCurrency, $ymlCurrencies);
			$filenameCsvSize = $this->humanFilesize(filesize($this->importFilesDir . $this->importFileCsv));
			$this->design->assign('filename_csv',  $this->importFileCsv);
			$this->design->assign('filename_csv_size',  $filenameCsvSize);
		}

		return $this->design->fetch('import_yml.tpl');
	}

	private function isGzip($realpath)
	{
		$mystery_string = file_get_contents($realpath, false, null, 0, 50);

		if (mb_strpos($mystery_string, "\x1f" . "\x8b" . "\x08") !== false) {;
			return true;
		}
	}

	private function isXml($realpath)
	{
		$mystery_string = trim(file_get_contents($realpath, false, null, 0, 50));

		if (mb_strpos($mystery_string, '<?xml') !== false) {
			return true;
		}
	}

	function humanFilesize($bytes, $decimals = 2)
	{
		$sz = str_split('BKMGTP');
		$factor = floor((strlen($bytes) - 1) / 3);
		$suffix = isset($sz[$factor]) ? $sz[$factor] : '';
		return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . $suffix;
	}

	private function convertFile($source, $dest)
	{
		$teststring = file_get_contents($source, false, null, 0, 1000000);

		if (mb_detect_encoding($teststring, 'UTF-8')) {
			return copy($source, $dest);
		} elseif (mb_detect_encoding($teststring, 'CP1251')) {
			if (!$src = fopen($source, "r")) {
				return false;
			}

			if (!$dst = fopen($dest, "w")) {
				return false;
			}

			while (($line = fgets($src, 4096)) !== false) {
				$line = $this->winToUtf($line);
				fwrite($dst, $line);
			}

			fclose($src);
			fclose($dst);
			return true;
		}
	}

	private function winToUtf($text)
	{
		if (function_exists('iconv')) {
			return mb_convert_encoding($text, 'UTF-8', 'windows-1251');
		} else {
			$t = '';

			for ($i = 0, $m = strlen($text); $i < $m; $i++) {
				$c = ord($text[$i]);

				if ($c <= 127) {
					$t .= chr($c);
					continue;
				}

				if ($c >= 192 && $c <= 207) {
					$t .= chr(208) . chr($c - 48);
					continue;
				}

				if ($c >= 208 && $c <= 239) {
					$t .= chr(208) . chr($c - 48);
					continue;
				}

				if ($c >= 240 && $c <= 255) {
					$t .= chr(209) . chr($c - 112);
					continue;
				}

				if ($c == 184) {
					$t .= chr(209) . chr(145);
					continue;
				};

				if ($c == 168) {
					$t .= chr(208) . chr(129);
					continue;
				};

				if ($c == 179) {
					$t .= chr(209) . chr(150);
					continue;
				};

				if ($c == 178) {
					$t .= chr(208) . chr(134);
					continue;
				};

				if ($c == 191) {
					$t .= chr(209) . chr(151);
					continue;
				};

				if ($c == 175) {
					$t .= chr(208) . chr(135);
					continue;
				};

				if ($c == 186) {
					$t .= chr(209) . chr(148);
					continue;
				};

				if ($c == 170) {
					$t .= chr(208) . chr(132);
					continue;
				};

				if ($c == 180) {
					$t .= chr(210) . chr(145);
					continue;
				};

				if ($c == 165) {
					$t .= chr(210) . chr(144);
					continue;
				};

				if ($c == 184) {
					$t .= chr(209) . chr(145);
					continue;
				};
			}
			return $t;
		}
	}

	private function getYmlOffersParams($xmlfile, $picsConcat = true)
	{
		$fields = [];
		$key = '';

		$xml = new XMLReader;
		$xml->open($xmlfile);

		while ($xml->read() && $xml->name !== 'offer') {
		}

		while ($xml->name === 'offer') {
			$node = new SimpleXMLElement($xml->readOuterXML());
			$names = [];
			$fields['offer_id'] = '';
			$fields['offer_available'] = '';

			foreach ($node as $elem) {
				$elemName = (string) $elem->getName();

				if ($elemName == 'url') {
					$elemName = '#url#';
				}

				if ($picsConcat && in_array($key, ['picture', 'image'])) {
					$key = $elemName;
				} else {
					if (array_key_exists($elemName, $names)) {
						$key = $elemName . count($names[$elemName]);
					} else {
						$key = $elemName;
					}
				}

				$names[$elemName][] = '';

				if ($elem->attributes()) {
					$attribs = [];

					foreach ($elem->attributes() as $nnn) {
						$attribs[] = $nnn;
					}

					$attribs = $elemName . '_' . implode(', ', $attribs);
					$fields[$attribs] = '';
				} else {
					$fields[$key] = '';
				}
			}

			$xml->next('offer');
		}

		return $fields;
	}

	private function convertYmlToCsv($xmlfile, $csvfile, $fields, $currency = [], $currencies = [], $picsConcat = true,  $codepage = null)
	{
		if (!is_string($xmlfile) || !is_string($csvfile) || !is_array($fields)) {
			error_log("required arguments missing!", 0);
			return false;
		}

		if (empty($currencies) || !isset($currencies[$currency['id']]) || !is_string($currency['id']) || !is_numeric($currency['rate'])) {
			unset($currency, $currencies);
		}

		$fields = array_filter($fields);
		$codepages = array('UTF-8', 'CP1251');

		if (is_string($codepage)) {
			$codepage = strtoupper($codepage);
		}

		if (isset($codepage) && in_array($codepage, $codepages)) {
			$convertFlag = true;
		}

		if (file_exists($csvfile)) {
			unlink($csvfile);
		}

		if (!$fcsv = fopen($csvfile, 'w')) {
			return false;
		}

		foreach ($fields as $k => $v) {
			$row_tpl[$k] = '';
		}

		fputcsv($fcsv, $fields, ";");

		$xml = new XMLReader;
		$xml->open($xmlfile);

		$ymlCategories = $this->getYmlCategories($xmlfile);

		while ($xml->read()) {
			if ($xml->name === 'offer') {
				break;
			}
		}

		while ($xml->name === 'offer') {
			$row = $row_tpl;

			$node = new SimpleXMLElement($xml->readOuterXML());

			$names = [];

			$row['offer_id'] = (string)$node->attributes()['id'];
			$av = (string)$node->attributes()['available'];

			if ($av == 'true') {
				$row['offer_available'] = 1;
			} else {
				$row['offer_available'] = 0;
			}

			foreach ($node as $elem) {
				$elemName = (string) $elem->getName();

				if ($elemName == 'url') {
					$elemName = '#url#';
				}

				if ($picsConcat == true && $elemName == 'picture') {
					$key = $elemName;
				} else {
					if (array_key_exists($elemName, $names)) {
						$key = $elemName . count($names[$elemName]);
					} else {
						$key = $elemName;
					}
				}

				$names[$elemName][] = '';

				if ($elem->attributes()) {
					$attribs = [];

					foreach ($elem->attributes() as $nnn) {
						$attribs[] = $nnn;
					}

					$attribs = $elemName . '_' . implode(', ', $attribs);

					if (isset($row[$attribs])) {
						$row[$attribs] = (string) $elem;
					}
				} else {
					if (isset($row[$key])) {
						if ($picsConcat == true && in_array($key, array('picture', 'image'))) {
							if (!is_array($row[$key])) {
								$row[$key] = [];
							}

							$row[$key][] = (string) $elem;
						} else {
							$row[$key] = (string) $elem;
						}
					}
				}
			}

			if ($picsConcat == true && is_array($row['picture'])) {
				$row['picture'] = implode(',', $row['picture']);
			}

			if (isset($currencies) && isset($row['currencyId'])) {
				if (is_numeric($currencies[$row['currencyId']]['rate'])) {
					if (isset($row['price'])) {
						$row['price'] = $row['price'] * $currencies[$row['currencyId']]['rate'] / $currency['rate'];
					}

					if (isset($row['oldprice'])) {
						$row['oldprice'] = floatval($row['oldprice']) * $currencies[$row['currencyId']]['rate'] / $currency['rate'];
					}

					if (isset($row['currencyId'])) {
						$row['currencyId'] = $currency['id'];
					}
				}
			}

			if (isset($row['categoryId'])) {
				$row['categoryId'] = $ymlCategories[$row['categoryId']]['path'];
			}

			fputcsv($fcsv, $row, ";");

			$xml->next('offer');
		}

		fclose($fcsv);

		if (file_exists($csvfile)) {
			return true;
		} else {
			return false;
		}
	}

	private function addMinimumParams($params1, $params2)
	{
		if (!is_array($params1) || !is_array($params2) || empty($params1) || empty($params2)) {
			return false;
		}

		foreach ($params2 as $param) {
			if (!in_array($param, $params1)) {
				$params1[] = $param;
			}
		}

		return $params1;
	}

	private function getYmlCurrencies($xmlfile)
	{
		$xml = new XMLReader;
		$xml->open($xmlfile);

		for (; $xml->read();) {
			if ($xml->name == 'currencies') {
				break;
			}
		}

		$node = new SimpleXMLElement($xml->readOuterXML());

		foreach ($node as $n) {
			$attrs = $n->attributes();
			$id = (string) $attrs['id'];
			$rate = (string) $attrs['rate'];
			$cats[$id] = ['id' => $id, 'rate' => $rate,];
		}

		return $cats;
	}

	function getYmlCategories($xmlfile)
	{
		$xml = new XMLReader();
		$xml->open($xmlfile);
		$cats = [];

		while ($xml->read() && $xml->name !== 'categories') {
			continue;
		}

		$node = new SimpleXMLElement($xml->readOuterXML());

		foreach ($node as $k => $n) {
			$id = (string) $n->attributes()['id'];
			$parent_id = (string) $n->attributes()['parentId'];
			$cats[$id]['id'] = $id;
			$cats[$id]['name'] = (string) $n;

			if (!empty($parent_id)) {
				$cats[$id]['parent_id'] = $parent_id;
			} else {
				$cats[$id]['parent_id'] = 0;
			}
		}

		$tree = ['subcategories' => []];
		$pointers = [&$tree];
		$tree['path'] = [];
		$tree['level'] = 0;
		$finish = false;

		while (!empty($cats) && !$finish) {
			$flag = false;

			foreach ($cats as $k => $category) {
				if (isset($pointers[$category['parent_id']])) {
					$pointers[$category['id']] = $pointers[$category['parent_id']]['subcategories'][] = $category;
					$curr[0] = $category['name'];
					$pointers[$category['id']]['path'] = implode('/', array_merge((array) $pointers[$category['parent_id']]['path'], $curr));
					$pointers[$category['id']]['level'] = 1 + $pointers[$category['parent_id']]['level'];
					unset($cats[$k]);
					$flag = true;
				}
			}

			if ($flag) {
				$finish = true;
			}
		}

		return $pointers;
	}
}
