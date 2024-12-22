{* Subscribe Toast *}
<div class="position-fixed bottom-0 start-50 translate-middle-x p-3 mb-5 mb-lg-0" style="z-index: 1060">
	<div id="subscribe" class="toast fade hide align-items-center {if $subscribe_error}bg-danger-subtle{/if} {if $subscribe_success}bg-success-subtle{/if} border-0" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex">
			<div class="toast-body">
				{if $subscribe_error}
					{if $subscribe_error == 'email_exist'}
						{$lang->already_subscribe|escape}
					{/if}
					{if $subscribe_error == 'empty_email'}
						{$lang->enter_your_email|escape}
					{/if}
				{/if}
				{if $subscribe_success}
					{$lang->success_subscribe|escape}
				{/if}
			</div>
			<button type="button" class="btn-close btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
</div>