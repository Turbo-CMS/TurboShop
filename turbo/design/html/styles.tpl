{if $style_file}
	{$meta_title = "`$btr->global_style` $style_file" scope=global}
{/if}

<h1 class="h3 mb-3">{$btr->global_theme|escape} {$theme}, {$btr->global_style|escape} {$style_file}</h1>

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'permissions'}
						{$btr->global_permission|escape} {$style_file}
					{elseif $message_error == 'theme_locked'}
						{$btr->global_protected|escape}
					{else}
						{$message_error|escape}
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
				{$btr->global_design_message|escape}
				{$btr->global_design_message2|escape}
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-up"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->global_styles|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<ul class="nav nav-pills">
						{foreach $styles as $s}
							<li class="nav-item">
								<a class="nav-link text-decoration-none {if $style_file == $s}active text-white{else}text-muted{/if}" aria-current="page" href="{url module=StylesAdmin file=$s}"><i class="align-middle mt-n1" data-feather="file-text"></i> {$s|escape}</a>
							</li>
						{/foreach}
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

{if $style_file}
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
					<h5 class="card-title mb-0">{$btr->global_style|escape} {$style_file|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<form>
							<textarea id="content" name="content">{$style_content|escape}</textarea>
						</form>
						<div class="row">
							<div class="col-12">
								<button type="submit" name="save" class="js-save btn btn-primary float-end mt-2">
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
{/if}

{* Codemirror *}
{css id="codemirror-css" include=[
	"turbo/design/js/codemirror/lib/codemirror.css"
]}{/css}
{stylesheet minify=true}

{if $settings->admin_theme == "dark"}
	{css id="codemirror-css" include=[
		"turbo/design/js/codemirror/theme/dark.css"
	]}{/css}
	{stylesheet minify=true}
{else}
	{css id="codemirror-css" include=[
		"turbo/design/js/codemirror/theme/style-css.css"
	]}{/css}
	{stylesheet minify=true}
{/if}

{js id="codemirror-css" priority=99 include=[
	"turbo/design/js/codemirror/lib/codemirror.js",
	"turbo/design/js/codemirror/mode/css/css.js",
	"turbo/design/js/codemirror/addon/selection/active-line.js"
]}{/js}
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
		$(function() {
			// Saving the code by ajax
			function save() {
				{/literal}
				{if $settings->admin_theme == "dark"}
					$('.CodeMirror').css('background-color', '#0e5e46');
				{else}
					$('.CodeMirror').css('background-color', '#d2f1e8');
				{/if}
				{literal}
				content = editor.getValue();
				$.ajax({
					type: 'POST',
					url: 'ajax/save_style.php',
					data: {'content': content, 'theme':'{/literal}{$theme}{literal}', 'style': '{/literal}{$style_file}{literal}', 'session_id': '{/literal}{$smarty.session.id}{literal}'},
					success: function(data) {
						$('.CodeMirror').animate({'background-color': '#eef2f4'});
					},
					dataType: 'json'
				});
			}

			// Clicked the Save button
			$('.js-save').on('click', function() {
				save();
			});

			// Processing ctrl+s
			var isCtrl = false;
			var isCmd = false;
			$(document).keyup(function(e) {
				if (e.which == 17) isCtrl = false;
				if (e.which == 91) isCmd = false;
			}).keydown(function(e) {
				if (e.which == 17) isCtrl = true;
				if (e.which == 91) isCmd = true;
				if (e.which == 83 && (isCtrl || isCmd)) {
					save();
					e.preventDefault();
				}
			});
		});
	</script>
	<script>
		var editor = CodeMirror.fromTextArea(document.getElementById("content"), {
			mode: "css",
			lineNumbers: true,
			styleActiveLine: true,
			matchBrackets: false,
			enterMode: 'keep',
			indentWithTabs: false,
			indentUnit: 1,
			tabMode: 'classic',
			{/literal}{if $settings->admin_theme == "dark"}theme: 'dark'{else}theme: 'style-css'{/if}{literal}
		});
	</script>
{/literal}