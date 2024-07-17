{if $orders}
    <div class="personal__block personal__block--orders">
        <div class="orders--main__wrap">
            <div class="orders--main">
                <div class="js_append ajax_load list grid-list grid-list--items-1">
                    {foreach $orders as $order}
                        {if $order->status != 3}
                            <div class="orders__order__wrapper grid-list__item grid-list-border-outer">
                                <div class="orders__order outer-rounded-x bordered shadow-hovered shadow-hovered-f600 shadow-no-border-hovered color-theme-parent-all">
                                    <a class="item-link-absolute" href="{$lang_link}order/{$order->url}" title="{$lang->order_from} {$order->date|date}"></a>
                                    <div class="orders__order__inner">
                                        <div class="orders__order__body">
                                            <div class="orders__order__body-left">
                                                <div class="orders__order__tds">
                                                    <div class="orders__order__title">
                                                        <a href="{$lang_link}order/{$order->url}" class="dark_link color-theme-target">{$lang->order_from} {$order->date|date}</a>
                                                    </div>
                                                    <div class="orders__order__nps">
                                                        <div class="orders__order__number">
                                                            №{$order->id}
                                                        </div>
                                                        {if $order->paid == 1}
                                                            <div class="order__pay-status personal-color--green">
                                                                {$lang->paid}
                                                            </div>
                                                        {/if}
                                                        {if $order->status == 0}
                                                            <div class="order__pay-status personal-color--red">
                                                                {$lang->waiting_processing}
                                                            </div>
                                                        {elseif $order->status == 1}
                                                            <div class="order__pay-status personal-color--red">
                                                                {$lang->in_processing}
                                                            </div>
                                                        {elseif $order->status == 2}
                                                            <div class="order__pay-status personal-color--red">
                                                                {$lang->completed}
                                                            </div>
                                                        {/if}
                                                    </div>
                                                </div>
                                                <div class="orders__order__sp__wrapper">
                                                    <div class="orders__order__sp">
                                                        <div class="order__status order__status--simple xpopover-toggle" data-xpopover="{literal}{&quot;trigger&quot;:[&quot;hover&quot;,&quot;click&quot;],&quot;offset&quot;:&quot;-15px,-5px&quot;}{/literal}">
                                                            <div class="order__status__text flexbox flexbox--row flexbox--align-center">
                                                                <div class="order__status__icon">
                                                                    <i class="svg inline status fill-theme" aria-hidden="true">
                                                                        <svg width="16" height="16">
                                                                            <use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#simple-16-16"></use>
                                                                        </svg>
                                                                    </i>
                                                                </div>
                                                                <span class="order__status__value dark_link dotted">
                                                                    {if $order->status == 0}{$lang->accepted_name}{elseif $order->status == 1}{$lang->in_processing_name}{elseif $order->status == 2}{$lang->completed_name}{/if}{if $order->paid == 1}, {$lang->paid}{else}, {$lang->payment_awaited}{/if}
                                                                </span>
                                                            </div>
                                                            <div class="order__status__steps">
                                                                <div class="order__status__step {if $order->status == 0}mark{/if}"></div>
                                                                <div class="order__status__step {if $order->status == 1}mark{/if}"></div>
                                                                <div class="order__status__step {if $order->status == 2}mark{/if}"></div>
                                                            </div>
                                                            <template class="xpopover-template">
                                                                <div class="scrollbar">
                                                                    <div class="xpopover-content">
                                                                        <div class="xpopover--order-status xpopover--order-status--simple">
                                                                            <div class="xpopover--order-status__steps">
                                                                                <div class="xpopover--order-status__step {if $order->status == 0}mark{/if}">
                                                                                    <div class="xpopover--order-status__step-progress">
                                                                                        <div class="xpopover--order-status__step-progress__dot">
                                                                                            <i class="svg inline status-dot" aria-hidden="true">
                                                                                                <svg width="16" height="16">
                                                                                                    <use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#dot-16-16"></use>
                                                                                                </svg>
                                                                                            </i>
                                                                                        </div>
                                                                                        <div class="xpopover--order-status__step-progress__line"></div>
                                                                                    </div>
                                                                                    <div class="xpopover--order-status__step-info">
                                                                                        <div class="xpopover--order-status__step-name">{$lang->accepted_name}{if $order->paid == 1}, {$lang->paid}{else}, {$lang->payment_awaited}{/if}</div>
                                                                                        <div class="xpopover--order-status__step-dsc font_14 color_999">{$lang->accepted_text}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="xpopover--order-status__step {if $order->status == 1}mark{/if}">
                                                                                    <div class="xpopover--order-status__step-progress">
                                                                                        <div class="xpopover--order-status__step-progress__dot">
                                                                                            <i class="svg inline status-dot" aria-hidden="true">
                                                                                                <svg width="16" height="16">
                                                                                                    <use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#dot-16-16"></use>
                                                                                                </svg>
                                                                                            </i>
                                                                                        </div>
                                                                                        <div class="xpopover--order-status__step-progress__line"></div>
                                                                                    </div>
                                                                                    <div class="xpopover--order-status__step-info">
                                                                                        <div class="xpopover--order-status__step-name">{$lang->in_processing_name}</div>
                                                                                        <div class="xpopover--order-status__step-dsc font_14 color_999">{$lang->in_processing_text}</div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="xpopover--order-status__step {if $order->status == 2}mark{/if}">
                                                                                    <div class="xpopover--order-status__step-progress">
                                                                                        <div class="xpopover--order-status__step-progress__dot">
                                                                                            <i class="svg inline status-dot" aria-hidden="true">
                                                                                                <svg width="16" height="16">
                                                                                                    <use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/status.svg#dot-16-16"></use>
                                                                                                </svg>
                                                                                            </i>
                                                                                        </div>
                                                                                        <div class="xpopover--order-status__step-progress__line"></div>
                                                                                    </div>
                                                                                    <div class="xpopover--order-status__step-info">
                                                                                        <div class="xpopover--order-status__step-name">{$lang->completed_name}</div>
                                                                                        <div class="xpopover--order-status__step-dsc font_14 color_999">{$lang->completed_text}</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </template>
                                                        </div>
                                                    </div>
                                                    <div class="price color_222">
                                                        <div class="line-block line-block--6 line-block--align-baseline line-block--flex-wrap">
                                                            <div class="line-block__item">
                                                                <div class="price__new">
                                                                    <span class="price__new-val font_18">
                                                                        {$order->total_price|convert} {$currency->sign}
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="orders__order__body-right">
                                                <div class="orders__order__products">
                                                    {foreach $order->purchases|@array_slice:0:3 as $purchase}
                                                        <div class="orders__order__product">
                                                            <a href="{$lang_link}products/{$purchase->product->url}" target="_blank">
                                                                {if isset($purchase->product->images)}
                                                                    {$image = $purchase->product->images|first}
                                                                    <img class="img-responsive lazyload" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="{$image->filename|resize:56:56}" alt="{$purchase->product->name|escape}" title="{$purchase->product->name|escape}" />
                                                                {else}
                                                                    <img class="img-responsive lazyload" style="width: 56px; height: 56px;" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="design/{$settings->theme|escape}/images/no-photo.svg" alt="{$purchase->product->name|escape}" title="{$purchase->product->name|escape}" />
                                                                {/if}
                                                            </a>
                                                        </div>
                                                    {/foreach}
                                                    {if $order->purchases|count > 3}
                                                        <div class="orders__order__cnt-more-products">+{$order->purchases|count - 3}</div>
                                                    {/if}
                                                </div>
                                                <div class="orders__order__buttons">
                                                    <div class="line-block line-block--8-vertical flexbox--direction-column line-block--align-normal">
                                                        <div class="line-block__item">
                                                            <a href="{$lang_link}order/{$order->url}" class="btn btn-default btn-sm btn-wide">{$lang->view_order}</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
{else}
    <div class="alert alert-info">
        {$lang->no_orders}
    </div>
{/if}