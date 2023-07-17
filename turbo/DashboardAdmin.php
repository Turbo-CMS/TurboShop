<?php

require_once 'api/Turbo.php';

class DashboardAdmin extends Turbo
{
    public function fetch()
    {
        $filter = [];

        $newOrdersCounter = $this->orders->countOrders(['status' => 0]);
        $this->design->assign('new_orders_counter', $newOrdersCounter);

        $newCommentsCounter = $this->comments->countComments(['approved' => 0]);
        $this->design->assign('new_comments_counter', $newCommentsCounter);

        $newFeedbacksCounter = $this->feedbacks->countFeedbacks(['processed' => 0]);
        $this->design->assign('new_feedbacks_counter', $newFeedbacksCounter);

        $newCallbacksCounter = $this->callbacks->countCallbacks(['processed' => 0]);
        $this->design->assign('new_callbacks_counter', $newCallbacksCounter);

        $newSubscribesCounter = $this->subscribes->countSubscribes(['processed' => 0]);
        $this->design->assign('new_subscribes_counter', $newSubscribesCounter);

        $this->design->assign('stat_orders', $this->reportstat->getStatOrders($filter));
        $this->design->assign('stat', $this->reportstat->getStat($filter));

        $ordersCount = $this->orders->countOrders($filter);
        $this->design->assign('orders_count', $ordersCount);

        return $this->design->fetch('dashboard.tpl');
    }
}
