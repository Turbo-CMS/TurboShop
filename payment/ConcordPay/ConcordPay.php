<?php

require_once 'api/Turbo.php';

/**
 * Class Concordpay
 */
class ConcordPay extends Turbo
{
    /**
     * @var string
     */
    protected $url = 'https://pay.concord.ua/api/';

    const CURRENCY_UAH = 'UAH';

    const PAYMENT_STATUS_APPROVED = 'Approved';
    const PAYMENT_STATUS_DECLINED = 'Declined';

    const RESPONSE_TYPE_REVERSE = 'reverse';
    const RESPONSE_TYPE_PAYMENT = 'payment';

    const ORDER_PAYMENT_STATUS_PAID     = 1;
    const ORDER_PAYMENT_STATUS_NOT_PAID = 0;

    /**
     * Keys for generate request signature.
     *
     * @var string[]
     */
    protected $keysForSignature = [
        'merchant_id',
        'order_id',
        'amount',
        'currency_iso',
        'description'
    ];

    /**
     * Allowed operation types for orders.
     *
     * @var string[]
     */
    protected $operationTypes = [
        'payment',
        'reverse'
    ];

    /**
     * @param $orderId
     * @param null $buttonText
     * @return string
     */
    public function checkoutForm($orderId, $buttonText = null)
    {
        if (empty($buttonText)) {
            $buttonText = $this->translations->proceed_to_checkout;
        }

        $order = $this->orders->getOrder((int) $orderId);
        $purchases = $this->orders->getPurchases(['order_id' => (int) $order->id]);

        $paymentMethod = $this->payment->getPaymentMethod($order->payment_method_id);
        $paymentCurrency = $this->money->getCurrency((int) $paymentMethod->currency_id);

        $settings = $this->payment->getPaymentSettings($paymentMethod->id);
        $amount = round($this->money->convert($order->total_price, $paymentMethod->currency_id, false), 2);
        $currency = $paymentCurrency->code ?? self::CURRENCY_UAH;

        $productNames = [];
        $productQty = [];
        $productPrices = [];

        foreach ($purchases as $purchase) {
            $productNames[] = trim($purchase->product_name . ' ' . $purchase->variant_name);
            $productPrices[] = $this->money->convert($purchase->price, $paymentMethod->currency_id, false);
            $productQty[] = $purchase->amount;
        }

        $rootUrl = $this->config->root_url;
        $option = [];
        $option['operation'] = 'Purchase';
        $option['merchant_id'] = $settings['concordpay_merchant'];
        $option['amount'] = $amount;
        $option['order_id'] = $order->id . '#' . time();
        $option['currency_iso'] = $currency;
        $option['description'] = 'Payment by card on the site' . ' ' . htmlspecialchars($_SERVER["HTTP_HOST"]) .
            ', ' . $order->name . ', ' . $order->phone;
        $option['add_params'] = [];
        $option['approve_url'] = "$rootUrl/order/" . $order->url;
        $option['decline_url'] = "$rootUrl/order/" . $order->url;
        $option['cancel_url'] = "$rootUrl/order/" . $order->url;
        $option['callback_url'] = "$rootUrl/payment/ConcordPay/callback.php";
        // Statistics
        $option['client_first_name'] = $this->getName($order->name)['client_first_name'];
        $option['client_last_name']  = $this->getName($order->name)['client_last_name'];
        $option['email']             = $order->email ?? '';
        $option['phone']             = $order->phone ?? '';

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

        $option['signature'] = hash_hmac('md5', $hash, $settings['concordpay_secretkey']);

        $form = '<form method="post" action="' . $this->url . '" accept-charset="utf-8">';
        foreach ($option as $name => $value) {
            $form .= $this->printInput($name, $value);
        }

        $form .= '<input type="submit" class="btn btn-success btn-checkout" value="' . $buttonText . '">';
        $form .= '</form>';

        return $form;
    }

    /**
     * Prints inputs in form.
     *
     * @param string       $name Attribute name.
     * @param array|string $value Attribute value.
     * @return string
     */
    protected function printInput($name, $value)
    {
        $str = '';
        if (!is_array($value)) {
            return '<input type="hidden" name="' . $name . '" value="' . htmlspecialchars($value) . '">';
        }
        foreach ($value as $v => $dataKey) {
            $str .= $this->printInput($name . '[' . $v . ']', $dataKey);
        }
        return $str;
    }

    /**
     * @param $fullName
     * @return false|string[]
     */
    protected function getName($fullName)
    {
        $names = explode(' ', $fullName);
        if (!empty($names)) {
            $names['client_first_name'] = $names[0] ?? '';
            $names['client_last_name']  = $names[1] ?? '';
        }

        return $names;
    }

    /**
     * @return string[]
     */
    public function getOperationTypes()
    {
        return $this->operationTypes;
    }
}
