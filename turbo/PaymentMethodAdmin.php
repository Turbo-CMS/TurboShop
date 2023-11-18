<?php

require_once 'api/Turbo.php';

class PaymentMethodAdmin extends Turbo
{
    private $allowedImageExtentions = ['png', 'gif', 'jpg', 'jpeg', 'ico', 'svg'];

    public function fetch()
    {
        $paymentMethod = new stdClass();

        if ($this->request->isMethod('post')) {
            $paymentMethod->id = $this->request->post('id', 'integer');
            $paymentMethod->enabled = $this->request->post('enabled', 'boolean');
            $paymentMethod->name = $this->request->post('name');
            $paymentMethod->code = $this->request->post('code');
            $paymentMethod->currency_id = $this->request->post('currency_id');
            $paymentMethod->description = $this->request->post('description');
            $paymentMethod->module = $this->request->post('module', 'string');
            $paymentSettings = $this->request->post('payment_settings');

            if (!$paymentDeliveries = $this->request->post('payment_deliveries')) {
                $paymentDeliveries = [];
            }

            if (empty($paymentMethod->name)) {
                $this->design->assign('message_error', 'empty_name');
            } else {
                if (empty($paymentMethod->id)) {
                    $paymentMethod->id = $this->payment->addPaymentMethod($paymentMethod);
                    $this->design->assign('message_success', 'added');
                } else {
                    $this->payment->updatePaymentMethod($paymentMethod->id, $paymentMethod);
                    $this->design->assign('message_success', 'updated');
                }

                if ($paymentMethod->id) {
                    $this->payment->updatePaymentSettings($paymentMethod->id, $paymentSettings);
                    $this->payment->updatePaymentDeliveries($paymentMethod->id, $paymentDeliveries);
                }

                if ($this->request->post('delete_icon')) {
                    $this->payment->deleteIcon($paymentMethod->id);
                }

                $icon = $this->request->files('icon');

                if (!empty($icon['name']) && in_array(strtolower(pathinfo($icon['name'], PATHINFO_EXTENSION)), $this->allowedImageExtentions)) {
                    $this->payment->deleteIcon($paymentMethod->id);
                    move_uploaded_file($icon['tmp_name'], $this->root_dir . $this->config->payment_images_dir . $icon['name']);
                    $this->payment->updatePaymentMethod($paymentMethod->id, ['icon' => $icon['name']]);
                }

                $paymentMethod = $this->payment->getPaymentMethod($paymentMethod->id);
            }
        } else {
            $paymentMethod->id = $this->request->get('id', 'integer');

            if (!empty($paymentMethod->id)) {
                $paymentMethod = $this->payment->getPaymentMethod($paymentMethod->id);
                $paymentSettings =  $this->payment->getPaymentSettings($paymentMethod->id);
            } else {
                $paymentSettings = [];
            }

            $paymentDeliveries = $this->payment->getPaymentDeliveries($paymentMethod->id);
        }

        $this->design->assign('payment_deliveries', $paymentDeliveries);

        $deliveries = $this->delivery->getDeliveries();
        $this->design->assign('deliveries', $deliveries);

        $this->design->assign('payment_method', $paymentMethod);
        $this->design->assign('payment_settings', $paymentSettings);

        $paymentModules = $this->payment->getPaymentModules();
        $this->design->assign('payment_modules', $paymentModules);

        $currencies = $this->money->getCurrencies();
        $this->design->assign('currencies', $currencies);

        return $this->design->fetch('payment_method.tpl');
    }
}
