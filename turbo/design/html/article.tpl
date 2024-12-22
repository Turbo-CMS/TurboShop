{if $post->id}
	{$meta_title = $post->name scope=global}
{else}
	{$meta_title = $btr->new_article scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{if !$post->id}
			{$btr->add_article|escape}
		{else}
			{$post->name|escape}
		{/if}
	</h1>
	{if $post->id}
		<div class="d-grid gap-2 d-sm-block mt-2 mt-md-0">
			<a class="btn btn-primary" target="_blank" href="../{$lang_link}article/{$post->url}">
				<i class="align-middle mt-n1" data-feather="external-link"></i>
				{$btr->global_open|escape}
			</a>
		</div>
	{/if}
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->post_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->post_updated|escape}
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

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'url_exists'}
						{$btr->post_exists|escape}
					{elseif $message_error=='empty_name'}
						{$btr->global_enter_name|escape}
					{elseif $message_error == 'empty_url'}
						{$btr->global_enter_url|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="translate-container mb-3">
								<div class="form-label">{$btr->global_title|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<input class="form-control translate-input" name="name" type="text" value="{$post->name|escape}">
								<input name="id" type="hidden" value="{$post->id|escape}">
							</div>
							<div class="translate-container mb-3">
								<div class="form-label">{$btr->global_author|escape} <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<input class="js-author-complite form-control translate-input" name="author" type="text" value="{$post->author|escape}">
							</div>
							<div class="row">
								<div class="col-12 col-lg-6 col-md-10">
									<div class="mt-2 mb-3 mb-h">
										<div class="input-group">
											<span class="input-group-text">URL</span>
											<input name="url" class="js-meta-field form-control js-url {if $post->id}js-disabled{/if}" type="text" value="{$post->url|escape}" {if $post->id}readonly=""{/if}>
											<input type="checkbox" id="block-translit" class="d-none" value="1" {if $post->id}checked=""{/if}>
											<span class="input-group-text js-disable-url">
												{if $post->id}
													<i class="url-lock"></i>
												{else}
													<i class="url-lock url-unlock"></i>
												{/if}
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="visible" name="visible" value="1" type="checkbox" {if $post->visible}checked=""{/if}>
									<label class="form-check-label ms-2" for="visible">{$btr->global_enable|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row gx-2">
		<div class="col-lg-3 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_image|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<ul class="post-images-list">
							<li class="post-image-item border-image-item-two {if $post->image}border{/if}">
								{if $post->image}
									<input type="hidden" class="js-accept-delete-two" name="delete_image" value="">
									<div class="js-parent-image-two">
										<div class="image-wrapper js-image-wrapper-two text-xs-center">
											<a href="javascript:;" class="js-delete-item-two remove-image"></a>
											<img src="{$post->image|resize_articles:200:100}" alt="">
										</div>
									</div>
								{else}
									<div class="js-parent-image-two"></div>
								{/if}
								<div class="js-upload-image-two dropzone-block-image {if $post->image}d-none{/if}">
									<i class="align-middle" data-feather="plus"></i>
									<input class="dropzone-image-two" name="image" type="file">
								</div>
								<div class="image-wrapper js-image-wrapper-two js-new-image-two text-xs-center">
									<a href="javascript:;" class="js-delete-item-two remove-image"></a>
									<img src="" alt="">
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->post_setting|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="mb-3">
							<div class="form-label">{$btr->global_category|escape}:</div>
							<select name="category_id" class="selectpicker mb-1 js-meta-categories">
								{function name=articles_category_select level=0}
									{foreach from=$articles_categories item=category}
										<option value="{$category->id}" {if $category->id == $post->category_id}selected{/if} category-name="{$category->name|escape}">{section name=sp loop=$level}--{/section} {$category->name|escape}</option>
										{if $category->subcategories}
											{articles_category_select articles_categories=$category->subcategories level=$level+1}
										{/if}
									{/foreach}
								{/function}
								{articles_category_select articles_categories=$articles_categories}
							</select>
						</div>
						<div class="mb-3">
							<div class="form-label">{$btr->global_date|escape}</div>
							<input name="date" class="form-control flatpickr" type="text" value="{if $post->date}{$post->date|date}{/if}">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-12">
			<div class="card mh-250px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_metatags|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<div class="translate-container mb-3">
									<div class="form-label">Meta-title <span id="js-meta-title-counter"></span> <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="meta_title" class="form-control js-meta-field mb-h translate-input" type="text" value="{$post->meta_title|escape}">
								</div>
								<div class="translate-container mb-3">
									<div class="form-label">Meta-keywords <span class="translate-button" role="button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
									<input name="meta_keywords" class="form-control js-meta-field mb-h translate-input" type="text" value="{$post->meta_keywords|escape}">
								</div>
							</div>
							<div class="translate-container col-lg-6 col-md-6">
								<div class="form-label">Meta-description <span id="js-meta-description-counter"></span> <span role="button" class="translate-button" tabindex="0" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_translation|escape}">{include file='svg_icon.tpl' svgId='translate'}</span></div>
								<textarea name="meta_description" class="form-control turbo-textarea js-meta-field translate-input">{$post->meta_description|escape}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="tab">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item" role="presentation"><a class="nav-link active" href="#tab-1" data-bs-toggle="tab" role="tab" aria-selected="true">{$btr->global_short_description|escape}</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link" href="#tab-2" data-bs-toggle="tab" role="tab" aria-selected="false" tabindex="-1">{$btr->global_full_description|escape}</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active show" id="tab-1" role="tabpanel">
						<textarea name="annotation" id="annotation" class="editor">{$post->annotation|escape}</textarea>
					</div>
					<div class="tab-pane" id="tab-2" role="tabpanel">
						<textarea id="js-editor" name="body" class="editor js-editor-class">{$post->text|escape}</textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="d-grid d-sm-block">
				<button type="submit" class="btn btn-primary float-end mt-n2">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>

{* TinyMCE *}
{include file='tinymce_init.tpl'}

{* Autocomplete *}
{js id="autocomplete" priority=99 include=["turbo/design/js/autocomplete/jquery.autocomplete-min.js"]}{/js} 
{javascript minify=true}

{literal}
	<script>
		$(window).on("load", function() {
			flatpickr(".flatpickr", {
				dateFormat: "d.m.Y",
				locale: "{/literal}{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}{literal}"
			});
		});

		$(".js-author-complite").autocomplete({
			serviceUrl: 'ajax/search_authors.php',
			minChars: 0,
			noCache: false,
			onSelect: function(suggestion) {
				$('input[name="author"]').val(suggestion.data.author);
				set_meta();
			},
			formatResult: function(suggestions, currentValue) {
				var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
				var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
				return "<span>" + suggestions.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>') + "</span>";
			}
		});
	</script>
{/literal}