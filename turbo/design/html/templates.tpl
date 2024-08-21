{if $template_file}
	{$meta_title = "`$btr->global_template` $template_file" scope=global}
{/if}

<h1 class="h3 mb-3">{$btr->global_theme|escape} {$theme}, {$btr->global_folder|escape} {if isset($smarty.get.dir)}{$smarty.get.dir}{else}html{/if}, {$btr->global_template|escape} {$template_file}</h1>

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'permissions'}
						{$btr->global_permission|escape} {$template_file}
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

<nav aria-label="breadcrumb">
	<ol class="breadcrumb mb-3">
		<li class="breadcrumb-item"><a href="{url module=TemplatesAdmin file=null dir=null}" class="text-decoration-none text-muted">
				<i class="align-middle text-warning mt-n1" data-feather="folder"></i>
				html
			</a>
		</li>
		{if isset($smarty.get.dir) && !$template_file}
			<li class="breadcrumb-item active">
				{$smarty.get.dir}
			</li>
		{elseif isset($smarty.get.dir) && $template_file}
			<li class="breadcrumb-item active">
				<a href="/turbo/index.php?module=TemplatesAdmin&dir={$smarty.get.dir}" class="text-decoration-none text-muted">
					<i class="align-middle text-warning mt-n1" data-feather="folder"></i>
					{$smarty.get.dir}
				</a>
			</li>
			<li class="breadcrumb-item active">
				<i class="align-middle mt-n1" data-feather="file-text"></i> {$template_file}
			</li>
		{elseif $template_file}
			<li class="breadcrumb-item active">
				<i class="align-middle mt-n1" data-feather="file-text"></i> {$template_file}
			</li>
		{/if}
	</ol>
</nav>

{if $folders}
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
					<h5 class="card-title mb-0">{$btr->global_folders|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="nav nav-pills">
							{foreach $folders as $f}
								<li class="nav-item">
									<a class="nav-link text-decoration-none {if $f == $dir}active text-white{else}text-muted{/if}" aria-current="page" href="{url module=TemplatesAdmin file=null dir=$f}">
										<i class="align-middle {if $f != $dir}text-warning{/if} mt-n1" data-feather="folder"></i>
										{$f|escape}
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}

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
				<h5 class="card-title mb-0">{$btr->global_templates|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<ul class="nav nav-pills">
						{foreach $templates as $t}
							<li class="nav-item">
								<a class="nav-link text-decoration-none {if $template_file == $t}active text-white{else}text-muted{/if}" aria-current="page" href="{url module=TemplatesAdmin file=$t}">
									<i class="align-middle mt-n1" data-feather="file-text"></i>
									{$t|escape}
								</a>
							</li>
						{/foreach}
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

{if $template_file}
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
					<h5 class="card-title mb-0">{$btr->global_template|escape} {$template_file}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<form>
							<textarea id="content" class="d-none" name="content">{$template_content|escape}</textarea>
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
{css id="codemirror-html" include=["turbo/design/js/codemirror/lib/codemirror.css"]}{/css}
{stylesheet minify=true}

{if $settings->admin_theme == "dark"}
	{css id="codemirror-html" include=["turbo/design/js/codemirror/theme/dark.css"]}{/css}
	{stylesheet minify=true}
{else}
	{css id="codemirror-html" include=["turbo/design/js/codemirror/theme/light.css"]}{/css}
	{stylesheet minify=true}
{/if}

{js id="codemirror-html" priority=99 include=[
	"turbo/design/js/codemirror/lib/codemirror.js",
	"turbo/design/js/codemirror/mode/smarty/smarty.js",
	"turbo/design/js/codemirror/mode/smartymixed/smartymixed.js",
	"turbo/design/js/codemirror/mode/xml/xml.js",
	"turbo/design/js/codemirror/mode/htmlmixed/htmlmixed.js",
	"turbo/design/js/codemirror/mode/css/css.js",
	"turbo/design/js/codemirror/mode/javascript/javascript.js",
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
			min-height: 300px;
			width: 100%;
		}

		.CodeMirror-scroll {
			overflow-y: hidden;
			overflow-x: auto;
		}
	</style>

	<script>
		$(function() {
			function save() {
			{/literal}
			{if $settings->admin_theme == "dark"}
				$('.CodeMirror').css('background-color', '#223b3c');
			{else}
				$('.CodeMirror').css('background-color', '#d2f1e8');
			{/if}
			{literal}
				content = editor.getValue();
				$.ajax({
					type: 'POST',
					url: 'ajax/save_template.php',
					data: {'content': content, 'theme':'{/literal}{$theme}{literal}', 'template': '{/literal}{$template_file}{literal}', 'dir': '{/literal}{$dir}{literal}', 'session_id': '{/literal}{$smarty.session.id}{literal}'},
					success: function(data) {
						$('.CodeMirror').animate({'background-color': '#eef2f4'},500);
					},
					dataType: 'json'
				});
			}

			$('.js-save').on('click', function() {
				save();
			});

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
{/literal}
{literal}
	<script>
		var editor = CodeMirror.fromTextArea(document.getElementById("content"), {
			mode: "smartymixed",
			lineNumbers: true,
			styleActiveLine: true,
			matchBrackets: false,
			enterMode: 'keep',
			indentWithTabs: false,
			indentUnit: 2,
			tabMode: 'classic',
			{/literal}{if $settings->admin_theme == "dark"}theme: 'dark'{else}theme: 'light'{/if}{literal}
			});
	</script>
{/literal}