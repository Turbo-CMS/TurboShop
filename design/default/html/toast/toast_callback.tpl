{* Toast Callback *}
<div class="position-fixed top-0 start-50 translate-middle-x p-3 mt-5" style="z-index: 1060">
	<div id="callbackToast" class="toast fade hide align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex">
			<div class="toast-body">
				{$lang->message_sent|escape}
			</div>
			<button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
</div>