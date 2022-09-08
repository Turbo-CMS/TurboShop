<?php

require_once('api/Turbo.php');

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
    protected $keysForSignature = array(
        'merchant_id',
        'order_id',
        'amount',
        'currency_iso',
        'description'
    );
    /**
     * Allowed operation types for orders.
     *
     * @var string[]
     */
    protected $operationTypes = array(
        'payment',
        'reverse'
    );

    /**
     * @param $order_id
     * @param null $button_text
     * @return string
     */
    public function checkout_form($order_id, $button_text = null)
    {
        if (empty($button_text)) {
            $button_text = $this->translations->proceed_to_checkout;
        }
        $order     = $this->orders->get_order((int)$order_id);
        $purchases = $this->orders->get_purchases(array('order_id' => (int)$order->id));

        $payment_method   = $this->payment->get_payment_method($order->payment_method_id);
        $payment_currency = $this->money->get_currency((int)$payment_method->currency_id);

        $settings = $this->payment->get_payment_settings($payment_method->id);
        $amount   = round($this->money->convert($order->total_price, $payment_method->currency_id, false), 2);
        $currency = $payment_currency->code ?? self::CURRENCY_UAH;

        $productNames  = array();
        $productQty    = array();
        $productPrices = array();
        foreach ($purchases as $purchase) {
            $productNames[]  = trim($purchase->product_name . ' ' . $purchase->variant_name);
            $productPrices[] = $this->money->convert($purchase->price, $payment_method->currency_id, false);
            $productQty[]    = $purchase->amount;
        }

        $root_url = $this->config->root_url;
        $option = array();
        $option['operation']    = 'Purchase';
        $option['merchant_id']  = $settings['concordpay_merchant'];
        $option['amount']       = $amount;
        $option['order_id']     = $order->id . '#' . time();
        $option['currency_iso'] = $currency;
        $option['description']  = 'Оплата картой на сайте' . ' ' . htmlspecialchars($_SERVER["HTTP_HOST"]) .
            ', ' . $order->name . ', ' . $order->phone;
        $option['add_params']   = [];
        $option['approve_url']  = "$root_url/order/" . $order->url;
        $option['decline_url']  = "$root_url/order/" . $order->url;
        $option['cancel_url']   = "$root_url/order/" . $order->url;
        $option['callback_url'] = "$root_url/payment/ConcordPay/callback.php";
        // Statistics.
        $option['client_first_name'] = $this->getName($order->name)['client_first_name'];
        $option['client_last_name']  = $this->getName($order->name)['client_last_name'];
        $option['email']             = $order->email ?? '';
        $option['phone']             = $order->phone ?? '' ;

        $hash = array();
        foreach ($this->keysForSignature as $dataKey) {
            if (!isset($option[$dataKey])) {
                continue;
            }
            if (is_array($option[$dataKey])) {
                foreach ($option[$dataKey] as $v) {
                    $hash[] = $v;
                }
            } else {
                $hash [] = $option[$dataKey];
            }
        }
        $hash = implode(';', $hash);

        $option['signature'] = hash_hmac('md5', $hash, $settings['concordpay_secretkey']);

        $form = '<form method="post" action="' . $this->url . '" accept-charset="utf-8">';
        foreach ($option as $name => $value) {
            $form .= $this->print_input($name, $value);
        }

        $form .= '<input type="submit" class="btn btn-success" value="' . $button_text . '">';
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
    protected function print_input($name, $value)
    {
        $str = '';
        if (!is_array($value)) {
            return '<input type="hidden" name="' . $name . '" value="' . htmlspecialchars($value) . '">';
        }
        foreach ($value as $v => $data_key) {
            $str .= $this->print_input($name . '[' . $v .']', $data_key);
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
