<?php

require_once('api/Turbo.php');

class DashboardAdmin extends Turbo
{

    public function fetch()
    {
        $filter = array();

        // Counters
        $new_orders_counter = $this->orders->count_orders(array('status' => 0));
        $this->design->assign("new_orders_counter", $new_orders_counter);

        $new_comments_counter = $this->comments->count_comments(array('approved' => 0));
        $this->design->assign("new_comments_counter", $new_comments_counter);

        $new_feedbacks_counter = $this->feedbacks->count_feedbacks(array('processed' => 0));
        $this->design->assign("new_feedbacks_counter", $new_feedbacks_counter);

        $new_callbacks_counter = $this->callbacks->count_callbacks(array('processed' => 0));
        $this->design->assign("new_callbacks_counter", $new_callbacks_counter);

        $new_subscribes_counter = $this->subscribes->count_subscribes(array('processed' => 0));
        $this->design->assign("new_subscribes_counter", $new_subscribes_counter);

        // Statistics
        $this->design->assign('stat_orders', $this->reportstat->get_stat_orders($filter));
        $this->design->assign('stat', $this->reportstat->get_stat($filter));

        $orders_count = $this->orders->count_orders($filter);
        $this->design->assign('orders_count', $orders_count);

        return $this->design->fetch('dashboard.tpl');
    }
}
