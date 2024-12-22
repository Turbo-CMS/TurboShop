<?php

require_once 'api/Turbo.php';

class RobotsAdmin extends Turbo
{
    public function fetch()
    {
        if ($this->request->method('post')) {
            $robotsData = $this->request->post('robots');
            $this->getRobots($robotsData, 'write');
        }

        $robotsTxt = $this->getRobots('', 'read');
        $this->design->assign('robots_txt', $robotsTxt);

        $perms = is_writable('robots.txt');

        if (!$perms) {
            $this->design->assign('message_error', 'write_error');
        }

        return $this->design->fetch('robots.tpl');
    }

    private function getRobots($data, $type)
    {
        if ($type == 'write') {
            $perms = is_writable('robots.txt');

            if ($perms) {
                file_put_contents('robots.txt', strip_tags($data), LOCK_EX);
                $this->design->assign('message_success', 'updated');
            } else {
                $this->design->assign('message_error', 'write_error');
            }
        } elseif ($type = 'read') {
            $robots = file_get_contents("robots.txt");
            return $robots;
        }
    }
}
