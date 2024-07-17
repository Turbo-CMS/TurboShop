<?php

require_once 'api/Turbo.php';

class BannersImageAdmin extends Turbo
{
	private $allowedImageExtensions = ['png', 'gif', 'jpg', 'jpeg', 'ico', 'svg'];

	public function fetch()
	{
		$bannersImage = new stdClass();

		if ($this->request->isMethod('post')) {
			$bannersImage->id = $this->request->post('id', 'integer');
			$bannersImage->name = $this->request->post('name');
			$bannersImage->visible = $this->request->post('visible', 'boolean');
			$bannersImage->banner_id = $this->request->post('banner_id', 'integer');
			$bannersImage->url = $this->request->post('url');
			$bannersImage->button = $this->request->post('button');
			$bannersImage->color = $this->request->post('color');
			$bannersImage->style = $this->request->post('style');
			$bannersImage->code = $this->request->post('code');
			$bannersImage->title = $this->request->post('title');
			$bannersImage->alt = $this->request->post('alt');
			$bannersImage->description = $this->request->post('description');

			if (empty($bannersImage->id)) {
				$bannersImage->id = $this->banners->addBannersImage($bannersImage);
				$this->design->assign('message_success', 'added');
			} else {
				$this->banners->updateBannersImage($bannersImage->id, $bannersImage);
				$this->design->assign('message_success', 'updated');
			}

			if ($this->request->post('delete_image')) {
				$this->banners->deleteImage($bannersImage->id);
			}

			if ($this->request->post('delete_background')) {
				$this->banners->deleteBackground($bannersImage->id);
			}

			$image = $this->request->files('image');

			if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowedImageExtensions)) {
				$this->banners->deleteImage($bannersImage->id);
				move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->banners_images_dir . $image['name']);
				$this->banners->updateBannersImage($bannersImage->id, ['image' => $image['name']]);
			}

			$background = $this->request->files('background');

			if (!empty($background['name']) && in_array(strtolower(pathinfo($background['name'], PATHINFO_EXTENSION)), $this->allowedImageExtensions)) {
				$this->banners->deleteBackground($bannersImage->id);
				move_uploaded_file($background['tmp_name'], $this->root_dir . $this->config->banners_images_dir . $background['name']);
				$this->banners->updateBannersImage($bannersImage->id, ['background' => $background['name']]);
			}

			$bannersImage = $this->banners->getBannersImage((int) $bannersImage->id);
		} else {
			$bannersImage->id = $this->request->get('id', 'integer');
			$bannersImage = $this->banners->getBannersImage((int) $bannersImage->id);
		}

		$banners = $this->banners->getBanners();

		$this->design->assign('banners_image', $bannersImage);
		$this->design->assign('banners', $banners);

		return $this->design->fetch('banners_image.tpl');
	}
}
