{if $template_file}
	{$meta_title = "`$btr->general_template` $template_file" scope=global}
{/if}

<div class="row">
	<div class="col-lg-10 col-md-10">
		<div class="wrap_heading">
			<div class="box_heading heading_page">
				{$btr->general_theme|escape} {$theme}, {$btr->general_template|escape} {$template_file}
			</div>
		</div>
	</div>
	<div class="col-md-2 col-lg-2 col-sm-12 float-xs-right"></div>
</div>

{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div>
					{if $message_error == 'permissions'}
						{$btr->general_permission|escape} {$template_file}
					{elseif $message_error == 'theme_locked'}
						{$btr->general_protected|escape}
					{else}
						{$message_error|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="boxed boxed_attention">
			<div>
				{$btr->general_design_message|escape}
				{$btr->general_design_message2|escape}
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12 col-md-12">
		<div class="boxed match fn_toggle_wrap tabs">
			<div class="design_tabs">
				<div class="design_navigation">
					<a class="design_navigation_link {if $current_dir == "html"}focus{/if}" href='{url module=TemplatesAdmin  file=null email=null}'>{$btr->general_template|escape}</a>
				</div>
				<div class="design_container">
					{foreach $templates as $t}
						<a class="design_tab {if $template_file == $t}focus{/if}" href='{url module=TemplatesAdmin file=$t}'>{$t|escape}</a>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
</div>

{if $template_file}
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap min_height_230px">
				<div class="heading_box">{$btr->general_template|escape} {$template_file}</div>
				<form>
					<textarea id="template_content" name="template_content" style="width:700px;height:500px;">{$template_content|escape}</textarea>
				</form>
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<button type="submit" name="save" class="fn_save btn btn_small btn-primary float-md-right">
							{include file='svg_icon.tpl' svgId='checked'}
							<span>{$btr->general_apply|escape}</span>
						</button>
					</div>
				</div>

			</div>
		</div>
	</div>
{/if}

{* We connect the code editor *}
{* Codemirror *}
{css id="codemirror-html" include=[
"turbo/design/js/codemirror/lib/codemirror.css",
"turbo/design/js/codemirror/theme/style.css"
]}{/css}
{stylesheet minify=true}

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
	<style type="text/css">
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

		.cm-s-style .cm-smarty.cm-tag{color: #ff008a;}
		.cm-s-style .cm-smarty.cm-operator{color: #ff008a;}
		.cm-s-style .cm-smarty.cm-string {color: #007000;}
		.cm-s-style .cm-smarty.cm-variable {color: #ff008a;}
		.cm-s-style .cm-smarty.cm-variable-2 {color: #cc006e;}
		.cm-s-style .cm-smarty.cm-variable-3 {color: #ff008a;}
		.cm-s-style .cm-smarty.cm-property {color: #ff008a;}
		.cm-s-style .cm-comment {color: #505050;}
		.cm-s-style .cm-smarty.cm-attribute {color: #ff20Fa;}
		.cm-s-style .cm-smarty.cm-qualifier {color: #ff008a;}
		.cm-s-style .cm-smarty.cm-number {color: #ff008a;}
		.cm-s-style .cm-smarty.cm-keyword {color: #ff008a;}
		.cm-s-style .cm-smarty.cm-string {color: #708;}
		.cm-s-style .cm-tag-smarty{color: #ff008a;}
	</style>

	<script>
		$(function() {
			// Saving the code by ajax
			function save() {
				$('.CodeMirror').css('background-color', '#e0ffe0');
				content = editor.getValue();
				$.ajax({
					type: 'POST',
					url: 'ajax/save_template.php',
					data: {'content': content, 'theme':'{/literal}{$theme}{literal}', 'template': '{/literal}{$template_file}{literal}', 'session_id': '{/literal}{$smarty.session.id}{literal}'},
					success: function(data) {
						$('.CodeMirror').animate({'background-color': '#eef2f4'},500);
					},
					dataType: 'json'
				});
			}
			// Clicked the Save button
			$('.fn_save').on('click', function() {
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
{/literal}

{literal}
	<script>
		var editor = CodeMirror.fromTextArea(document.getElementById("template_content"), {
			mode: "smartymixed",
			lineNumbers: true,
			styleActiveLine: true,
			matchBrackets: false,
			enterMode: 'keep',
			indentWithTabs: false,
			indentUnit: 2,
			tabMode: 'classic',
			theme: 'style'

		});
	</script>
{/literal}