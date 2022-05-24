<?php

require_once('api/Turbo.php');

class BannersImageAdmin extends Turbo
{

    private    $allowed_image_extentions = array('png', 'gif', 'jpg', 'jpeg', 'ico');

    public function fetch()
    {
        $banners_image = new stdClass;
        if ($this->request->method('post')) {
            $banners_image->id = $this->request->post('id', 'integer');
            $banners_image->name = $this->request->post('name');
            $banners_image->visible = $this->request->post('visible', 'boolean');
            $banners_image->banner_id = $this->request->post('banner_id', 'integer');

            $banners_image->url = $this->request->post('url');
            $banners_image->button = $this->request->post('button');
            $banners_image->title = $this->request->post('title');
            $banners_image->alt = $this->request->post('alt');
            $banners_image->description = $this->request->post('description');

            if (empty($banners_image->id)) {
                $banners_image->id = $this->banners->add_banners_image($banners_image);
                $this->design->assign('message_success', 'added');
            } else {
                $this->banners->update_banners_image($banners_image->id, $banners_image);
                $this->design->assign('message_success', 'updated');
            }
            // Delete  image
            if ($this->request->post('delete_image')) {
                $this->banners->delete_image($banners_image->id);
            }
            // Image upload
            $image = $this->request->files('image');
            if (!empty($image['name']) && in_array(strtolower(pathinfo($image['name'], PATHINFO_EXTENSION)), $this->allowed_image_extentions)) {
                $this->banners->delete_image($banners_image->id);
                move_uploaded_file($image['tmp_name'], $this->root_dir . $this->config->banners_images_dir . $image['name']);
                $this->banners->update_banners_image($banners_image->id, array('image' => $image['name']));
            }
            $banners_image = $this->banners->get_banners_image(intval($banners_image->id));
        } else {
            $banners_image->id = $this->request->get('id', 'integer');
            $banners_image = $this->banners->get_banners_image(intval($banners_image->id));
        }

        $banners = $this->banners->get_banners();

        $this->design->assign('banners_image', $banners_image);
        $this->design->assign('banners', $banners);
        return  $this->design->fetch('banners_image.tpl');
    }
}
