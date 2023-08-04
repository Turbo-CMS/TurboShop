<?php

chdir('../../');
require_once 'api/Turbo.php';
require_once 'payment/fondy/fondy.cls.php';
require_once dirname(__FILE__) . '/FondyView.php';

$fonView = new FondyView();
$turbo = new Turbo();
$err = '';

////////////////////////////////////////////////
// Select an order from the database
////////////////////////////////////////////////
if (empty($_POST)) {
    $fap = json_decode(file_get_contents("php://input"));

    if (empty($fap)) {
        die('No response');
    }

    $_POST = [];

    foreach ($fap as $key => $val) {
        $_POST[$key] = $val;
    }

    list($order_id,) = explode(fondycsl::ORDER_SEPARATOR, $_POST['order_id']);
    $order = $turbo->orders->get_order((int) $order_id);
    $paymentMethod = $turbo->payment->getPaymentMethod($order->payment_method_id);
    $paymentCurrency = $turbo->money->getCurrency((int) $paymentMethod->currency_id);
    $settings = $turbo->payment->getPaymentSettings($paymentMethod->id);

    $options = [
        'merchant' => $settings['fondy_merchantid'],
        'secretkey' => $settings['fondy_secret']
    ];

    $paymentInfo = fondycsl::isPaymentValid($options, $_POST);

    if (!$order->paid) {
        if ($_POST['amount'] / 100 >= round($turbo->money->convert($order->total_price, $paymentMethod->currency_id, false), 2)) {
            if ($paymentInfo === true) {
                if ($_POST['order_status'] == fondycsl::ORDER_APPROVED) {
                    // Set status paid
                    $turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

                    // We will send an email notification
                    $turbo->notify->emailOrderUser((int) $order->id);
                    $turbo->notify->emailOrderAdmin((int) $order->id);

                    // Write off goods
                    $turbo->orders->close((int) $order->id);

                    echo 'Ok';
                } else {
                    $turbo->orders->updateOrder((int) $order->id, ['paid' => 0]);
                    echo 'error';
                }
            }
        }
    } else {
        echo 'Order status already updated';
    }
} else {
    list($order_id,) = explode(fondycsl::ORDER_SEPARATOR, $_POST['order_id']);
    $order = $turbo->orders->getOrder((int) $order_id);
    $paymentMethod = $turbo->payment->getPaymentMethod($order->payment_method_id);
    $paymentCurrency = $turbo->money->getCurrency((int) $paymentMethod->currency_id);
    $settings = $turbo->payment->getPaymentSettings($paymentMethod->id);

    $options = [
        'merchant' => $settings['fondy_merchantid'],
        'secretkey' => $settings['fondy_secret']
    ];

    $paymentInfo = fondycsl::isPaymentValid($options, $_POST);

    if (!$order->paid) {
        if ($_POST['amount'] / 100 >= round($turbo->money->convert($order->total_price, $paymentMethod->currency_id, false), 2)) {
            if ($paymentInfo === true) {
                if ($_POST['order_status'] == fondycsl::ORDER_APPROVED) {
                    // Set status paid
                    $turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);

                    // We will send an email notification
                    $turbo->notify->emailOrderUser((int) $order->id);
                    $turbo->notify->emailOrderAdmin((int) $order->id);

                    // Write off goods
                    $turbo->orders->close((int) $order->id);

                    $invoice['status'] = $_POST['order_status'];
                    $invoice['transaction'] = $_POST['order_id'];
                    $invoice['system'] = 'Fondy';

                    $invoice['amount'] = $_POST['amount'] / 100 . " " . $paymentCurrency->code;

                    $fonView->design->assign('invoice', $invoice);

                    print $fonView->fetch();
                } else {
                    $turbo->orders->updateOrder((int) $order->id, ['paid' => 0]);

                    $invoice['status'] = $_POST['order_status'];
                    $invoice['error_message'] = $_POST['response_description'];
                    $invoice['error_code'] = $_POST['response_code'];
                    $fonView->design->assign('invoice', $invoice);

                    print $fonView->fetch();
                }
            } else {
                $err = $paymentInfo;
            }
        } else {
            $err = "Amount check failed";
        }
    }
    $invoice['error_code'] = 'unknown code';
    $invoice['status'] = $_POST[order_status];
    $invoice['error_message'] = $err;
    $fonView->design->assign('invoice', $invoice);
}
