{* Order page *}

{$meta_title = "Ваш заказ №`$invoice.transaction`" scope=global}

{if $invoice.status == 'approved'}
	<div class="alert alert-success mt-4" role="alert">
		<h4 class="alert-heading">Заказ успешно оплачен.</h4>
		<p><strong>Сумма:</strong> {$invoice.amount}</p>
		<hr>
		<p><strong>Ваш заказ:</strong> №{$invoice.transaction}</p>
	</div>
{else}
	<p>Описание ошибки :{$invoice.error_message}</p>
	<div class="alert alert-danger mt-4" role="alert">
		<h4 class="alert-heading">Ошибка оплаты.</h4>
		<p><strong>Код ошибки:</strong> {$invoice.error_code}</p>
		<hr>
		<p><strong>Описание ошибки:</strong> {$invoice.error_message}</p>
	</div>
{/if}