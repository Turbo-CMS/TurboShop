<?php
/**
 * Turbo CMS
 *
 * @link         http://wayforpay.com
 * @author       WayForPay
 * @mail         sales@wayforpay.com
 *
 * Оплата через WayForPay
 *
 */

chdir('../../');
require_once('api/Turbo.php');
$turbo = new Turbo();

$data = json_decode(file_get_contents("php://input"), true);
$keysForSignature = array(
    'merchantAccount',
    'orderReference',
    'amount',
    'currency',
    'authCode',
    'cardPan',
    'transactionStatus',
    'reasonCode'
);

$order_parse = !empty($data['orderReference']) ? explode('#', $data['orderReference']) : null;
if (is_array($order_parse)) {
    $order_id = $order_parse[0];
} else {
    $order_id = $order_parse;
}
$order = $turbo->orders->get_order(intval($order_id));
if (empty($order)) {
    die('Заказ не найден');
}

$method = $turbo->payment->get_payment_method(intval($order->payment_method_id));
if (empty($method)) {
    die("Неизвестный метод оплаты");
}

$amount = !empty($data['amount']) ? $data['amount'] : null;
$w4pAmount = round($amount, 2);
$orderAmount = round($turbo->money->convert($order->total_price, $method->currency_id, false), 2);
if ($orderAmount != $w4pAmount) {
    die("Неверная сумма оплаты");
}


$settings = unserialize($method->settings);
$merchant = $settings['wayforpay_merchant'];

$sign = array();
foreach ($keysForSignature as $dataKey) {
    if (array_key_exists($dataKey, $data)) {
        $sign [] = $data[$dataKey];
    }
}
$sign = implode(';', $sign);
$sign = hash_hmac('md5', $sign, $settings['wayforpay_secretkey']);
if (!empty($data["merchantSignature"]) && $data["merchantSignature"] != $sign) {
    die("Контрольная подпись не верна");
}

$time = time();

$responseToGateway = array(
//    'orderReference' => $order->id,
    'orderReference' => $data['orderReference'],
    'status' => 'accept',
    'time' => $time
);
$sign = array();
foreach ($responseToGateway as $dataKey => $dataValue) {
    $sign [] = $dataValue;
}
$sign = implode(';', $sign);
$sign = hash_hmac('md5', $sign, $settings['wayforpay_secretkey']);
$responseToGateway['signature'] = $sign;

if (!empty($data['transactionStatus']) &&  $data['transactionStatus'] == 'Approved' && !$order->paid) {
    $turbo->orders->update_order(intval($order->id), array('paid' => 1));
    $turbo->orders->close(intval($order->id));
    $turbo->notify->email_order_user(intval($order->id));
    $turbo->notify->email_order_admin(intval($order->id));
}
echo json_encode($responseToGateway);
