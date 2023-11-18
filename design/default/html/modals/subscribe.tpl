{* Subscribe Toast *}
<div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
	<div id="subscribe" class="toast fade hide align-items-center text-white {if isset($subscribe_error)}bg-danger{/if} {if isset($subscribe_success)}bg-success{/if} border-0" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex">
			<div class="toast-body">
				{if isset($subscribe_error)}
					{if $subscribe_error == 'email_exist'}
						{$lang->already_subscribe}
					{/if}
					{if $subscribe_error == 'empty_email'}
						{$lang->enter_your_email}
					{/if}
				{/if}
				{if isset($subscribe_success)}
					{$lang->success_subscribe}
				{/if}
			</div>
			<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
</div>