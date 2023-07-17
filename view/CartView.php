<?php

require_once 'View.php';

class CartView extends View
{
    public function __construct()
    {
        parent::__construct();

        if ($variantId = $this->request->get('variant', 'integer')) {
            $this->cart->addItem($variantId, $this->request->get('amount', 'integer'));
            header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
        }

        if ($deleteVariantId = (int) $this->request->get('delete_variant')) {
            $this->cart->deleteItem($deleteVariantId);

            if (!isset($_POST['submit_order']) || $_POST['submit_order'] != 1) {
                header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
            }
        }

        if ($this->request->get('empty')) {
            $this->cart->emptyCart();
            header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
        }

        if (isset($_POST['checkout'])) {
            $order = new stdClass();

            $order->delivery_id = $this->request->post('delivery_id', 'integer');
            $order->payment_method_id = $this->request->post('payment_method_id', 'integer');
            $order->name = $this->request->post('name');
            $order->email = $this->request->post('email');
            $order->address = $this->request->post('address');
            $order->phone = $this->request->post('phone');
            $order->comment = $this->request->post('comment');
            $order->ip = $_SERVER['REMOTE_ADDR'];

            $this->design->assign('delivery_id', $order->delivery_id);
            $this->design->assign('name', $order->name);
            $this->design->assign('email', $order->email);
            $this->design->assign('phone', $order->phone);
            $this->design->assign('address', $order->address);

            $captchaCode =  $this->request->post('captcha_code', 'string');

            $cart = $this->cart->getCart();
            $order->discount = $cart->discount;
            $order->weight = $cart->total_weight;

            if ($cart->coupon) {
                $order->coupon_discount = $cart->coupon_discount;
                $order->coupon_code = $cart->coupon->code;
            }

            if (!empty($this->user->id)) {
                $order->user_id = $this->user->id;
            }

            if (empty($order->name)) {
                $this->design->assign('error', 'empty_name');
            } elseif (empty($order->email)) {
                $this->design->assign('error', 'empty_email');
            } elseif ($this->settings->captchaCart && (($_SESSION['captcha_cart'] != $captchaCode || empty($captchaCode)) || empty($_SESSION['captcha_cart']))) {
                $this->design->assign('error', 'captcha');
            } else {
                $orderId = $this->orders->addOrder($order);
                $_SESSION['order_id'] = $orderId;

                if ($cart->coupon) {
                    $this->coupons->updateCoupon($cart->coupon->id, ['usages' => $cart->coupon->usages + 1]);
                }

                foreach ($this->request->post('amounts') as $variantId => $amount) {
                    $this->orders->addPurchase(['order_id' => $orderId, 'variant_id' => (int) $variantId, 'amount' => (int) $amount]);
                }

                $order = $this->orders->getOrder($orderId);
                $delivery = $this->delivery->getDelivery($order->delivery_id);

                if (!empty($delivery) && isset($delivery->free_from) && isset($delivery->total_price) && $delivery->free_from > $order->total_price) {
                    $this->orders->updateOrder($order->id, ['delivery_price' => $delivery->price, 'separate_delivery' => $delivery->separate_payment]);
                }

                $this->notify->emailOrderUser($order->id);
                $this->notify->emailOrderAdmin($order->id);

                if ($this->settings->tg_notify == 1) {
                    $this->tgnotify->message($order->id);
                }

                $this->cart->emptyCart();

                header('Location: ' . $this->config->root_url . '/' . $this->language->label . '/order/' . $order->url);
            }
        } else {

            if ($amounts = $this->request->post('amounts')) {
                foreach ($amounts as $variantId => $amount) {
                    $this->cart->updateItem($variantId, $amount);
                }

                $couponCode = trim($this->request->post('coupon_code', 'string'));

                if (empty($couponCode)) {
                    $this->cart->applyCoupon('');
                    header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
                } else {
                    $coupon = $this->coupons->getCoupon((string)$couponCode);

                    if (empty($coupon) || !$coupon->valid) {
                        $this->cart->applyCoupon($couponCode);
                        $this->design->assign('coupon_error', 'invalid');
                    } else {
                        $this->cart->applyCoupon($couponCode);
                        header('location: ' . $this->config->root_url . '/' . $this->language->label . '/cart/');
                    }
                }
            }
        }
    }

    public function fetch()
    {
        $deliveries = $this->delivery->getDeliveries(['enabled' => 1]);
        $this->design->assign('deliveries', $deliveries);
        $paymentMethods = $this->payment->getPaymentMethods(['enabled' => 1]);
        $this->design->assign('payment_methods', $paymentMethods);
        $this->design->assign('all_currencies', $this->money->getCurrencies());

        if ($this->user) {
            $lastOrder = $this->orders->getOrders(['user_id' => $this->user->id, 'limit' => 1]);
            $lastOrder = reset($lastOrder);

            if ($lastOrder) {
                $this->design->assign('name', $lastOrder->name);
                $this->design->assign('email', $lastOrder->email);
                $this->design->assign('phone', $lastOrder->phone);
                $this->design->assign('address', $lastOrder->address);
            } else {
                $this->design->assign('name', $this->user->name);
                $this->design->assign('email', $this->user->email);
                $this->design->assign('phone', $this->user->phone);
                $this->design->assign('address', $this->user->address);
            }
        }

        if ($this->coupons->countCoupons(['valid' => 1]) > 0) {
            $this->design->assign('coupon_request', true);
        }

        return $this->design->fetch('cart.tpl');
    }
}
