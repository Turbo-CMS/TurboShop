<?php

/**
 * Turbo CMS
 *
 * @author	Turbo CMS
 * @link	https://turbo-cms.com
 *
 */

require_once('Turbo.php');

class Files extends Turbo
{
	private	$allowed_extentions = array('pdf', 'txt', 'doc', 'docx', 'xls', 'xlsx');

	public function __construct()
	{
		parent::__construct();
	}

	function get_files($filter = array())
	{
		$object_id_filter = '';
		$type_filter = '';

		if (!empty($filter['object_id']))
			$object_id_filter = $this->db->placehold('AND f.object_id in(?@)', (array)$filter['object_id']);

		if (!empty($filter['type']))
			$type_filter = $this->db->placehold('AND f.type=?', $filter['type']);

		$lang_sql = $this->languages->get_query(array('object' => 'file'));

		$query = $this->db->placehold("SELECT f.id, f.name, f.object_id, f.filename, f.type, f.position, $lang_sql->fields
									FROM __files AS f $lang_sql->join WHERE 1 $object_id_filter $type_filter ORDER BY f.object_id, f.position");
		$this->db->query($query);
		return $this->db->results();
	}

	public function add_file($object_id, $type, $filename, $name = '')
	{
		$query = $this->db->placehold("SELECT id FROM __files WHERE object_id=? AND type=? AND filename=?", $object_id, $type, $filename);
		$this->db->query($query);
		$id = $this->db->result('id');
		if (empty($id)) {
			$query = $this->db->placehold("INSERT INTO __files SET object_id=?, type=?, filename=?", $object_id, $type, $filename);
			$this->db->query($query);
			$id = $this->db->insert_id();
			$query = $this->db->placehold("UPDATE __files SET position=id WHERE id=?", $id);
			$this->db->query($query);
		}
		return ($id);
	}

	public function update_file($id, $file)
	{
		$file = (object)$file;
		$result = $this->languages->get_description($file, 'file');
		$query = $this->db->placehold("UPDATE __files SET ?% WHERE id=?", $file, $id);
		$this->db->query($query);
		// If there is a description to translate. Specify the language to update
		if (!empty($result->description)) {
			$this->languages->action_description($id, $result->description, 'file', $this->languages->lang_id());
		}
		return ($id);
	}

	public function delete_file($id)
	{
		$query = $this->db->placehold("SELECT filename FROM __files WHERE id=?", $id);
		$this->db->query($query);
		$filename = $this->db->result('filename');
		$query = $this->db->placehold("DELETE FROM __files WHERE id=? LIMIT 1", $id);
		$this->db->query($query);
		$query = $this->db->placehold("SELECT count(*) as count FROM __files WHERE filename=? LIMIT 1", $filename);
		$this->db->query($query);
		$count = $this->db->result('count');
		$this->db->query($query);
		$this->db->query("DELETE FROM __lang_files WHERE file_id=?", intval($id));
		if ($count == 0) {
			$file = pathinfo($filename, PATHINFO_FILENAME);
			$ext = pathinfo($filename, PATHINFO_EXTENSION);

			@unlink($this->config->root_dir . $this->config->cms_files_dir . $filename);
		}
	}

	public function upload_file($filename, $name)
	{
		// Original file name
		$name = $this->correct_filename($name);
		$uploaded_file = $new_name = pathinfo($name, PATHINFO_BASENAME);
		$base = pathinfo($uploaded_file, PATHINFO_FILENAME);
		$ext = pathinfo($uploaded_file, PATHINFO_EXTENSION);

		if (in_array(strtolower($ext), $this->allowed_extentions)) {
			while (file_exists($this->config->root_dir . $this->config->cms_files_dir . $new_name)) {
				$new_base = pathinfo($new_name, PATHINFO_FILENAME);
				if (preg_match('/_([0-9]+)$/', $new_base, $parts))
					$new_name = $base . '_' . ($parts[1] + 1) . '.' . $ext;
				else
					$new_name = $base . '_1.' . $ext;
			}
			if (move_uploaded_file($filename, $this->config->root_dir . $this->config->cms_files_dir . $new_name))
				return $new_name;
		}

		return false;
	}

	public function correct_filename($filename)
	{
		$cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($cyr, $lat, $filename);
		$res = preg_replace("/[\s]+/ui", '-', $res);
		$res = preg_replace("/[^a-zA-Z0-9\.\-\_]+/ui", '', $res);
		$res = strtolower($res);
		return $res;
	}
}
