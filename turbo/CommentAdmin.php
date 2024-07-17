<?php

require_once 'api/Turbo.php';

class CommentAdmin extends Turbo
{
	public function fetch()
	{
		$comment = new stdClass();

		if ($this->request->isMethod('post')) {
			$comment->id = $this->request->post('id', 'integer');
			$comment->name = $this->request->post('name');
			$comment->date = date('Y-m-d H:i:s', strtotime($this->request->post('date') . '' . $this->request->post('time')));
			$comment->type = $this->request->post('type');
			$comment->approved = $this->request->post('approved', 'boolean');
			$comment->ip = $this->request->post('ip');
			$comment->admin = $this->request->post('admin');
			$comment->object_id = $this->request->post('object_id');
			$comment->parent_id = $this->request->post('parent_id');
			$comment->rating = $this->request->post('rating');
			$comment->text = $this->request->post('text');

			if (empty($comment->id)) {
				$comment->id = $this->comments->addComment($comment);
				$comment = $this->comments->getComment($comment->id);
				$this->design->assign('message_success', 'added');
			} else {
				$this->comments->updateComment($comment->id, $comment);
				$comment = $this->comments->getComment($comment->id);
				$this->design->assign('message_success', 'updated');
			}
		} else {
			$comment->id = $this->request->get('id', 'integer');
			$comment = $this->comments->getComment((int) $comment->id);
		}

		if (empty($comment->date)) {
			$comment->date = date($this->settings->date_format, time());
		}

		if ($comment->type == 'product') {
			$comment->object = $this->products->getProduct((int) $comment->object_id);
		} elseif ($comment->type == 'blog') {
			$comment->object = $this->blog->getPost((int) $comment->object_id);
		} elseif ($comment->type == 'article') {
			$comment->object = $this->articles->getArticle((int) $comment->object_id);
		}

		$this->design->assign('comment', $comment);

		return $this->design->fetch('comment.tpl');
	}
}
