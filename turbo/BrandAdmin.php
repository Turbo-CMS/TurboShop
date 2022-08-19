<?php

require_once('api/Turbo.php');

class BrandAdmin extends Turbo
{
	private $allowed_image_extentions = array('png', 'gif', 'jpg', 'jpeg', 'ico');

	function fetch()
	{
		$brand = new stdClass;
		if ($this->request->method('post')) {
			$brand->id = $this->request->post('id', 'integer');
			$brand->name = $this->request->post('name');
			$brand->name_h1 = $this->request->post('name_h1');
			$brand->description = $this->request->post('description');
			$brand->visible = $this->request->post('visible', 'boolean');

			$brand->url = trim($this->request->post('url', 'string'));
			$brand->meta_title = $this->request->post('meta_title');
			$brand->meta_keywords = $this->request->post('meta_keywords');
			$brand->meta_description = $this->request->post('meta_description');

			$brand->url = preg_replace("/[\s]+/ui", '', $brand->url);
			$brand->url = strtolower(preg_replace("/[^0-9a-z]+/ui", '', $brand->url));
			if (empty($brand->url)) {
				$brand->url = $this->translit($brand->name);
			}

			// Do not allow duplicate section URLs
			if (($c = $this->brands->get_brand($brand->url)) && $c->id != $brand->id) {
				$this->design->assign('message_error', 'url_exists');
			} elseif (empty($brand->name)) {
				$this->design->assign('message_error', 'empty_name');
			} else {
				if (empty($brand->id)) {
					$brand->id = $this->brands->add_brand($brand);
					$this->design->assign('message_success', 'added');
				} else {
					$this->brands->update_brand($brand->id, $brand);
					$this->design->assign('message_success', 'updated');
				}
				// Delete  image
				if ($this->request->post('delete_image')) {
					$this->brands->delete_image($brand->id);
				}
				// Image upload
				$image = $this->request->files('image');
				if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowed_image_extentions)) {
					$this->brands->delete_image($brand->id);
					move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->brands_images_dir . $image['name']);
					$this->brands->update_brand($brand->id, array('image' => $image['name']));
				}
				$brand = $this->brands->get_brand($brand->id);
			}
		} else {
			$brand->id = $this->request->get('id', 'integer');
			$brand = $this->brands->get_brand($brand->id);
		}

		$this->design->assign('brand', $brand);
		return  $this->design->fetch('brand.tpl');
	}

	private function translit($text)
	{
		$cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($cyr, $lat, $text);
		$res = preg_replace("/[\s]+/ui", '-', $res);
		$res = preg_replace('/[^\p{L}\p{Nd}\d-]/ui', '', $res);
		$res = strtolower($res);
		return $res;
	}
}
