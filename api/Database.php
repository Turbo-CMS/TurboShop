<?php

require_once('Turbo.php');

class Database extends Turbo
{
	private $mysqli;
	private $res;

	/**
	 * In the constructor we connect the base
	 */
	public function __construct()
	{
		parent::__construct();
		$this->connect();
	}

	/**
	 * In the destructor, detach from the base
	 */
	public function __destruct()
	{
		$this->disconnect();
	}

	/**
	 * Database connection
	 */
	public function connect()
	{
		// When called again, return the existing link 
		if (!empty($this->mysqli))
			return $this->mysqli;
		// Otherwise, establish a connection
		else
			$this->mysqli = new mysqli($this->config->db_server, $this->config->db_user, $this->config->db_password, $this->config->db_name);

		// Display a message in case of an error
		if ($this->mysqli->connect_error) {
			trigger_error("Could not connect to the database: " . $this->mysqli->connect_error, E_USER_WARNING);
			return false;
		}
		// Or set up a connection
		else {
			if ($this->config->db_charset)
				$this->mysqli->query('SET NAMES ' . $this->config->db_charset);
			if ($this->config->db_sql_mode)
				$this->mysqli->query('SET SESSION SQL_MODE = "' . $this->config->db_sql_mode . '"');
			if ($this->config->db_timezone)
				$this->mysqli->query('SET time_zone = "' . $this->config->db_timezone . '"');
			if ($this->config->debug) {
				$this->mysqli->query('SET profiling = 1');
				$this->mysqli->query('SET profiling_history_size = 100');
			}
		}
		return $this->mysqli;
	}

	/**
	 * Closing the database connection
	 */
	public function disconnect()
	{
		if (!@$this->mysqli->close())
			return true;
		else
			return false;
	}

	/**
	 * Database request. The first argument is required - the text of the request.
	 * When specifying other arguments, placehold() is automatically executed for the request with the substitution of these arguments 
	 */
	public function query()
	{
		if (is_object($this->res))
			$this->res->free();

		$args = func_get_args();
		$q = call_user_func_array(array($this, 'placehold'), $args);
		return $this->res = $this->mysqli->query($q);
	}

	/**
	 *  Shielding
	 */
	public function escape($str)
	{
		return $this->mysqli->real_escape_string($str);
	}

	/**
	 * Placeholder for requests. Work example: $query = $db->placehold('SELECT name FROM products WHERE id=?', $id); 
	 */
	public function placehold()
	{
		$args = func_get_args();
		$tmpl = array_shift($args);
		// Replace all __ with a prefix, but only unquoted ones
		$tmpl = preg_replace('/([^"\'0-9a-z_])__([a-z_]+[^"\'])/i', "\$1" . $this->config->db_prefix . "\$2", $tmpl);
		if (!empty($args)) {
			$result = $this->sql_placeholder_ex($tmpl, $args, $error);
			if ($result === false) {
				$error = "Placeholder substitution error. Diagnostics: \"$error\"";
				trigger_error($error, E_USER_WARNING);
				return false;
			}
			return $result;
		} else
			return $tmpl;
	}

	/**
	 * Returns the results of a query. The optional second argument specifies which column to return instead of the entire array of columns
	 */
	public function results($field = null)
	{
		$results = array();
		if (!$this->res) {
			trigger_error($this->mysqli->error, E_USER_WARNING);
			return false;
		}

		if ($this->res->num_rows == 0)
			return array();

		while ($row = $this->res->fetch_object()) {
			if (!empty($field) && isset($row->$field))
				array_push($results, $row->$field);
			else
				array_push($results, $row);
		}
		return $results;
	}

	/**
	 * Returns the first result of the query. The optional second argument specifies which column to return instead of the entire array of columns 
	 */
	public function result($field = null)
	{
		$result = array();
		if (!$this->res) {
			$this->error_msg = "Could not execute query to database";
			return 0;
		}
		$row = $this->res->fetch_object();
		if (!empty($field) && isset($row->$field))
			return $row->$field;
		elseif (!empty($field) && !isset($row->$field))
			return false;
		else
			return $row;
	}

