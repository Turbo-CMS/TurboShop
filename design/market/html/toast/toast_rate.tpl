{* Toast Rate Danger *}
<div class="toast-container position-fixed bottom-0 start-50 translate-middle-x p-3 mb-5 mb-lg-0">
	<div id="rate-danger" class="toast fade hide align-items-center bg-danger-subtle border-0" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex">
			<div class="toast-body">
				{$lang->already_voted|escape}
			</div>
			<button type="button" class="btn-close btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
</div>

{* Toast Rate Success *}
<div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3 mb-5 mb-lg-0">
	<div id="rate" class="toast fade hide align-items-center text-white bg-success-subtle border-0" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex">
			<div class="toast-body">
				{$lang->vote_counted|escape}
			</div>
			<button type="button" class="btn-close btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
	</div>
</div>