<?php

require_once 'api/Turbo.php';

class BlogAdmin extends Turbo
{
    public function fetch()
    {
        if ($this->request->isMethod('post')) {
            $ids = $this->request->post('check');

            if (is_array($ids)) {
                switch ($this->request->post('action')) {
                    case 'disable':
                        $this->blog->updatePost($ids, ['visible' => 0]);
                        break;

                    case 'enable':
                        $this->blog->updatePost($ids, ['visible' => 1]);
                        break;

                    case 'delete':
                        foreach ($ids as $id) {
                            $this->blog->deletePost($id);
                        }
                        break;
                }
            }
        }

        $filter = ['page' => max(1, (int) $this->request->get('page', 'integer')), 'limit' => $this->settings->blog_num_admin,];

        $keyword = $this->request->get('keyword', 'string');

        if (!empty($keyword)) {
            $filter['keyword'] = $keyword;
            $this->design->assign('keyword', $keyword);
        }

        $postsCount = $this->blog->countPosts($filter);

        if ($this->request->get('page') == 'all') {
            $filter['limit'] = $postsCount;
        }

        $posts = $this->blog->getPosts($filter);

        $this->design->assign('posts_count', $postsCount);
        $this->design->assign('pages_count', ceil($postsCount / $filter['limit']));
        $this->design->assign('current_page', $filter['page']);
        $this->design->assign('posts', $posts);

        return $this->design->fetch('blog.tpl');
    }
}
