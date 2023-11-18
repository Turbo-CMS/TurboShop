<?php

require_once 'Turbo.php';

class Callbacks extends Turbo
{
    /**
     * Get Callback
     */
    public function getCallback($id)
    {
        $query = $this->db->placehold(
            "SELECT 
                c.id, 
                c.name, 
                c.phone, 
                c.processed, 
                c.message, 
                c.date 
            FROM 
                __callbacks c 
            WHERE 
                id=? 
            LIMIT 1",
            (int) $id
        );

        if ($this->db->query($query)) {
            return $this->db->result();
        } else {
            return false;
        }
    }

    /**
     * Get Callback
     */
    public function getCallbacks($filter = [], $newOnTop = false)
    {
        $limit = 0;
        $page = 1;
        $processed = '';

        if (isset($filter['limit'])) {
            $limit = max(1, (int) $filter['limit']);
        }

        if (isset($filter['page'])) {
            $page = max(1, (int) $filter['page']);
        }

        if (isset($filter['processed'])) {
            $processed = $this->db->placehold('AND processed=?', $filter['processed']);
        }

        $sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

        if ($newOnTop) {
            $sort = 'DESC';
        } else {
            $sort = 'ASC';
        }

        $query = $this->db->placehold(
            "SELECT 
                c.id, 
                c.name, 
                c.phone, 
                c.date, 
                c.processed, 
                c.message
            FROM 
                __callbacks c 
            WHERE 
                1 $processed 
            ORDER BY 
                c.id $sort 
            $sqlLimit"
        );

        $this->db->query($query);
        return $this->db->results();
    }

    /**
     * Count Callbacks
     */
    public function countCallbacks($filter = [])
    {
        $keywordFilter = '';
        $processedFilter = '';

        if (!empty($filter['keyword'])) {
            $keywords = explode(' ', $filter['keyword']);
            foreach ($keywords as $keyword) {
                $keywordFilter .= $this->db->placehold('OR c.email LIKE "%' . $this->db->escape(trim($keyword)) . '%" ');
            }
        }

        if (isset($filter['processed'])) {
            $processedFilter = $this->db->placehold('AND c.processed=?', (int) $filter['processed']);
        }

        $query = $this->db->placehold(
            "SELECT COUNT(DISTINCT c.id) AS count
            FROM __callbacks c 
            WHERE 1 $processedFilter $keywordFilter"
        );

        $this->db->query($query);
        return $this->db->result('count');
    }

    /**
     * Add Callback
     */
    public function addCallback($callback)
    {
        $query = $this->db->placehold("INSERT INTO __callbacks SET ?%, date = NOW()", $callback);

        if (!$this->db->query($query)) {
            return false;
        }

        $id = $this->db->insertId();
        return $id;
    }

    /**
     * Update Callback
     */
    public function updateCallback($id, $callback)
    {
        $dateQuery = '';

        if (isset($callback->date)) {
            $date = $callback->date;
            unset($callback->date);
            $dateQuery = $this->db->placehold(', date=STR_TO_DATE(?, ?)', $date, $this->settings->date_format);
        }

        $query = $this->db->placehold("UPDATE __callbacks SET ?% $dateQuery WHERE id IN(?@) LIMIT 1", $callback, (array) $id);
        $this->db->query($query);

        return $id;
    }

    /**
     * Delete Callback
     */
    public function deleteCallback($id)
    {
        if (!empty($id)) {
            $query = $this->db->placehold("DELETE FROM __callbacks WHERE id=? LIMIT 1", (int) $id);
            $this->db->query($query);
        }
    }
}
