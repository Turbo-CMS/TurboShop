<?php

require_once 'Turbo.php';

class Files extends Turbo
{

    private $allowedExtensions = ['pdf', 'txt', 'doc', 'docx', 'xls', 'xlsx'];

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Get Files
     */
    public function getFiles($filter = [])
    {
        $objectIdFilter = '';
        $typeFilter = '';

        if (!empty($filter['object_id'])) {
            $objectIdFilter = $this->db->placehold('AND f.object_id IN(?@)', (array) $filter['object_id']);
        }

        if (!empty($filter['type'])) {
            $typeFilter = $this->db->placehold('AND f.type=?', $filter['type']);
        }

        $langSql = $this->languages->getQuery(['object' => 'file']);

        $query = $this->db->placehold(
            "SELECT 
                f.id, 
                f.name, 
                f.object_id, 
                f.filename, 
                f.type, 
                f.position, 
                $langSql->fields
             FROM __files f 
                $langSql->join 
             WHERE 1 
                $objectIdFilter 
                $typeFilter 
             ORDER BY 
                f.object_id, 
                f.position"
        );

        $this->db->query($query);
        return $this->db->results();
    }

    /**
     * Add File
     */
    public function addFile($objectId, $type, $filename)
    {
        $query = $this->db->placehold("SELECT id FROM __files WHERE object_id=? AND type=? AND filename=?", $objectId, $type, $filename);
        $this->db->query($query);

        $id = $this->db->result('id');

        if (empty($id)) {
            $query = $this->db->placehold("INSERT INTO __files SET object_id=?, type=?, filename=?", $objectId, $type, $filename);
            $this->db->query($query);

            $id = $this->db->insertId();

            $query = $this->db->placehold("UPDATE __files SET position=id WHERE id=?", $id);
            $this->db->query($query);
        }

        return ($id);
    }

    /**
     * Copy File
     */
    public function copyFile($file)
    {
        $file = (object) $file;

        $result = $this->languages->getDescription($file, 'file');

        if (!empty($result->data)) {
            $file = $result->data;
        }

        $query = $this->db->placehold("INSERT INTO __files SET ?%", $file);
        $this->db->query($query);

        $id = $this->db->insertId();

        $query = $this->db->placehold("UPDATE __files SET position=id WHERE id=?", $id);
        $this->db->query($query);

        if (!empty($result->description)) {
            $this->languages->actionDescription($id, $result->description, 'file');
        }

        return $id;
    }


    /**
     * Update File
     */
    public function updateFile($id, $file)
    {
        $file = (object) $file;

        $result = $this->languages->getDescription($file, 'file');

        if (!empty($result->data)) {
            $file = $result->data;
        }

        $updatedFile = (array) $file;

        if (!empty($updatedFile)) {
            $query = $this->db->placehold("UPDATE __files SET ?% WHERE id=? LIMIT 1", $file, (int) $id);
            $this->db->query($query);
        }

        if (!empty($result->description)) {
            $this->languages->actionDescription($id, $result->description, 'file', $this->languages->langId());
        }

        return $id;
    }

    /**
     * Delete File
     */
    public function deleteFile($id)
    {
        $query = $this->db->placehold("SELECT filename FROM __files WHERE id=?", $id);
        $this->db->query($query);

        $filename = $this->db->result('filename');

        $query = $this->db->placehold("DELETE FROM __files WHERE id=? LIMIT 1", $id);
        $this->db->query($query);

        $query = $this->db->placehold("SELECT count(*) AS count FROM __files WHERE filename=? LIMIT 1", $filename);
        $this->db->query($query);

        $count = $this->db->result('count');

        $this->db->query("DELETE FROM __lang_files WHERE file_id=?", (int) $id);

        if ($count == 0) {
            @unlink($this->config->root_dir . $this->config->cms_files_dir . $filename);
        }
    }

    /**
     * Upload File
     */
    public function uploadFile($filename, $name)
    {
        $name = $this->correctFilename($name);
        $uploadedFile = $newName = pathinfo($name, PATHINFO_BASENAME);
        $base = pathinfo($uploadedFile, PATHINFO_FILENAME);
        $ext = pathinfo($uploadedFile, PATHINFO_EXTENSION);

        if (in_array(strtolower($ext), $this->allowedExtensions)) {
            while (file_exists($this->config->root_dir . $this->config->cms_files_dir . $newName)) {
                $newBase = pathinfo($newName, PATHINFO_FILENAME);

                if (preg_match('/_([0-9]+)$/', $newBase, $parts)) {
                    $newName = $base . '_' . ($parts[1] + 1) . '.' . $ext;
                } else {
                    $newName = $base . '_1.' . $ext;
                }
            }

            if (move_uploaded_file($filename, $this->config->root_dir . $this->config->cms_files_dir . $newName)) {
                return $newName;
            }
        }

        return false;
    }

    /**
     * Correct Filename
     */
    public function correctFilename($filename)
    {
        $cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
        $lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

        $res = str_replace($cyr, $lat, $filename);
        $res = preg_replace("/[\s]+/ui", '-', $res);
        $res = preg_replace("/[^a-zA-Z0-9\.\-\_]+/ui", '', $res);
        $res = strtolower($res);

        return $res;
    }
}
