<?php

require_once('api/Turbo.php');

############################################
# Class Product - edit the static section
############################################
class ProductAdmin extends Turbo
{
	public function fetch()
	{

		$options = array();
		$product_categories = array();
		$variants = array();
		$images = array();
		$product_features = array();
		$related_products = array();
		$product_videos = array();
		$files 	= array();

		if ($this->request->method('post') && !empty($_POST)) {
			$product = new stdClass;
			$product->id = $this->request->post('id', 'integer');
			$product->name = $this->request->post('name');
			$product->visible = $this->request->post('visible', 'boolean');
			$product->featured = $this->request->post('featured');
			$product->brand_id = $this->request->post('brand_id', 'integer');
			$product->is_new = $this->request->post('is_new', 'boolean');
			$product->is_hit = $this->request->post('is_hit', 'boolean');
			$product->to_export = $this->request->post('to_export', 'boolean');

			$product->url = trim($this->request->post('url', 'string'));
			$product->meta_title = $this->request->post('meta_title');
			$product->meta_keywords = $this->request->post('meta_keywords');
			$product->meta_description = $this->request->post('meta_description');

			$product->annotation = $this->request->post('annotation');
			$product->body = $this->request->post('body');

			$product->rating = $this->request->post('rating', 'float');
			$product->votes = $this->request->post('votes', 'integer');

			$product->sale_to = $this->request->post('sale_to');
			if (empty($product->sale_to)) {
				$product->sale_to = null;
			}

			// Product variants
			if ($this->request->post('variants')) {
				foreach ($this->request->post('variants') as $n => $va) {
					foreach ($va as $i => $v) {
						if (empty($variants[$i]))
							$variants[$i] = new stdClass;
						$variants[$i]->$n = $v;
					}
				}
			}	

			// Product categories
			$product_categories = $this->request->post('categories');
			if (is_array($product_categories)) {
				foreach ($product_categories as $c) {
					$x = new stdClass;
					$x->id = $c;
					$pc[] = $x;
				}
				$product_categories = $pc;
			}

			// Product options
			$options = $this->request->post('options');
			if (is_array($options)) {
				foreach ($options as $f_id => $val) {
					$po[$f_id] = new stdClass;
					$po[$f_id]->feature_id = $f_id;
					$po[$f_id]->value = $val;
				}
				$options = $po;
			}

			// Related products
			if (is_array($this->request->post('related_products'))) {
				foreach ($this->request->post('related_products') as $p) {
					$rp[$p] = new stdClass;
					$rp[$p]->product_id = $product->id;
					$rp[$p]->related_id = $p;
				}
				$related_products = $rp;
			}

			// Video
			if (is_array($this->request->post('videos'))) {
				foreach ($this->request->post('videos') as $k => $v)
					if (!empty($v)) {
						$product_videos[$k] = new stdClass;
						$product_videos[$k]->link = $v;
						$tmp = explode('/', $v);
						$tmp = $tmp[count($tmp) - 1];
						$tmp = stristr($tmp, 'v=');
						$b_p = strpos($tmp, '&');
						if ($b_p) {
							$tmp = substr($tmp, 0, $b_p);
						}
						$tmp = substr($tmp, 2);
						$product_videos[$k]->vid = $tmp;
					}
			}

			// Do not allow an empty product name
			if (empty($product->name)) {
				$this->design->assign('message_error', 'empty_name');
				if (!empty($product->id))
					$images = $this->products->get_images(array('product_id' => $product->id));
			}
			// Do not allow duplicate section URLs
			elseif (($p = $this->products->get_product($product->url)) && $p->id != $product->id) {
				$this->design->assign('message_error', 'url_exists');
				if (!empty($product->id))
					$images = $this->products->get_images(array('product_id' => $product->id));
			} else {
				if (empty($product->id)) {
					// Last-Modified
					if ($product->brand_id > 0) {
						$this->db->query('update __brands set last_modified=now() where id=?', $product->brand_id);
					}

					$product->id = $this->products->add_product($product);
					$product = $this->products->get_product($product->id);
					$this->design->assign('message_success', 'added');
				} else {
					// Last-Modified                    
					$this->db->query('select brand_id from __products where id=?', $product->id);
					$b_ids = $this->db->results('brand_id');
					if (!empty($b_ids)) {
						$this->db->query('update __brands set last_modified=now() where id in(?@)', $b_ids);
					}

					$this->products->update_product($product->id, $product);
					$product = $this->products->get_product($product->id);
					$this->design->assign('message_success', 'updated');
				}

				if ($product->id) {
					// Last-Modified
					$this->db->query('select category_id from __products_categories where product_id=?', $product->id);
					$c_ids = $this->db->results('category_id');
					if (!empty($c_ids)) {
						$this->db->query('update __categories set last_modified=now() where id in(?@)', $c_ids);
					}

					// Product categories
					$query = $this->db->placehold('DELETE FROM __products_categories WHERE product_id=?', $product->id);
					$this->db->query($query);
					if (is_array($product_categories)) {
						foreach ($product_categories as $i => $category)
							$this->categories->add_product_category($product->id, $category->id, $i);
					}

					// Variants
					if (is_array($variants)) {
						$variants_ids = array();
						foreach ($variants as $index => &$variant) {
							if ($variant->stock == '∞' || $variant->stock == '')
								$variant->stock = null;

							if (!empty($variant->id))
								$this->variants->update_variant($variant->id, $variant);
							else {
								$variant->product_id = $product->id;
								$variant->id = $this->variants->add_variant($variant);
							}
							$variant = $this->variants->get_variant($variant->id);
							if (!empty($variant->id))
								$variants_ids[] = $variant->id;
						}

						// Delete untransmitted variants
						$current_variants = $this->variants->get_variants(array('product_id' => $product->id));
						foreach ($current_variants as $current_variant)
							if (!in_array($current_variant->id, $variants_ids))
								$this->variants->delete_variant($current_variant->id);

						// if(!empty($))

						// Sort options
						asort($variants_ids);
						$i = 0;
						foreach ($variants_ids as $variant_id) {
							$this->variants->update_variant($variants_ids[$i], array('position' => $variant_id));
							$i++;
						}
					}

					// Delete images
					$images = (array)$this->request->post('images');
					$current_images = $this->products->get_images(array('product_id' => $product->id));
					foreach ($current_images as $image) {
						if (!in_array($image->id, $images))
							$this->products->delete_image($image->id);
					}

					// Image order
					if ($images = $this->request->post('images')) {
						$i = 0;
						foreach ($images as $id) {
							$this->products->update_image($id, array('position' => $i));
							$i++;
						}
					}
					
					// Image upload
					if ($images = $this->request->files('images')) {
						for ($i = 0; $i < count($images['name']); $i++) {
							if ($image_name = $this->image->upload_image($images['tmp_name'][$i], $images['name'][$i])) {
								$this->products->add_image($product->id, $image_name);
							} else {
								$this->design->assign('error', 'error uploading image');
							}
						}
					}
					
					// Image upload from the internet and drag-n-drop files
					if ($images = $this->request->post('images_urls')) {
						foreach ($images as $url) {
							// If not an empty address and the file is not local
							if (!empty($url) && $url != 'http://' && $url != 'https://' && strstr($url, '/') !== false)
								$this->products->add_image($product->id, $url);
							elseif ($dropped_images = $this->request->files('dropped_images')) {
								$key = array_search($url, $dropped_images['name']);
								if ($key !== false && $image_name = $this->image->upload_image($dropped_images['tmp_name'][$key], $dropped_images['name'][$key]))
									$this->products->add_image($product->id, $image_name);
							}
						}
					}
					$images = $this->products->get_images(array('product_id' => $product->id));

					// Delete files
					$files 	= (array)$this->request->post('files');
					$current_files = $this->files->get_files(array('object_id' => $product->id, 'type' => 'product'));
					foreach ($current_files as $file)
						if (!isset($file->id, $files['id']) || !is_array($files['id']) || !in_array($file->id, $files['id']))
							$this->files->delete_file($file->id);

					// File order
					if ($files = $this->request->post('files')) {
						$i = 0;
						foreach ($files['id'] as $k => $id) {
							$this->files->update_file($id, array('name' => $files['name'][$k], 'position' => $i));
							$i++;
						}
					}

					// File upload
					if ($files = $this->request->files('files')) {
						for ($i = 0; $i < count($files['name']); $i++) {
							if ($file_name = $this->files->upload_file($files['tmp_name'][$i], $files['name'][$i])) {
								$this->files->add_file($product->id, 'product', $file_name);
							} else {
								$this->design->assign('error', 'error uploading file');
							}
						}
					}

					$files = $this->files->get_files(array('object_id' => $product->id, 'type' => 'product'));

					// Product features

					// Remove everything from the product
					foreach ($this->features->get_product_options($product->id) as $po)
						$this->features->delete_option($product->id, $po->feature_id);

					// Properties of the current category
					$category_features = array();
					foreach ($this->features->get_features(array('category_id' => $product_categories[0])) as $f)
						$category_features[] = $f->id;

					if (is_array($options))
						foreach ($options as $option) {
							if (in_array($option->feature_id, $category_features))
								if (is_array($option->value)) {
									$pos = 0;
									foreach ($option->value as $value) {
										@$this->features->update_option($product->id, $option->feature_id, $value, $option->translit, $pos++);
									}
								} else {
									$this->features->update_option($product->id, $option->feature_id, $option->value, $option->translit);
								}
						}

					// New features
					$new_features_names = $this->request->post('new_features_names');
					$new_features_values = $this->request->post('new_features_values');
					if (is_array($new_features_names) && is_array($new_features_values)) {
						foreach ($new_features_names as $i => $name) {
							$value = trim($new_features_values[$i]);
							if (!empty($name) && !empty($value)) {
								$query = $this->db->placehold("SELECT * FROM __features WHERE name=? LIMIT 1", trim($name));
								$this->db->query($query);
								$feature_id = $this->db->result('id');
								if (empty($feature_id)) {
									$feature_id = $this->features->add_feature(array('name' => trim($name)));
								}
								$this->features->add_feature_category($feature_id, reset($product_categories)->id);
								$this->features->update_option($product->id, $feature_id, $value);
							}
						}
						// Product options
						$options = $this->features->get_product_options($product->id);
					}

					// Related products
					$query = $this->db->placehold('DELETE FROM __related_products WHERE product_id=?', $product->id);
					$this->db->query($query);
					if (is_array($related_products)) {
						$pos = 0;
						foreach ($related_products  as $i => $related_product)
							$this->products->add_related_product($product->id, $related_product->related_id, $pos++);
					}

					// Video
					$query = $this->db->placehold('DELETE FROM __products_videos WHERE product_id=?', $product->id);
					$this->db->query($query);
					if (is_array($product_videos)) {
						$pos = 0;
						foreach ($product_videos  as $i => $video)
							$this->products->add_product_video($product->id, $video->link, $pos++);
					}
				}
			}

			// header('Location: '.$this->request->url(array('message_success'=>'updated')));
		} else {
			$id = $this->request->get('id', 'integer');
			$product = $this->products->get_product(intval($id));

			if ($product) {

				// Product categories
				$product_categories = $this->categories->get_categories(array('product_id' => $product->id));

				// Product variants
				$variants = $this->variants->get_variants(array('product_id' => $product->id));

				// Product images
				$images = $this->products->get_images(array('product_id' => $product->id));

				// Product options
				$options = $this->features->get_options(array('product_id' => $product->id));

				// Related products
				$related_products = $this->products->get_related_products(array('product_id' => $product->id));

				// Video
				$product_videos = $this->products->get_videos(array('product_id' => $product->id));

				// Files
				$files = $this->files->get_files(array('object_id' => $product->id, 'type' => 'product'));
			} else {
				// Immediately active
				$product = new stdClass;
				$product->visible = 1;
			}
		}

		if (empty($variants))
			$variants = array(1);

		if (empty($product_categories)) {
			$product_categories[0] = new stdClass;
			if ($category_id = $this->request->get('category_id'))
				$product_categories[0]->id = $category_id;
			else
				$product_categories = array(1);
		}
		if (empty($product->brand_id) && $brand_id = $this->request->get('brand_id')) {
			$product->brand_id = $brand_id;
		}

		if (!empty($related_products)) {
			foreach ($related_products as &$r_p)
				$r_products[$r_p->related_id] = &$r_p;
			$temp_products = $this->products->get_products(array('id' => array_keys($r_products)));
			foreach ($temp_products as $temp_product)
				$r_products[$temp_product->id] = $temp_product;

			$related_products_images = $this->products->get_images(array('product_id' => array_keys($r_products)));
			foreach ($related_products_images as $image) {
				$r_products[$image->product_id]->images[] = $image;
			}
		}

		if (is_array($options)) {
			$temp_options = array();
			foreach ($options as $option) {
				if (empty($temp_options[$option->feature_id]))
					$temp_options[$option->feature_id] = new stdClass;
				$temp_options[$option->feature_id]->feature_id = $option->feature_id;
				if (is_array($option->value))
					$temp_options[$option->feature_id]->values = $option->value;
				else
					$temp_options[$option->feature_id]->values[] = $option->value;
			}

			$options = $temp_options;
		}

		$this->design->assign('product', $product);

		$this->design->assign('product_categories', $product_categories);
		$this->design->assign('product_variants', $variants);
		$this->design->assign('product_images', $images);
		$this->design->assign('options', $options);
		$this->design->assign('related_products', $related_products);
		$this->design->assign('product_videos', $product_videos);
		$this->design->assign('cms_files', $files);

		// All brands
		$brands = $this->brands->get_brands();
		$this->design->assign('brands', $brands);

		// All categories
		$categories = $this->categories->get_categories_tree();
		$this->design->assign('categories', $categories);

		// All product features
		$category = reset($product_categories);
		if (!is_object($category))
			$category = reset($categories);
		if (is_object($category)) {
			$features = $this->features->get_features(array('category_id' => $category->id));
			$this->design->assign('features', $features);
		}

		// All currencies
		$this->design->assign('currencies', $this->money->get_currencies(array('enabled' => 1)));

		return $this->design->fetch('product.tpl');
	}
}
