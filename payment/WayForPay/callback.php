<?php

/**
 * Turbo CMS
 *
 * @link         http://wayforpay.com
 * @author       WayForPay
 * @mail         sales@wayforpay.com
 *
 * Payment via WayForPay
 *
 */

chdir('../../');
require_once 'api/Turbo.php';
$turbo = new Turbo();

$data = json_decode(file_get_contents("php://input"), true);

$keysForSignature = [
    'merchantAccount',
    'orderReference',
    'amount',
    'currency',
    'authCode',
    'cardPan',
    'transactionStatus',
    'reasonCode'
];

$orderParse = !empty($data['orderReference']) ? explode('#', $data['orderReference']) : null;

if (is_array($orderParse)) {
    $orderId = $orderParse[0];
} else {
    $orderId = $orderParse;
}

$order = $turbo->orders->getOrder((int) $orderId);

if (empty($order)) {
    die('Order not found');
}

$method = $turbo->payment->getPaymentMethod((int) $order->payment_method_id);

if (empty($method)) {
    die("Unknown payment method");
}

$amount = !empty($data['amount']) ? $data['amount'] : null;
$w4pAmount = round($amount, 2);
$orderAmount = round($turbo->money->convert($order->total_price, $method->currency_id, false), 2);

if ($orderAmount != $w4pAmount) {
    die("Invalid payment amount");
}

$settings = unserialize($method->settings);
$merchant = $settings['wayforpay_merchant'];

$sign = [];

foreach ($keysForSignature as $dataKey) {
    if (array_key_exists($dataKey, $data)) {
        $sign[] = $data[$dataKey];
    }
}

$sign = implode(';', $sign);
$sign = hash_hmac('md5', $sign, $settings['wayforpay_secretkey']);

if (!empty($data["merchantSignature"]) && $data["merchantSignature"] != $sign) {
    die("The control signature is not correct");
}

$time = time();

$responseToGateway = [
    //'orderReference' => $order->id,
    'orderReference' => $data['orderReference'],
    'status' => 'accept',
    'time' => $time
];

$sign = [];

foreach ($responseToGateway as $dataKey => $dataValue) {
    $sign[] = $dataValue;
}

$sign = implode(';', $sign);
$sign = hash_hmac('md5', $sign, $settings['wayforpay_secretkey']);
$responseToGateway['signature'] = $sign;

if (!empty($data['transactionStatus']) &&  $data['transactionStatus'] == 'Approved' && !$order->paid) {
    $turbo->orders->updateOrder((int) $order->id, ['paid' => 1]);
    $turbo->orders->close((int) $order->id);
    $turbo->notify->emailOrderUser((int) $order->id);
    $turbo->notify->emailOrderAdmin((int) $order->id);
}

echo json_encode($responseToGateway);
