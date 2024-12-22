{if $label->id}
	{$meta_title = $label->name scope=global}
{else}
	{$meta_title =$btr->orders_new_label scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if $label->id}
			{$btr->orders_label|escape}: {$label->name|escape}
		{else}
			{$btr->orders_new_label|escape}
		{/if}
	</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->orders_added_label|escape}
					{elseif $message_success == 'updated'}
						{$btr->orders_updated_label|escape}
					{/if}
					{if $smarty.get.return}
						<a class="alert-link fw-normal btn-return text-decoration-none me-5" href="{$smarty.get.return}">
							<i class="align-middle mt-n1" data-feather="corner-up-left"></i>
							{$btr->global_back|escape}
						</a>
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form class="js-form-list" enctype="multipart/form-data" method="post">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_title|escape}</div>
								<input class="form-control" name="name" type="text" value="{$label->name|escape}">
								<input name="id" type="hidden" value="{$label->id|escape}">
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_color|escape}</div>
								<div id="cp" class="input-group color-picker">
									<input type="text" name="color" value="{$label->color|escape}" class="form-control">
									<span class="input-group-text add-on"><i></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="d-grid d-sm-block mt-1">
				<button type="submit" class="btn btn-primary float-end">
					<i class="align-middle" data-feather="check"></i>
					<span>{$btr->global_apply|escape}</span>
				</button>
			</div>
		</div>
	</div>
</form>

{* Colorpicker *}
{css id="colorpicker" include=["turbo/design/js/colorpicker/css/bootstrap-colorpicker.min.css"]}{/css}
{stylesheet minify=true}

{js id="colorpicker" priority=99 include=["turbo/design/js/colorpicker/js/bootstrap-colorpicker.min.js"]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(function() {
			$('#cp').colorpicker({
				colorSelectors: {
					'primary': '#3b7ddd',
					'secondary': '#6c757d',
					'success': '#1cbb8c',
					'info': '#17a2b8',
					'warning': '#fcb92c',
					'danger': '#dc3545',
					'dark': '#212529',
					'purple': '#6f42c1',
					'pink': '#e83e8c',
				},
				format: "hex"
			});
		});
	</script>
	<style>
		.colorpicker-element .add-on i:before {
			content: "";
			position: absolute;
			width: 16px;
			height: 16px;
			display: inline-block;
			vertical-align: text-top;
			margin-left: -8px;
			background: linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1) 0), linear-gradient(45deg, rgba(0, 0, 0, 0.1) 25%, transparent 25%, transparent 75%, rgba(0, 0, 0, 0.1) 75%, rgba(0, 0, 0, 0.1) 0), white;
			background-size: 10px 10px;
			background-position: 0 0, 5px 5px;
		}

		.colorpicker-element .add-on i[style*="background-color"]::before {
			content: none;
		}
	</style>
{/literal}