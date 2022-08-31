{if $language->id}
	{$meta_title = $language->name scope=global}
{else}
	{$meta_title = $btr->language_new scope=global}
{/if}
{*Page name*}
<div class="row">
	<div class="col-lg-6 col-md-6">
		{if !$language->id}
			<div class="heading_page">{$btr->language_add|escape}</div>
		{else}
			<div class="heading_page">{$language->name|escape}</div>
		{/if}
	</div>
	<div class="col-lg-4 col-md-3 text-xs-right float-xs-right"></div>
</div>
{*Output successful messages*}
{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					<span class="text">
						{if $message_success == 'added'}
							{$btr->language_added|escape}
						{elseif $message_success == 'updated'}
							{$btr->language_updated|escape}
						{/if}
					</span>
					{if $smarty.get.return}
						<a class="btn btn_return float-xs-right" href="{$smarty.get.return}">
							{include file='svg_icon.tpl' svgId='return'}
							<span>{$btr->general_back|escape}</span>
						</a>
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}
{*Error output*}
{if $message_error}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_warning">
				<div class="heading_box">
					{if $message_error == 'label_empty'}
						{$btr->language_empty_label|escape}
					{elseif $message_error == 'label_exists'}
						{$btr->language_used|escape}
					{/if}
				</div>
			</div>
		</div>
	</div>
{/if}
{if $message_success !== 'added'}
	{*Main page form*}
	<form method="post" enctype="multipart/form-data">
		<input type="hidden" name="session_id" value="{$smarty.session.id}">
		<input type="hidden" name="id" value="{$language->id|escape}" />
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="boxed fn_toggle_wrap ">
					<div class="heading_box">
						{if !$language->id}
							{$btr->general_languages|escape}
						{else}
							{$btr->language_translations|escape}
						{/if}
						<div class="toggle_arrow_wrap fn_toggle_card text-primary">
							<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
						</div>
					</div>
					<div class="toggle_body_wrap on fn_card">
						<div class="row">
							{if !$language->id}
								<div class="col-md-6">
									<div class="heading_label">{$btr->language_select|escape} </div>
									<div class="">
										<select name="lang" class="selectpicker" data-live-search="true" data-width="fit">
											{foreach $lang_list as $lang}
												<option value='{$lang->label}' {if $settings->lang==$label}selected{/if} data-content='<span class="flag-icon flag-icon-{$lang->label}"></span> {$lang->name|escape} [{$lang->label|escape}]'>{$lang->name|escape} [{$lang->label|escape}]</option>
											{/foreach}
										</select>
									</div>
								</div>
							{/if}
							<div class="col-md-6 mt-1">
								<div class="float-md-right">
									<div class="activity_of_switch">
										<div class="activity_of_switch_item">
											<div class="turbo_switch clearfix">
												<label class="switch_label text_500 font_14 text_grey mx-h">{$btr->general_enable|escape}</label>
												<div class="form-check form-switch">
													<input class="form-check-input" id="enabled_checkbox" name="enabled" value="1" type="checkbox" {if $lang->enabled}checked="" {/if}>
													<label class="form-check-label" for="enabled_checkbox"></label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 mt-1">
								<button type="submit" class="btn btn_small btn-primary float-md-right">
									{include file='svg_icon.tpl' svgId='checked'}
									<span>{$btr->general_apply|escape}</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
{/if}
{* Flag icon *}
{css id="flag" include=[
"turbo/design/css/flag-icon.min.css"
]}{/css}
{stylesheet minify=true}