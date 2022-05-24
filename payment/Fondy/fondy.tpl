{* Order page *}

{$meta_title = "Your order №`$invoice.transaction`" scope=parent}

{if $invoice.status == 'approved'}
	<H1>The order has been successfully paid.</H1>
	<p>Sum: {$invoice.amount}</p>
	<br>
	<p>Your order №:{$invoice.transaction}</p>
	<br>
{else}
	<H1>Payment error.</H1>
	<p>Error code: {$invoice.error_code}</p>
	<br>
<p>Error description: {$invoice.error_message}</p>
{/if}


