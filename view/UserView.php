<?php

require_once 'View.php';

class UserView extends View
{
	public function fetch()
	{
		if (empty($this->user)) {
			header('Location: ' . $this->config->root_url . '/' . $this->language->label . '/user/login');
			exit();
		}

		// Form
		if ($this->request->isMethod('post') && $this->request->post('name')) {
			$name = $this->request->post('name');
			$email = $this->request->post('email');
			$phone = $this->request->post('phone');
			$address = $this->request->post('address');
			$password = $this->request->post('password');

			$this->design->assign('name', $name);
			$this->design->assign('email', $email);
			$this->design->assign('phone', $phone);
			$this->design->assign('address', $address);

			$this->db->query("SELECT COUNT(*) AS count FROM __users WHERE email=? AND id!=?", $email, $this->user->id);

			$userExists = $this->db->result('count');

			if ($userExists) {
				$this->design->assign('error', 'user_exists');
			} elseif (empty($name)) {
				$this->design->assign('error', 'empty_name');
			} elseif (empty($email)) {
				$this->design->assign('error', 'empty_email');
			} elseif ($user_id = $this->users->updateUser($this->user->id, ['name' => $name, 'email' => $email, 'phone' => $phone, 'address' => $address])) {
				$this->design->assign('success', true);
				$this->user = $this->users->getUser((int) $user_id);
				$this->design->assign('name', $this->user->name);
				$this->design->assign('user', $this->user);
				$this->design->assign('email', $this->user->email);
				$this->design->assign('phone', $this->user->phone);
				$this->design->assign('address', $this->user->address);
			} else {
				$this->design->assign('error', 'unknown error');
			}

			if (!empty($password)) {
				$this->users->updateUser($this->user->id, ['password' => $password]);
			}
		} else {
			$this->design->assign('name', $this->user->name);
			$this->design->assign('email', $this->user->email);
			$this->design->assign('phone', $this->user->phone);
			$this->design->assign('address', $this->user->address);
		}

		$orders = [];

		// Orders
		foreach ($this->orders->getOrders(['user_id' => $this->user->id]) as $o) {
			$orders[$o->id] = $o;
			$orders[$o->id]->purchases = $this->orders->getPurchases(['order_id' => $o->id]);

			$productIds = [];

			foreach ($orders[$o->id]->purchases as $purchase) {
				$productIds[] = $purchase->product_id;
			}

			$products = [];

			foreach ($this->products->getProducts(['ids' => $productIds]) as $product) {
				$products[$product->id] = $product;
			}

			$images = $this->products->getImages(['productId' => $productIds]);

			foreach ($images as $image) {
				$products[$image->product_id]->images[] = $image;
			}

			foreach ($orders[$o->id]->purchases as $purchase) {
				if (!empty($products[$purchase->product_id])) {
					$purchase->product = $products[$purchase->product_id];
				}
			}
		}

		// Design
		$this->design->assign('orders', $orders);
		$this->design->assign('meta_title', $this->user->name);

		// Display
		$body = $this->design->fetch('user.tpl');

		return $body;
	}
}
