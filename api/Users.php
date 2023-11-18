<?php

require_once 'Turbo.php';

class Users extends Turbo
{
	private $salt = '8e86a279d6e182b3c811c559e6b15484';

	/**
	 * Get Users
	 */
	public function getUsers($filter = [])
	{
		$limit = 1000;
		$page = 1;

		$groupIdFilter = '';
		$keywordFilter = '';

		if (isset($filter['limit'])) {
			$limit = max(1, (int) $filter['limit']);
		}

		if (isset($filter['page'])) {
			$page = max(1, (int) $filter['page']);
		}

		if (isset($filter['group_id'])) {
			$groupIdFilter = $this->db->placehold('AND u.group_id IN(?@)', (array) $filter['group_id']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND (u.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR u.email LIKE "%' . $this->db->escape(trim($keyword)) . '%"  OR u.last_ip LIKE "%' . $this->db->escape(trim($keyword)) . '%")');
			}
		}

		$order = 'u.name';

		if (!empty($filter['sort'])) {
			switch ($filter['sort']) {
				case 'date':
					$order = 'u.created DESC';
					break;
				case 'name':
					$order = 'u.name';
					break;
				case 'email':
					$order = 'u.email';
					break;
			}
		}

		$sqlLimit = $this->db->placehold('LIMIT ?, ?', ($page - 1) * $limit, $limit);

		$query = $this->db->placehold(
			"SELECT 
				u.id, 
				u.email, 
				u.password, 
				u.name, 
				u.phone, 
				u.address, 
				u.group_id, 
				u.enabled, 
				u.last_ip,
				u.created, 
				g.discount, 
				g.name AS group_name 
			FROM __users u
			LEFT JOIN __groups g ON u.group_id=g.id 
			WHERE 1 
				$groupIdFilter 
				$keywordFilter 
			ORDER BY 
				$order 
				$sqlLimit"
		);

		$this->db->query($query);
		return $this->db->results();
	}

	/**
	 * Count Users
	 */
	public function countUsers($filter = [])
	{
		$groupIdFilter = '';
		$keywordFilter = '';

		if (isset($filter['group_id'])) {
			$groupIdFilter = $this->db->placehold('AND u.group_id IN(?@)', (array) $filter['group_id']);
		}

		if (isset($filter['keyword'])) {
			$keywords = explode(' ', $filter['keyword']);
			foreach ($keywords as $keyword) {
				$keywordFilter .= $this->db->placehold('AND u.name LIKE "%' . $this->db->escape(trim($keyword)) . '%" OR u.email LIKE "%' . $this->db->escape(trim($keyword)) . '%"');
			}
		}

		$query = $this->db->placehold(
			"SELECT COUNT(*) AS count 
			 FROM __users u
			 LEFT JOIN __groups g ON u.group_id = g.id 
			 WHERE 1 $groupIdFilter $keywordFilter"
		);

		$this->db->query($query);
		return $this->db->result('count');
	}

	/**
	 * Get User
	 */
	public function getUser($id)
	{
		if (is_string($id)) {
			$where = $this->db->placehold('WHERE u.email=?', $id);
		} else {
			$where = $this->db->placehold('WHERE u.id=?', (int) $id);
		}

		$query = $this->db->placehold(
			"SELECT
				u.id,
				u.email,
				u.password,
				u.name,
				u.phone,
				u.address,
				u.group_id,
				u.enabled,
				u.last_ip,
				u.created,
				g.discount,
				g.name AS group_name
			 FROM
				__users u
			 LEFT JOIN
				__groups g ON u.group_id=g.id
			 $where
			 LIMIT 1",
			$id
		);

		$this->db->query($query);
		$user = $this->db->result();

		if (empty($user)) {
			return false;
		}

		$user->discount *= 1;

		return $user;
	}

	/**
	 * Add User
	 */
	public function addUser($user)
	{
		$user = (array) $user;

		if (isset($user['password'])) {
			$user['password'] = md5($this->salt . $user['password'] . md5($user['password']));
		}

		$query = $this->db->placehold('SELECT COUNT(*) AS count FROM __users WHERE email=?', $user['email']);
		$this->db->query($query);

		if ($this->db->result('count') > 0) {
			return false;
		}

		$query = $this->db->placehold("INSERT INTO __users SET ?%", $user);
		$this->db->query($query);

		return $this->db->insertId();
	}

	/**
	 * Update User
	 */
	public function updateUser($id, $user)
	{
		$user = (array) $user;

		if (isset($user['password'])) {
			$user['password'] = md5($this->salt . $user['password'] . md5($user['password']));
		}

		$query = $this->db->placehold("UPDATE __users SET ?% WHERE id=? LIMIT 1", $user, (int) $id);
		$this->db->query($query);

		return $id;
	}

	/**
	 * Delete User
	 */
	public function deleteUser($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("UPDATE __orders SET user_id=NULL WHERE id=? LIMIT 1", (int) $id);
			$this->db->query($query);

			$query = $this->db->placehold("DELETE FROM __users WHERE id=? LIMIT 1", (int) $id);
			if ($this->db->query($query)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * Get Groups
	 */
	public function getGroups()
	{
		$query = $this->db->placehold("SELECT g.id, g.name, g.discount FROM __groups AS g ORDER BY g.discount");
		$this->db->query($query);

		return $this->db->results();
	}

	/**
	 * Get Group
	 */
	public function getGroup($id)
	{
		$query = $this->db->placehold("SELECT * FROM __groups WHERE id=? LIMIT 1", $id);
		$this->db->query($query);
		$group = $this->db->result();

		return $group;
	}

	/**
	 * Add Group
	 */
	public function addGroup($group)
	{
		$query = $this->db->placehold("INSERT INTO __groups SET ?%", $group);
		$this->db->query($query);

		return $this->db->insertId();
	}

	/**
	 * Update Group
	 */
	public function updateGroup($id, $group)
	{
		$query = $this->db->placehold("UPDATE __groups SET ?% WHERE id=? LIMIT 1", $group, (int) $id);
		$this->db->query($query);

		return $id;
	}

	/**
	 * Delete Group
	 */
	public function deleteGroup($id)
	{
		if (!empty($id)) {
			$query = $this->db->placehold("UPDATE __users SET group_id=NULL WHERE group_id=? LIMIT 1", (int) $id);
			$this->db->query($query);

			$query = $this->db->placehold("DELETE FROM __groups WHERE id=? LIMIT 1", (int) $id);

			if ($this->db->query($query)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * Check Password
	 */
	public function checkPassword($email, $password)
	{
		$encpassword = md5($this->salt . $password . md5($password));

		$query = $this->db->placehold("SELECT id FROM __users WHERE email=? AND password=? LIMIT 1", $email, $encpassword);
		$this->db->query($query);

		if ($id = $this->db->result('id')) {
			return $id;
		}

		return false;
	}
}
