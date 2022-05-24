<?php
	
require_once('api/Turbo.php');

class CommentAdmin extends Turbo
{
    public function fetch()
    {
        $comment = new stdClass;
        if ($this->request->method('post')) {
            $comment->id = $this->request->post('id', 'integer');
            $comment->name = $this->request->post('name');
            $comment->date = date('Y-m-d H:i:s', strtotime($this->request->post('date') . '' . $this->request->post('time')));
            $comment->type = $this->request->post('type');
            $comment->approved = $this->request->post('approved', 'boolean');
            $comment->ip = $this->request->post('ip');
            $comment->admin = $this->request->post('admin');
            $comment->object_id = $this->request->post('object_id');
            $comment->parent_id = $this->request->post('parent_id');
            $comment->text = $this->request->post('text');

            if (empty($comment->id)) {
                $comment->id = $this->comments->add_comment($comment);
                $comment = $this->comments->get_comment($comment->id);
                $this->design->assign('message_success', 'added');
            } else {
                $this->comments->update_comment($comment->id, $comment);
                $comment = $this->comments->get_comment($comment->id);
                $this->design->assign('message_success', 'updated');
            }
        } else {
            $comment->id = $this->request->get('id', 'integer');
            $comment = $this->comments->get_comment(intval($comment->id));
        }

        if (empty($comment->date))
            $comment->date = date($this->settings->date_format, time());

        if ($comment->type == 'product')
            $comment->object = $this->products->get_product((int)$comment->object_id);
        if ($comment->type == 'blog')
            $comment->object = $this->blog->get_post((int)$comment->object_id);
        if ($comment->type == 'article')
            $comment->object = $this->articles->get_article((int)$comment->object_id);

        $this->design->assign('comment', $comment);

        return $this->design->fetch('comment.tpl');
    }
}