	/**
	 * Returns the last inserted id
	 */
	public function insert_id()
	{
		return $this->mysqli->insert_id;
	}

	/**
	 * Returns the number of selected rows
	 */
	public function num_rows()
	{
		return $this->res->num_rows;
	}

	/**
	 * Returns the number of affected rows
	 */
	public function affected_rows()
	{
		return $this->mysqli->affected_rows;
	}

	/**
	 * Returns information about MySQL
	 *
	 */
	public function get_mysql_info()
	{
		$info = array();
		$info['server_info'] = $this->mysqli->server_info;
		return $info;
	}

	/**
	 * Placeholder compilation
	 */
	private function sql_compile_placeholder($tmpl)
	{
		$compiled = array();
		$p = 0;	 // current position in the string 
		$i = 0;	 // placeholder counter
		$has_named = false;
		while (false !== ($start = $p = strpos($tmpl, "?", $p))) {
			// We define the type of placeholder 
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
			// Checking if this placeholder is named: "?keyname" 
			if (preg_match('/^((?:[^\s[:punct:]]|_)+)/', substr($tmpl, $p), $pock)) {
				$key = $pock[1];
				if ($type != '#')
					$has_named = true;
				$p += strlen($key);
			} else {
				$key = $i;
				if ($type != '#')
					$i++;
			}
			// Save a placeholder entry
			$compiled[] = array($key, $type, $start, $p - $start);
		}
		return array($compiled, $tmpl, $has_named);
	}

