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

require_once 'api/Turbo.php';

class WayForPay extends Turbo
{
    protected $keysForSignature = [
        'merchantAccount',
        'merchantDomainName',
        'orderReference',
        'orderDate',
        'amount',
        'currency',
        'productName',
        'productCount',
        'productPrice'
    ];

    public function checkoutForm($orderId, $buttonText = null)
    {
        if (empty($buttonText)) {
            $buttonText = $this->translations->proceed_to_checkout;
        }

        $order = $this->orders->getOrder((int) $orderId);
        $purchases = $this->orders->getPurchases(['order_id' => (int) $order->id]);
        $paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
        $paymentCurrency = $this->money->getCurrency(intval($paymentMethod->currency_id));
        $settings = $this->payment->getPaymentSettings($paymentMethod->id);
        $amount = round($this->money->convert($order->total_price, $paymentMethod->currency_id, false), 2);

        $currency = $paymentCurrency->code;

        $productNames = [];
        $productQty = [];
        $productPrices = [];

        foreach ($purchases as $purchase) {
            $productNames[] = trim($purchase->product_name . ' ' . $purchase->variant_name);
            $productPrices[] = $this->money->convert($purchase->price, $paymentMethod->currency_id, false);
            $productQty[] = $purchase->amount;
        }

        $option = [];

        $option['merchantAccount'] = $settings['wayforpay_merchant'];
        $option['orderReference'] = $order->id . '#' . time();
        $option['orderDate'] = strtotime($order->date);
        $option['merchantAuthType'] = 'simpleSignature';
        $option['merchantDomainName'] = $_SERVER['HTTP_HOST'];
        $option['merchantTransactionSecureType'] = 'AUTO';
        $option['currency'] = 'UAH';
        $option['amount'] = $amount;

        if ($currency != 'UAH') {
            $option['alternativeCurrency'] = $currency;
            $option['alternativeAmount'] = $amount;
            $option['amount'] = $amount;
        }

        $option['productName'] = $productNames;
        $option['productPrice'] = $productPrices;
        $option['productCount'] = $productQty;

        $option['returnUrl'] = $this->config->root_url . '/order/' . $order->url;
        $option['serviceUrl'] = $this->config->root_url . '/payment/WayForPay/callback.php';

        $hash = [];

        foreach ($this->keysForSignature as $dataKey) {
            if (!isset($option[$dataKey])) {
                continue;
            }
            if (is_array($option[$dataKey])) {
                foreach ($option[$dataKey] as $v) {
                    $hash[] = $v;
                }
            } else {
                $hash[] = $option[$dataKey];
            }
        }

        $hash = implode(';', $hash);

        $option['merchantSignature'] = hash_hmac('md5', $hash, $settings['wayforpay_secretkey']);

        /**
         * Check phone
         */
        $phone = str_replace(['+', ' ', '(', ')'], ['', '', '', ''], $order->phone);

        if (strlen($phone) == 10) {
            $phone = '38' . $phone;
        } elseif (strlen($phone) == 11) {
            $phone = '3' . $phone;
        }

        $name = explode(' ', $order->name);

        $option['clientFirstName'] = isset($name[0]) ? $name[0] : '';
        $option['clientLastName'] = isset($name[1]) ? $name[1] : '';
        $option['clientEmail'] = $order->email;
        $option['clientPhone'] = $phone;
        $option['clientCity'] = isset($order->location) ? $order->location : '';
        $option['clientAddress'] = $order->address;
        $option['language'] = $settings['wayforpay_language'];

        $form = '<form method="post" action="https://secure.wayforpay.com/pay" accept-charset="utf-8">';

        foreach ($option as $name => $value) {
            if (!is_array($value)) {
                $form .= '<input type="hidden" name="' . $name . '" value="' . htmlspecialchars($value) . '">';
            } elseif (is_array($value)) {
                foreach ($value as $avalue) {
                    $form .= '<input type="hidden" name="' . $name . '[]" value="' . htmlspecialchars($avalue) . '">';
                }
            }
        }

        $form .= '<input type="submit" class="btn btn-success btn-checkout" value="' . $buttonText . '">';
        $form .= '</form>';

        return $form;
    }
}
