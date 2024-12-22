<?php

require_once 'Turbo.php';

class Database extends Turbo
{
	private $mysqli;
	private $res;

	/**
	 * Connects
	 */
	public function __construct()
	{
		parent::__construct();
		$this->connect();
	}

	/**
	 * Disconnects
	 */
	public function __destruct()
	{
		$this->disconnect();
	}

	/**
	 * Database Connection
	 */
	public function connect()
	{
		if (!empty($this->mysqli)) {
			return $this->mysqli;
		} else {
			$this->mysqli = new mysqli($this->config->db_server, $this->config->db_user, $this->config->db_password, $this->config->db_name);
		}

		if ($this->mysqli->connect_error) {
			throw new \Exception('Error: ' . $this->mysqli->error . '<br />Error No: ' . $this->mysqli->errno);
		} else {
			if ($this->config->db_charset) {
				$this->mysqli->query('SET NAMES ' . $this->config->db_charset);
			}

			if ($this->config->db_sql_mode) {
				$this->mysqli->query('SET SESSION SQL_MODE = "' . $this->config->db_sql_mode . '"');
			}

			if ($this->config->db_timezone) {
				$this->mysqli->query('SET time_zone = "' . $this->config->db_timezone . '"');
			}

			if ($this->config->debug) {
				$this->mysqli->query('SET profiling = 1');
				$this->mysqli->query('SET profiling_history_size = 100');
			}
		}

		return $this->mysqli;
	}

