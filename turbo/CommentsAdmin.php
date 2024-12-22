<?php

require_once 'api/Turbo.php';

class CommentsAdmin extends Turbo
{
	public function fetch()
	{
		$filter = ['page' => max(1, $this->request->get('page', 'integer')), 'limit' => $this->settings->comments_num_admin, 'has_parent' => false,];

		if ($itemId = $this->request->get('item_id', 'integer')) {
			$filter['object_id'] = $itemId;
		}

		if ($type = $this->request->get('type', 'string')) {
			$filter['type'] = $type;
			$this->design->assign('type', $type);
		}

		if (!empty($keyword = $this->request->get('keyword', 'string'))) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		if ($this->request->method('post')) {

			if (($ids = $this->request->post('check'))
				&& is_array($ids)
			) {
				switch ($this->request->post('action')) {
					case 'approve':
						foreach ($ids as $id) {
							$this->comments->updateComment((int) $id, ['approved' => 1]);
						}
						break;

					case 'delete':
						foreach ($ids as $id) {
							$this->comments->deleteComment((int) $id);
						}
						break;
				}
			}

			if ($this->request->post('comment_answer', 'boolean') && ($parentComment = $this->comments->getComment($this->request->post('parent_id', 'integer')))) {
				$comment = new stdClass();
				$comment->parent_id = $parentComment->id;
				$comment->type = $parentComment->type;
				$comment->object_id = $parentComment->object_id;
				$comment->text = $this->request->post('text');
				$comment->name = $this->settings->notify_from_name ?? 'Administrator';
				$comment->approved = 1;
				$comment->admin = 1;
				$comment->ip = $_SERVER['REMOTE_ADDR'];
				$comment->id = $this->comments->addComment($comment);
			}
		}

		$commentsCount = $this->comments->countComments($filter);

		if ($this->request->get('page') == 'all') {
			$filter['limit'] = $commentsCount;
		}

		$comments = $this->comments->getComments($filter);

		$children = [];

		foreach ($this->comments->getComments() as $c) {
			if (!isset($children[$c->id])) {
				$children[$c->id] = [];
			}
			
			$children[$c->parent_id][] = $c;
		}

		$productsIds = $postsIds = $articlesIds = [];

		foreach ($comments as $comment) {
			switch ($comment->type) {
				case 'product':
					$productsIds[] = $comment->object_id;
					break;

				case 'blog':
					$postsIds[] = $comment->object_id;
					break;

				case 'article':
					$articlesIds[] = $comment->object_id;
					break;
			}
		}

		$posts = [];

		foreach ($this->blog->getPosts(['id' => $postsIds]) as $p) {
			$posts[$p->id] = $p;
		}

		$products = [];

		foreach ($this->products->getProducts(['id' => $productsIds]) as $p) {
			$products[$p->id] = $p;
		}

		$articles = [];

		foreach ($this->articles->getArticles(['id' => $articlesIds]) as $p) {
			$articles[$p->id] = $p;
		}

		foreach ($comments as &$comment) {
			if ($comment->type == 'product' && isset($products[$comment->object_id])) {
				$comment->product = $products[$comment->object_id];
			}

			if ($comment->type == 'blog' && isset($posts[$comment->object_id])) {
				$comment->post = $posts[$comment->object_id];
			}

			if ($comment->type == 'article' && isset($articles[$comment->object_id])) {
				$comment->article = $articles[$comment->object_id];
			}
		}

		$this->design->assign('pages_count', ceil($commentsCount / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);
		$this->design->assign('comments', $comments);
		$this->design->assign('children', $children);
		$this->design->assign('comments_count', $commentsCount);

		return $this->design->fetch('comments.tpl');
	}
}
