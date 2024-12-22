{$meta_title = $btr->robots_file scope=global}

<h1 class="h3 mb-3">{$btr->robots_file|escape}</h1>

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'write_error'}
						{$btr->robots_permissions|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'updated'}
						{$btr->robots_updated|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="row">
	<div class="col-12">
		<div class="alert alert-primary alert-dismissible fade show" role="alert">
			<div class="alert-message">
				{$btr->robots_message|escape}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</div>
	</div>
</div>

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card mh-230px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">robots.txt</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<textarea id="robots" class="d-none" name="robots">{$robots_txt|escape}</textarea>
						<div class="row">
							<div class="col-12">
								<button type="submit" class="btn btn-primary float-end mt-2">
									<i class="align-middle" data-feather="check"></i>
									<span>{$btr->global_apply|escape}</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

{* Codemirror *}
{css id="codemirror-css" include=["turbo/design/js/codemirror/lib/codemirror.css"]}{/css}
{stylesheet minify=true}

{if $settings->admin_theme == "dark"}
	{css id="codemirror-css" include=["turbo/design/js/codemirror/theme/dark.css"]}{/css}
	{stylesheet minify=true}
{else}
	{css id="codemirror-css" include=["turbo/design/js/codemirror/theme/light.css"]}{/css}
	{stylesheet minify=true}
{/if}

{js id="codemirror-robot" priority=99 include=["turbo/design/js/codemirror/lib/codemirror.js"]}{/js}
{javascript minify=true}

{literal}
	<style>
		.CodeMirror {
			font-family: 'Courier New';
			margin-bottom: 10px;
			background-color: #ffffff;
			height: auto;
			min-height: 100px;
			width: 100%;
		}

		.CodeMirror-scroll {
			overflow-y: hidden;
			overflow-x: auto;
		}
	</style>
	<script>
		var editor = CodeMirror.fromTextArea(document.getElementById("robots"), {
			mode: "mixed",
			lineNumbers: true,
			styleActiveLine: true,
			matchBrackets: false,
			enterMode: 'keep',
			indentWithTabs: false,
			indentUnit: 1,
			tabMode: 'classic',
		{/literal}
		{if $settings->admin_theme == "dark"}theme: 'dark'
		{else}theme: 'light'
		{/if}
		{literal}
		});
	</script>
{/literal}