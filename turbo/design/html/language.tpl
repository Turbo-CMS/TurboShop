{if $language->id}
	{$meta_title = $language->name scope=global}
{else}
	{$meta_title = $btr->language_new scope=global}
{/if}

<h1 class="mb-3">
	{if !$language->id}
		{$btr->language_add|escape}
	{else}
		{$language->name|escape}
	{/if}
</h1>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->language_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->language_updated|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'label_empty'}
						{$btr->language_empty_label|escape}
					{elseif $message_error == 'label_exists'}
						{$btr->language_used|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<input type="hidden" name="id" value="{$language->id|escape}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->language_select|escape}</div>
								<select name="lang" class="selectpicker" data-live-search="true" data-width="fit">
									{foreach $lang_list as $lang}
										<option value="{$lang->label}" {if isset($language->label) && $lang->label == $language->label}selected=""{/if} data-content='<span class="flag-icon flag-icon-{$lang->label}"></span> {$lang->name|escape} [{$lang->label|escape}]'>{$lang->name|escape} [{$lang->label|escape}]</option>
									{/foreach}
								</select>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="enabled" name="enabled" value="1" type="checkbox" {if isset($language->enabled) && $language->enabled}checked=""{/if}>
									<label class="form-check-label ms-2" for="enabled">{$btr->global_enable|escape}</label>
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
			<div class="d-grid d-sm-block mt-3">
				<button type="submit" class="btn btn-primary float-end">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>

{* Flag icon *}
{css id="flag" include=[
	"turbo/design/css/flag-icon.min.css"
]}{/css}
{stylesheet minify=true}