<?php

require_once 'api/Turbo.php';

class CouponAdmin extends Turbo
{
    public function fetch()
    {
        $coupon = new stdClass;

        if ($this->request->isMethod('post')) {
            $coupon->id = $this->request->post('id', 'integer');
            $coupon->code = $this->request->post('code', 'string');

            if ($this->request->post('expires')) {
                $coupon->expire = date('Y-m-d', strtotime($this->request->post('expire')));
            } else {
                $coupon->expire = null;
                $coupon->value = $this->request->post('value', 'float');
                $coupon->type = $this->request->post('type', 'string');
                $coupon->min_order_price = $this->request->post('min_order_price', 'float');
                $coupon->single = $this->request->post('single', 'float');
            }

            $a = $this->coupons->getCoupon((string) $coupon->code);

            if ($a && $a->id != $coupon->id) {
                $this->design->assign('message_error', 'code_exists');
            } elseif (empty($coupon->code)) {
                $this->design->assign('message_error', 'code_empty');
            } else {
                if (empty($coupon->id)) {
                    $coupon->id = $this->coupons->addCoupon($coupon);
                    $coupon = $this->coupons->getCoupon($coupon->id);
                    $this->design->assign('message_success', 'added');
                } else {
                    $this->coupons->updateCoupon($coupon->id, $coupon);
                    $coupon = $this->coupons->getCoupon($coupon->id);
                    $this->design->assign('message_success', 'updated');
                }
            }
        } else {
            $coupon->id = $this->request->get('id', 'integer');
            $coupon = $this->coupons->getCoupon($coupon->id);
        }

        $this->design->assign('coupon', $coupon);
        
        return $this->design->fetch('coupon.tpl');
    }
}
