<?php

require_once 'api/Turbo.php';

class ProductAdmin extends Turbo
{
	public function fetch()
	{
		$options = [];
		$productCategories = [];
		$variants = [];
		$images = [];
		$relatedProducts = [];
		$recommendedProducts = [];
		$productVideos = [];
		$files = [];

		if ($this->request->isMethod('post') && !empty($_POST)) {
			$product = new stdClass();

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

			if ($this->request->post('variants')) {
				foreach ($this->request->post('variants') as $n => $va) {
					foreach ($va as $i => $v) {
						if (empty($variants[$i])) {
							$variants[$i] = new stdClass();
						}

						$variants[$i]->$n = $v;
					}
				}
			}

			$productCategories = $this->request->post('categories');

			if (is_array($productCategories)) {
				$pc = [];

				foreach ($productCategories as $c) {
					$x = new stdClass();
					$x->id = $c;
					$pc[] = $x;
				}

				$productCategories = $pc;
			}

			$relatedProducts = [];

			if (is_array($this->request->post('related_products'))) {
				foreach ($this->request->post('related_products') as $p) {
					$rp[$p] = new stdClass();
					$rp[$p]->product_id = $product->id;
					$rp[$p]->related_id = $p;
				}

				$relatedProducts = $rp;
			}

			$recommendedProducts = [];

			if (is_array($this->request->post('recommended_products'))) {
				foreach ($this->request->post('recommended_products') as $r) {
					$re[$r] = new stdClass();
					$re[$r]->product_id = $product->id;
					$re[$r]->recommended_id = $r;
				}

				$recommendedProducts = $re;
			}

			if (is_array($this->request->post('videos'))) {
				$productVideos = [];

				foreach ($this->request->post('videos') as $k => $v) {
					if (!empty($v)) {
						$productVideos[$k] = new stdClass();
						$productVideos[$k]->link = $v;
						$tmp = explode('/', $v);
						$tmp = $tmp[count($tmp) - 1];
						$tmp = stristr($tmp, 'v=');
						$bP = strpos($tmp, '&');

						if ($bP) {
							$tmp = substr($tmp, 0, $bP);
						}

						$tmp = substr($tmp, 2);
						$productVideos[$k]->vid = $tmp;
					}
				}
			}

			if (empty($product->name)) {
				$this->design->assign('message_error', 'empty_name');

				if (!empty($product->id)) {
					$images = $this->products->getImages(['product_id' => $product->id]);
				}
			} elseif (($p = $this->products->getProduct($product->url)) && $p->id != $product->id) {
				$this->design->assign('message_error', 'url_exists');

				if (!empty($product->id)) {
					$images = $this->products->getImages(array('product_id' => $product->id));
				}
			} else {
				if (empty($product->id)) {
					if ($product->brand_id > 0) {
						$this->db->query("UPDATE __brands SET last_modified=NOW() WHERE id=?", $product->brand_id);
					}

					$product->id = $this->products->addProduct($product);
					$product = $this->products->getProduct($product->id);

					$this->design->assign('message_success', 'added');
				} else {
					$this->db->query("SELECT brand_id FROM __products WHERE id=?", $product->id);

					$bIds = $this->db->results('brand_id');

					if (!empty($bIds)) {
						$this->db->query("UPDATE __brands SET last_modified=NOW() WHERE id IN(?@)", $bIds);
					}

					$this->products->updateProduct($product->id, $product);
					$product = $this->products->getProduct($product->id);
					$this->design->assign('message_success', 'updated');
				}

				if ($product->id) {
					$query = $this->db->placehold("SELECT category_id FROM __products_categories WHERE product_id=?", $product->id);
					$this->db->query($query);

					$cIds = $this->db->results('category_id');

					if (!empty($cIds)) {
						$this->db->query($this->db->placehold("UPDATE __categories SET last_modified=NOW() WHERE id IN(?@)", $cIds));
					}

					$this->db->query($this->db->placehold("DELETE FROM __products_categories WHERE product_id=?", $product->id));

					if (is_array($productCategories)) {
						foreach ($productCategories as $i => $category) {
							$this->categories->addProductCategory($product->id, $category->id, $i);
						}
					}

					if (is_array($variants)) {
						$variantIds = [];

						foreach ($variants as $index => &$variant) {
							if ($variant->stock == '∞' || $variant->stock == '') {
								$variant->stock = null;
							}

							if (!empty($variant->id)) {
								$this->variants->updateVariant($variant->id, $variant);
							} else {
								$variant->product_id = $product->id;
								$variant->id = $this->variants->addVariant($variant);
							}

							$variant = $this->variants->getVariant($variant->id);

							if (!empty($variant->id)) {
								$variantIds[] = $variant->id;
							}
						}

						$currentVariants = $this->variants->getVariants(['product_id' => $product->id]);

						foreach ($currentVariants as $currentVariant) {
							if (!in_array($currentVariant->id, $variantIds)) {
								$this->variants->deleteVariant($currentVariant->id);
							}
						}

						asort($variantIds);

						foreach ($variantIds as $position => $variantId) {
							$this->variants->updateVariant($variantId, ['position' => $position]);
						}
					}

					$images = (array) $this->request->post('images');
					$currentImages = $this->products->getImages(['product_id' => $product->id]);

					foreach ($currentImages as $image) {
						if (!in_array($image->id, $images)) {
							$this->products->deleteImage($image->id);
						}
					}

					if ($images = $this->request->post('images')) {
						$i = 0;

						foreach ($images as $id) {
							$this->products->updateImage($id, ['position' => $i]);
							$i++;
						}
					}

					if ($images = $this->request->files('images')) {
						for ($i = 0; $i < count($images['name']); $i++) {
							if ($imageName = $this->image->uploadImage($images['tmp_name'][$i], $images['name'][$i])) {
								$this->products->addImage($product->id, $imageName);
							} else {
								$this->design->assign('error', 'error uploading image');
							}
						}
					}

					if ($images = $this->request->post('images_urls')) {
						foreach ($images as $url) {
							if (!empty($url) && $url != 'http://' && $url != 'https://' && strstr($url, '/') !== false) {
								$this->products->addImage($product->id, $url);
							} elseif ($droppedImages = $this->request->files('dropped_images')) {
								$key = array_search($url, $droppedImages['name']);
								if ($key !== false && $imageName = $this->image->uploadImage($droppedImages['tmp_name'][$key], $droppedImages['name'][$key])) {
									$this->products->addImage($product->id, $imageName);
								}
							}
						}
					}

					$images = $this->products->getImages(['product_id' => $product->id]);

					$files = (array) $this->request->post('files');
					$currentFiles = $this->files->getFiles(['object_id' => $product->id, 'type' => 'product']);

					foreach ($currentFiles as $file) {
						if (!isset($file->id, $files['id']) || !is_array($files['id']) || !in_array($file->id, $files['id'])) {
							$this->files->deleteFile($file->id);
						}
					}

					if ($files = $this->request->post('files')) {
						$i = 0;

						foreach ($files['id'] as $k => $id) {
							$this->files->updateFile($id, ['name' => $files['name'][$k], 'position' => $i]);
							$i++;
						}
					}

					if ($files = $this->request->files('files')) {
						for ($i = 0; $i < count($files['name']); $i++) {
							if ($fileName = $this->files->uploadFile($files['tmp_name'][$i], $files['name'][$i])) {
								$this->files->addFile($product->id, 'product', $fileName);
							} else {
								$this->design->assign('error', 'error uploading file');
							}
						}
					}

					$files = $this->files->getFiles(['object_id' => $product->id, 'type' => 'product']);

					$categoryFeatures = [];

					foreach ($this->features->getFeatures(['category_id' => $productCategories[0]]) as $f) {
						$categoryFeatures[] = $f->id;
					}

					$this->features->deleteProductOption($product->id);

					if ($optionsIds = $this->request->post('options_id')) {
						$optionsValues = $this->request->post('options_values');

						foreach ($optionsIds as $featureId => $optionsId) {
							foreach ($optionsId as $k => $valueId) {

								$value = trim($optionsValues[$featureId][$k]);
								if (!empty($value)) {
									if (!empty($valueId)) {
										$this->features->updateOption($valueId, ['value' => $value]);
									} else {

										if (!$valueId) {
											$option = new stdClass();
											$option->value = $value;
											$option->feature_id = $featureId;
											$valueId = $this->features->addOption($option);
										}
									}
								}

								if (!empty($valueId)) {
									$this->features->addProductOption($product->id, $valueId);
								}
							}
						}
					}

					$newFeaturesNames = $this->request->post('new_features_names');
					$newFeaturesValues = $this->request->post('new_features_values');

					if (is_array($newFeaturesNames) && is_array($newFeaturesValues)) {
						foreach ($newFeaturesNames as $i => $name) {
							$value = trim($newFeaturesValues[$i]);

							if (!empty($name) && !empty($value)) {
								$query = $this->db->placehold("SELECT * FROM __features WHERE name=? LIMIT 1", trim($name));
								$this->db->query($query);

								$featureId = $this->db->result('id');

								if (empty($featureId)) {
									$featureId = $this->features->addFeature(['name' => trim($name)]);
								}

								$this->features->addFeatureCategory($featureId, reset($productCategories)->id);

								$option = new stdClass();
								$option->feature_id = $featureId;
								$option->value = $value;
								$valueId = $this->features->addOption($option);

								$this->features->addProductOption($product->id, $valueId);
							}
						}
					}

					$query = $this->db->placehold("DELETE FROM __related_products WHERE product_id=?", $product->id);
					$this->db->query($query);

					if (is_array($relatedProducts)) {
						$pos = 0;
						foreach ($relatedProducts as $i => $relatedProduct) {
							$this->products->addRelatedProduct($product->id, $relatedProduct->related_id, $pos++);
						}
					}

					$query = $this->db->placehold("DELETE FROM __recommended_products WHERE product_id=?", $product->id);
					$this->db->query($query);

					if (is_array($recommendedProducts)) {
						$pos = 0;

						foreach ($recommendedProducts as $i => $recommendedProduct) {
							$this->products->addRecommendedProduct($product->id, $recommendedProduct->recommended_id, $pos++);
						}
					}

					$query = $this->db->placehold("DELETE FROM __products_videos WHERE product_id=?", $product->id);
					$this->db->query($query);

					if (is_array($productVideos)) {
						$pos = 0;
						foreach ($productVideos as $i => $video) {
							$this->products->addProductVideo($product->id, $video->link, $pos++);
						}
					}
				}
			}
		} else {
			$id = $this->request->get('id', 'integer');
			$product = $this->products->getProduct((int) $id);

			if ($product) {
				$productCategories = $this->categories->getCategories(['product_id' => $product->id]);
				$variants = $this->variants->getVariants(['product_id' => $product->id]);
				$images = $this->products->getImages(['product_id' => $product->id]);
				$relatedProducts = $this->products->getRelatedProducts(['product_id' => $product->id]);
				$recommendedProducts = $this->products->getRecommendedProducts(['product_id' => $product->id]);
				$productVideos = $this->products->getVideos(['product_id' => $product->id]);
				$files = $this->files->getFiles(['object_id' => $product->id, 'type' => 'product']);
			} else {
				$product = new stdClass();
				$product->visible = 1;
			}
		}

		if (empty($variants)) {
			$variants = [1];
		}

		if (empty($productCategories)) {
			$productCategories[0] = new stdClass();
			if ($categoryId = $this->request->get('category_id')) {
				$productCategories[0]->id = $categoryId;
			} else {
				$productCategories = [1];
			}
		}

		if (empty($product->brand_id) && $brandId = $this->request->get('brand_id')) {
			$product->brand_id = $brandId;
		}

		if (!empty($relatedProducts)) {
			foreach ($relatedProducts as &$relatedProduct) {
				$rProducts[$relatedProduct->related_id] = &$relatedProduct;
			}

			$tempProducts = $this->products->getProducts(['id' => array_keys($rProducts)]);
			foreach ($tempProducts as $tempProduct) {
				$rProducts[$tempProduct->id] = $tempProduct;
			}

			$relatedProductsImages = $this->products->getImages(['product_id' => array_keys($rProducts)]);
			foreach ($relatedProductsImages as $image) {
				$rProducts[$image->product_id]->images[] = $image;
			}
		}

		if (!empty($recommendedProducts)) {
			foreach ($recommendedProducts as &$recommendedProduct) {
				$rProducts[$recommendedProduct->recommended_id] = &$recommendedProduct;
			}

			$tempProducts = $this->products->getProducts(['id' => array_keys($rProducts)]);
			foreach ($tempProducts as $tempProduct) {
				$rProducts[$tempProduct->id] = $tempProduct;
			}

			$recommendedProductsImages = $this->products->getImages(['product_id' => array_keys($rProducts)]);
			foreach ($recommendedProductsImages as $image) {
				$rProducts[$image->product_id]->images[] = $image;
			}
		}

		$options = [];

		if (!empty($product->id)) {
			foreach ($this->features->getOptions(['product_id' => $product->id]) as $o) {
				$options[$o->feature_id][] = $o;
			}
		}

		$this->design->assign('product', $product);
		$this->design->assign('product_categories', $productCategories);
		$this->design->assign('product_variants', $variants);
		$this->design->assign('product_images', $images);
		$this->design->assign('options', $options);
		$this->design->assign('related_products', $relatedProducts);
		$this->design->assign('recommended_products', $recommendedProducts);
		$this->design->assign('product_videos', $productVideos);
		$this->design->assign('cms_files', $files);

		$brands = $this->brands->getBrands();
		$this->design->assign('brands', $brands);

		$categories = $this->categories->getCategoriesTree();
		$this->design->assign('categories', $categories);

		$category = reset($productCategories);

		if (!is_object($category)) {
			$category = reset($categories);
		}

		if (is_object($category) && isset($category->id)) {
			$features = $this->features->getFeatures(['category_id' => $category->id]);
			$this->design->assign('features', $features);
		}

		$this->design->assign('currencies', $this->money->getCurrencies(['enabled' => 1]));

		return $this->design->fetch('product.tpl');
	}

	/**
	 * Translit
	 */
	public function translit($text)
	{
		$cyr = explode('-', "А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я");
		$lat = explode('-', "A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch---Y-y---E-e-YU-yu-YA-ya");

		$res = str_replace($cyr, $lat, $text);
		$res = preg_replace("/[\s\-_]+/ui", '', $res);
		$res = preg_replace('/[^\p{L}\p{Nd}\d-]/ui', '', $res);
		$res = strtolower($res);

		return $res;
	}
}
