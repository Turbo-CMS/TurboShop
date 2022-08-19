<?php

require_once('api/Turbo.php');

class CommentsAdmin extends Turbo
{
	function fetch()
	{
		$filter = array();
		$filter['page'] = max(1, $this->request->get('page', 'integer'));

		$filter['limit'] = 40;

		$item_id = $this->request->get('item_id', 'integer');
		if ($item_id)
			$filter['object_id'] = $item_id;

		// Type
		$type = $this->request->get('type', 'string');
		if ($type) {
			$filter['type'] = $type;
			$this->design->assign('type', $type);
		}

		// Search
		$keyword = $this->request->get('keyword', 'string');
		if (!empty($keyword)) {
			$filter['keyword'] = $keyword;
			$this->design->assign('keyword', $keyword);
		}

		// Action processing 	
		if ($this->request->method('post')) {

			// Actions with selected
			$ids = $this->request->post('check');
			if (!empty($ids) && is_array($ids))
				switch ($this->request->post('action')) {
					case 'approve': {
							foreach ($ids as $id)
								$this->comments->update_comment($id, array('approved' => 1));
							break;
						}
					case 'delete': {
							foreach ($ids as $id)
								$this->comments->delete_comment($id);
							break;
						}
				}

			// Accept comment
			if ($this->request->post('comment_answer', 'boolean') && ($parent_comment = $this->comments->get_comment($this->request->post('parent_id', 'integer')))) {
				$comment = new stdClass();
				$comment->parent_id = $parent_comment->id;
				$comment->type = $parent_comment->type;
				$comment->object_id = $parent_comment->object_id;
				$comment->text = $this->request->post('text');
				$comment->name = ($this->settings->notify_from_name ? $this->settings->notify_from_name : 'Administrator');
				$comment->approved = 1;
				$comment->admin = 1;
				$comment->ip = $_SERVER['REMOTE_ADDR'];
				$comment->id = $this->comments->add_comment($comment);
			}
		}

		// Display
		$comments_count = $this->comments->count_comments($filter);

		// Show all pages at once
		if ($this->request->get('page') == 'all' || $item_id)
			$filter['limit'] = $comments_count;

		if ($item_id || $type == 'review')
			$comments = $this->comments->get_comments_tree($filter);
		else
			$comments = $this->comments->get_comments($filter);

		// Selects objects that are commented out
		$products_ids = array();
		$posts_ids = array();
		$articles_ids = array();
		foreach ($comments as $comment) {

			if ($comment->type == 'product')
				$products_ids[] = $comment->object_id;
			if ($comment->type == 'blog')
				$posts_ids[] = $comment->object_id;
			if ($comment->type == 'article')
				$articles_ids[] = $comment->object_id;
		}

		$posts = array();
		foreach ($this->blog->get_posts(array('id' => $posts_ids)) as $p)
			$posts[$p->id] = $p;

		$products = array();
		foreach ($this->products->get_products(array('id' => $products_ids)) as $p)
			$products[$p->id] = $p;

		$articles = array();
		foreach ($this->articles->get_articles(array('id' => $articles_ids)) as $p)
			$articles[$p->id] = $p;

		foreach ($comments as &$comment) {
			if ($comment->type == 'product' && isset($products[$comment->object_id]))
				$comment->product = $products[$comment->object_id];
			if ($comment->type == 'blog' && isset($posts[$comment->object_id]))
				$comment->post = $posts[$comment->object_id];
			if ($comment->type == 'article' && isset($articles[$comment->object_id]))
				$comment->article = $articles[$comment->object_id];
		}

		$this->design->assign('pages_count', ceil($comments_count / $filter['limit']));
		$this->design->assign('current_page', $filter['page']);

		$this->design->assign('comments', $comments);
		$this->design->assign('comments_count', $comments_count);

		if ($item_id || $type == 'review')
			return $this->design->fetch('comments_tree.tpl');
		else
			return $this->design->fetch('comments.tpl');
	}
}
