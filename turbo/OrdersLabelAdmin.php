<?php

require_once('api/Turbo.php');

class OrdersLabelAdmin extends Turbo
{
    public function fetch()
    {
        $label = new stdClass();
        $label->color = 'ffffff';

        if ($this->request->isMethod('post')) {
            $label->id = $this->request->post('id', 'integer');
            $label->name = $this->request->post('name');
            $label->color = $this->request->post('color');

            if (empty($label->name)) {
                $this->design->assign('message_error', 'empty_name');
            } elseif (empty($label->id)) {
                $label->id = $this->orders->addLabel($label);
                $label = $this->orders->getLabel($label->id);
                $this->design->assign('message_success', 'added');
            } else {
                $this->orders->updateLabel($label->id, $label);
                $label = $this->orders->getLabel($label->id);
                $this->design->assign('message_success', 'updated');
            }
        } else {
            $id = $this->request->get('id', 'integer');
            if (!empty($id)) {
                $label = $this->orders->getLabel(intval($id));
            }
        }

        $this->design->assign('label', $label);

        return $this->design->fetch('orders_label.tpl');
    }

}

