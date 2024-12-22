<?php

require_once 'api/Import.php';

class ImportAdmin extends Import
{
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

		if ($this->request->method('post')) {
			if ($this->request->files("file") && $this->request->files("file")['error'] == UPLOAD_ERR_OK) {
				$uploadedName = $this->request->files("file", "tmp_name");
				$temp = tempnam($this->importFilesDir, 'temp_');

				if (!move_uploaded_file($uploadedName, $temp)) {
					$this->design->assign('message_error', 'upload_error');
				}

				if (!$this->convertFile($temp, $this->importFilesDir . $this->importFile)) {
					$this->design->assign('message_error', 'convert_error');
				} else {
					$this->initColumns();
					$lcColumns = array_map("mb_strtolower", $this->columns);
					$duplicatedColumns = array_diff_assoc($lcColumns, array_unique($lcColumns));
					$duplicatedColumns = array_unique($duplicatedColumns);
					$duplicatedColumnsPairs = array();
					foreach ($this->columnsNames as $columns) {
						$cnt = 0;
						foreach ($columns as $column) {
							if (in_array(mb_strtolower($column), $lcColumns) && ++$cnt > 1) {
								$duplicatedColumnsPairs[] = $columns;
							}
						}
					}
					if (!empty($duplicatedColumns)) {
						$this->design->assign('message_error', 'duplicated_columns');
						$this->design->assign('duplicated_columns', $duplicatedColumns);
					} elseif (!empty($duplicatedColumnsPairs)) {
						$this->design->assign('message_error', 'duplicated_columns_pairs');
						$this->design->assign('duplicated_columns_pairs', $duplicatedColumnsPairs);
					} else {
						$this->design->assign('filename', $this->request->files("file", "name"));
						$this->assignColumnsInfo();
					}
				}

				@unlink($temp);
			} elseif ($this->request->post('import')) {
				unset($_SESSION['csv_fields']);
				$fields = $this->request->post('csv_fields');

				if (empty($fields) || !in_array('sku', $fields) && !in_array('name', $fields)) {
					$this->design->assign('message_error', 'required_fields');
					$this->design->assign('filename', 1);
					$this->initColumns();
					$this->assignColumnsInfo($fields);
				} else {
					$_SESSION['csv_fields'] = $fields;
					$this->design->assign('import', 1);
				}
			}
		}

		$file = new stdClass();

		if (file_exists($this->importFilesDir . $this->importFile)) {
			$file->name = $this->importFile;
			$file->date = date("d.m.Y H:i:s", filemtime($this->importFilesDir . $this->importFile));
			$file->size = filesize($this->importFilesDir . $this->importFile);
		}

		$this->design->assign('file', $file);

		return $this->design->fetch('import.tpl');
	}

	private function convertFile($source, $dest)
	{
		$teststring = file_get_contents($source, false, null, 0, 1000000);

		if (preg_match('//u', $teststring)) {
			return copy($source, $dest);
		} else {
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

	private function assignColumnsInfo($fields = [])
	{
		$sourceColumns = $this->columns;
		$this->design->assign('columns_names', array_keys($this->columnsNames));

		$langId = $this->languages->langId();
		$px = ($langId ? 'l' : 'f');
		$langSql = $this->languages->getQuery(['object' => 'feature', 'px' => 'f']);

		$this->db->query("SELECT $px.name FROM __features f $langSql->join ORDER BY f.position");

		$features = $this->db->results('name');
		$this->design->assign('features', $features);

		$this->initInternalColumns();
		$internalColumns = array_keys($this->internalColumnsNames);

		if (empty($fields)) {
			$selected = [];

			foreach ($features as $f) {
				$selected[$f] = $f;
			}

			$selected = array_merge($selected, $this->internalColumnsNames);
		} else {
			$selected = $fields;
		}

		foreach ($sourceColumns as &$column) {
			$c = new stdClass();
			$c->name = $column;

			if (isset($selected[$c->name])) {
				$c->value = $selected[$c->name];
			} else {
				$c->value = null;
			}

			$c->is_feature = in_array($c->name, $features);
			$c->is_exist = in_array($c->name, $internalColumns) || $c->is_feature;
			$c->is_nf_selected = !$c->is_exist && $c->value == $c->name;
			$column = $c;
		}

		$this->design->assign('source_columns', $sourceColumns);
	}
}