	/**
	 * Placeholder execution
	 */
	private function sql_placeholder_ex($tmpl, $args, &$errormsg)
	{
		// Has the request been parsed?.. If not, parse it
		if (is_array($tmpl))
			$compiled = $tmpl;
		else
			$compiled	 = $this->sql_compile_placeholder($tmpl);

		list($compiled, $tmpl, $has_named) = $compiled;

		// If there is at least one named placeholder, use first argument as an associative array
		if ($has_named)
			$args = @$args[0];

		// Perform all substitutions in a loop
		$p	 = 0;				// current position in line
		$out = '';			// resulting string 
		$error = false; // were there any mistakes? 

		foreach ($compiled as $num => $e) {
			list($key, $type, $start, $length) = $e;

			// Pre-string. 
			$out .= substr($tmpl, $p, $start - $p);
			$p = $start + $length;

			$repl = '';		// text to replace the current placeholder
			$errmsg = ''; // error message for this placeholder
			do {
				// Is it a placeholder constant?
				if ($type === '#') {
					$repl = @constant($key);
					if (NULL === $repl)
						$error = $errmsg = "UNKNOWN_CONSTANT_$key";
					break;
				}
				// Handling the error 
				if (!isset($args[$key])) {
					$error = $errmsg = "UNKNOWN_PLACEHOLDER_$key";
					break;
				}
				// We insert a value according to the placeholder type 
				$a = $args[$key];
				if ($type === '') {
					// Scalar placeholder
					if (is_array($a)) {
						$error = $errmsg = "NOT_A_SCALAR_PLACEHOLDER_$key";
						break;
					}
					$repl = is_int($a) || is_float($a) ? str_replace(',', '.', $a) : "'" . addslashes($a) . "'";
					break;
				}
				// Otherwise it is an array or a list
				if (is_object($a))
					$a = get_object_vars($a);

				if (!is_array($a)) {
					$error = $errmsg = "NOT_AN_ARRAY_PLACEHOLDER_$key";
					break;
				}
				if ($type === '@') {
					// This is a list 
					foreach ($a as $v) {
						if (is_null($v))
							$r = "NULL";
						else
							$r = "'" . @addslashes($v) . "'";

						$repl .= ($repl === '' ? "" : ",") . $r;
					}
				} elseif ($type === '%') {
					// This is a set of key=>value pairs
					$lerror = array();
					foreach ($a as $k => $v) {
						if (!is_string($k))
							$lerror[$k] = "NOT_A_STRING_KEY_{$k}_FOR_PLACEHOLDER_$key";
						else
							$k = preg_replace('/[^a-zA-Z0-9_]/', '_', $k);

						if (is_null($v))
							$r = "=NULL";
						else
							$r = "='" . @addslashes($v) . "'";

						$repl .= ($repl === '' ? "" : ", ") . $k . $r;
					}
					// If there was an error, compose a message
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
			if ($errmsg) $compiled[$num]['error'] = $errmsg;
			if (!$error) $out .= $repl;
		}
		$out .= substr($tmpl, $p);

		// If an error occurs, rewrite the resulting string
		// in the error message (arranging the diagnostic lines
		// instead of erroneous placeholders).  
		if ($error) {
			$out = '';
			$p	 = 0; // current position
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
			// The last part of the line
			$out .= substr($tmpl, $p);
			$errormsg = $out;
			return false;
		} else {
			$errormsg = false;
			return $out;
		}
	}

	public function dump($filename)
	{
		$h = fopen($filename, 'w');
		$q = $this->placehold("SHOW FULL TABLES LIKE '__%';");
		$result = $this->mysqli->query($q);
		while ($row = $result->fetch_row()) {
			if ($row[1] == 'BASE TABLE')
				$this->dump_table($row[0], $h);
		}
		fclose($h);
	}

	function restore($filename)
	{
		$templine = '';
		$h = fopen($filename, 'r');

		// Loop through each line
		if ($h) {
			while (!feof($h)) {
				$line = fgets($h);
				// Only continue if it's not a comment
				if (substr($line, 0, 2) != '--' && $line != '') {
					// Add this line to the current segment
					$templine .= $line;
					// If it has a semicolon at the end, it's the end of the query
					if (substr(trim($line), -1, 1) == ';') {
						// Perform the query
						$this->mysqli->query($templine) or print('Error performing query \'<b>' . $templine . '</b>\': ' . $this->mysqli->error . '<br/><br/>');
						// Reset temp variable to empty
						$templine = '';
					}
				}
			}
		}
		fclose($h);
	}

	public function dump_table($table, $h)
	{
		$sql = "SELECT * FROM `$table`;";
		$result = $this->mysqli->query($sql);
		if ($result) {
			fwrite($h, "/* Data for table $table */\n");
			fwrite($h, "TRUNCATE TABLE `$table`;\n");

			$num_rows = $result->num_rows;
			$num_fields = $this->mysqli->field_count;

			if ($num_rows > 0) {
				$field_type = array();
				$field_name = array();
				$meta = $result->fetch_fields();
				foreach ($meta as $m) {
					array_push($field_type, $m->type);
					array_push($field_name, $m->name);
				}
				$fields = implode('`, `', $field_name);
				fwrite($h,  "INSERT INTO `$table` (`$fields`) VALUES\n");
				$index = 0;
				while ($row = $result->fetch_row()) {
					fwrite($h, "(");
					for ($i = 0; $i < $num_fields; $i++) {
						if (is_null($row[$i]))
							fwrite($h, "null");
						else {
							switch ($field_type[$i]) {
								case 'int':
									fwrite($h,  $row[$i]);
									break;
								case 'string':
								case 'blob':
								default:
									fwrite($h, "'" . $this->mysqli->real_escape_string($row[$i]) . "'");
							}
						}
						if ($i < $num_fields - 1)
							fwrite($h,  ",");
					}
					fwrite($h, ")");

					if ($index < $num_rows - 1)
						fwrite($h,  ",");
					else
						fwrite($h, ";");
					fwrite($h, "\n");

					$index++;
				}
			}
			$result->free();
		}
		fwrite($h, "\n");
	}
}
