{* Cart Toast *}
<div class="position-fixed bottom-0 start-50 translate-middle-x p-3 mb-5 mb-lg-0" style="z-index: 1060">
	<div id="toastCart" class="toast fade hide align-items-center bg-success-subtle border-0" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="d-flex">
			<div class="toast-body">
				{$lang->product_added|escape}
			</div>
			<button type="button" class="btn btn-link me-2 m-auto text-decoration-none" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">{$lang->global_open|escape}</button>
		</div>
	</div>
</div>