	/**
	 * Disconnect
	 */
	public function disconnect()
	{
		if (!@$this->mysqli->close()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Database Query
	 */
	public function query()
	{
		if (is_object($this->res)) {
			$this->res->free();
		}

		$args = func_get_args();
		$q = call_user_func_array(array($this, 'placehold'), $args);

		return $this->res = $this->mysqli->query($q);
	}

	/**
	 * Escapes
	 */
	public function escape($str)
	{
		return $this->mysqli->real_escape_string($str);
	}

	/**
	 * Placeholder
	 */
	public function placehold()
	{
		$args = func_get_args();
		$tmpl = array_shift($args);
		$tmpl = preg_replace('/([^"\'0-9a-z_])__([a-z_]+[^"\'])/i', "\$1" . $this->config->db_prefix . "\$2", $tmpl);
		$tmpl = preg_replace('/\s+/', ' ', $tmpl);
		if (!empty($args)) {
			$result = $this->sqlPlaceholderEx($tmpl, $args, $error);
			if ($result === false) {
				throw new \Exception('Placeholder substitution error. Diagnostics: ' . $error);
			}
			return $result;
		} else {
			return $tmpl;
		}
	}

	/**
	 * Results
	 */
	public function results($field = null)
	{
		$results = [];

		if (!$this->res) {
			throw new \Exception('Error: ' . $this->mysqli->error . '<br />Error No: ' . $this->mysqli->errno);
		}

		if ($this->res->num_rows == 0) {
			return [];
		}

		while ($row = $this->res->fetch_object()) {
			if (!empty($field) && isset($row->$field)) {
				array_push($results, $row->$field);
			} else {
				array_push($results, $row);
			}
		}
		return $results;
	}

	/**
	 * Result
	 */
	public function result($field = null)
	{
		if (!$this->res) {
			throw new \Exception('Could not execute query to database');
		}
		$row = $this->res->fetch_object();
		if (!empty($field) && isset($row->$field)) {
			return $row->$field;
		} elseif (!empty($field) && !isset($row->$field)) {
			return false;
		} else {
			return $row;
		}
	}

	/**
	 * Inserted ID
	 */
	public function insertId()
	{
		return $this->mysqli->insert_id;
	}

	/**
	 * Num Rows
	 */
	public function numRows()
	{
		return $this->res->num_rows;
	}

	/**
	 * Affected Rows
	 */
	public function affectedRows()
	{
		return $this->mysqli->affected_rows;
	}

	/**
	 * Get Mysql Info
	 */
	public function getMysqlInfo()
	{
		if (!$this->mysqli) {
			return [];
		}

		$info = [];
		$info['server_info'] = $this->mysqli->server_info;

		return $info;
	}

	/**
	 * Sql Compile Placeholder
	 */
	private function sqlCompilePlaceholder($tmpl)
	{
		$compiled = [];
		$p = 0;
		$i = 0;
		$has_named = false;

		while (false !== ($start = $p = strpos($tmpl, "?", $p))) {
			switch ($c = substr($tmpl, ++$p, 1)) {
				case '%':
				case '@':
				case '#':
					$type = $c;
					++$p;
					break;
				default:
					$type = '';
					break;
			}

			if (preg_match('/^((?:[^\s[:punct:]]|_)+)/', substr($tmpl, $p), $pock)) {
				$key = $pock[1];
				if ($type != '#') {
					$has_named = true;
				}
				$p += strlen($key);
			} else {
				$key = $i;
				if ($type != '#') {
					$i++;
				}
			}

			$compiled[] = array($key, $type, $start, $p - $start);
		}

		return array($compiled, $tmpl, $has_named);
	}

	/**
	 * Sql Placeholder Ex
	 */
	private function sqlPlaceholderEx($tmpl, $args, &$errormsg)
	{
		if (is_array($tmpl)) {
			$compiled = $tmpl;
		} else {
			$compiled = $this->sqlCompilePlaceholder($tmpl);
		}

		list($compiled, $tmpl, $has_named) = $compiled;

		if ($has_named) {
			$args = @$args[0];
		}

		$p = 0;
		$out = '';
		$error = false;

		foreach ($compiled as $num => $e) {
			list($key, $type, $start, $length) = $e;

			$out .= substr($tmpl, $p, $start - $p);
			$p = $start + $length;

			$repl = '';
			$errmsg = '';

			do {
				if ($type === '#') {
					$repl = @constant($key);
					if (null === $repl) {
						$error = $errmsg = "UNKNOWN_CONSTANT_$key";
					}
					break;
				}

				if (!isset($args[$key])) {
					$error = $errmsg = "UNKNOWN_PLACEHOLDER_$key";
					break;
				}

				$a = $args[$key];

				if ($type === '') {
					if (is_array($a)) {
						$error = $errmsg = "NOT_A_SCALAR_PLACEHOLDER_$key";
						break;
					}

					$repl = is_int($a) || is_float($a) ? str_replace(',', '.', $a) : "'" . addslashes($a) . "'";

					break;
				}

				if (is_object($a)) {
					$a = get_object_vars($a);
				}

				if (!is_array($a)) {
					$error = $errmsg = "NOT_AN_ARRAY_PLACEHOLDER_$key";
					break;
				}

				if ($type === '@') {
					foreach ($a as $v) {
						if (is_null($v)) {
							$r = "NULL";
						} else {
							$r = "'" . @addslashes($v) . "'";
						}

						$repl .= ($repl === '' ? "" : ",") . $r;
					}
				} elseif ($type === '%') {
					$lerror = [];

					foreach ($a as $k => $v) {
						if (!is_string($k)) {
							$lerror[$k] = "NOT_A_STRING_KEY_{$k}_FOR_PLACEHOLDER_$key";
						} else {
							$k = preg_replace('/[^a-zA-Z0-9_]/', '_', $k);
						}

						if (is_null($v)) {
							$r = "=NULL";
						} else {
							$r = "='" . @addslashes($v) . "'";
						}

						$repl .= ($repl === '' ? "" : ", ") . $k . $r;
					}

					if (count($lerror)) {
						$repl = '';

						foreach ($a as $k => $v) {
							if (isset($lerror[$k])) {
								$repl .= ($repl === '' ? "" : ", ") . $lerror[$k];
							} else {
								$k = preg_replace('/[^a-zA-Z0-9_-]/', '_', $k);
								$repl .= ($repl === '' ? "" : ", ") . $k . "=?";
							}
						}

						$error = $errmsg = $repl;
					}
				}
			} while (false);

			if ($errmsg) {
				$compiled[$num]['error'] = $errmsg;
			}

			if (!$error) {
				$out .= $repl;
			}
		}

		$out .= substr($tmpl, $p);

		if ($error) {
			$out = '';
			$p = 0;

			foreach ($compiled as $num => $e) {
				list($key, $type, $start, $length) = $e;
				$out .= substr($tmpl, $p, $start - $p);
				$p = $start + $length;

				if (isset($e['error'])) {
					$out .= $e['error'];
				} else {
					$out .= substr($tmpl, $start, $length);
				}
			}

			$out .= substr($tmpl, $p);
			$errormsg = $out;

			return false;
		} else {
			$errormsg = false;

			return $out;
		}
	}

	/**
	 * Dump
	 */
	public function dump($filename)
	{
		$h = fopen($filename, 'w');
		$q = $this->placehold("SHOW FULL TABLES LIKE '__%';");
		$result = $this->mysqli->query($q);

		while ($row = $result->fetch_row()) {
			if ($row[1] == 'BASE TABLE') {
				$this->dumpTable($row[0], $h);
			}
		}

		fclose($h);
	}

	/**
	 * Restore
	 */
	public function restore($filename)
	{
		$templine = '';
		$h = fopen($filename, 'r');

		if ($h) {
			while (!feof($h)) {
				$line = fgets($h);

				if (substr($line, 0, 2) != '--' && $line != '') {
					$templine .= $line;

					if (substr(trim($line), -1, 1) == ';') {
						$this->query($templine) or print('Error performing query \'<b>' . $templine . '</b>\': ' . $this->mysqli->error . '<br/><br/>');
						$templine = '';
					}
				}
			}
		}

		fclose($h);
	}

	/**
	 * Dump Table
	 */
	public function dumpTable($table, $h)
	{
		$sql = "SELECT * FROM `$table`;";
		$result = $this->mysqli->query($sql);

		if ($result) {
			$tableNoPrefix = preg_replace('/^(' . $this->config->db_prefix . ')/i', "__", $table);
			fwrite($h, "/* Data for table $tableNoPrefix */\n");
			fwrite($h, "TRUNCATE TABLE `$tableNoPrefix`;\n");

			$numRows = $result->num_rows;
			$numFields = $this->mysqli->field_count;

			if ($numRows > 0) {
				$fieldType = [];
				$fieldName = [];
				$meta = $result->fetch_fields();

				foreach ($meta as $m) {
					array_push($fieldType, $m->type);
					array_push($fieldName, $m->name);
				}

				$fields = implode('`, `', $fieldName);
				fwrite($h, "INSERT INTO `$tableNoPrefix` (`$fields`) VALUES\n");
				$index = 0;

				while ($row = $result->fetch_row()) {
					fwrite($h, "(");

					for ($i = 0; $i < $numFields; $i++) {
						if (is_null($row[$i])) {
							fwrite($h, "null");
						} else {
							switch ($fieldType[$i]) {
								case 'int':
									fwrite($h, $row[$i]);
									break;
								case 'string':
								case 'blob':
								default:
									fwrite($h, "'" . $this->mysqli->real_escape_string($row[$i]) . "'");
							}
						}

						if ($i < $numFields - 1) {
							fwrite($h, ",");
						}
					}

					fwrite($h, ")");

					if ($index < $numRows - 1) {
						fwrite($h, ",");
					} else {
						fwrite($h, ";");
					}

					fwrite($h, "\n");

					$index++;
				}
			}

			$result->free();
		}

		fwrite($h, "\n");
	}
}
