{$meta_title=$btr->global_translations scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{$btr->global_translations|escape}
			</h1>
			{if !$locked_theme}
				<div class="d-grid d-sm-block mt-2 mt-md-0">
					<a class="btn btn-primary" href="{url module=TranslationAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->translations_add|escape}</a>
				</div>
			{/if}
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="TranslationsAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->global_search|escape}" type="text" value="{$keyword|escape}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

{if $locked_theme}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{$btr->global_protected|escape}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="card">
	<div class="card-body">
		{if $translations}
			<form class="js-form-list" method="post">
				<input type="hidden" name="session_id" value="{$smarty.session.id}">
				<div class="translation_wrap turbo-list">
					<div class="turbo-list-head">
						<div class="turbo-list-heading turbo-list-check">
							<label class="form-check">
								<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
							</label>
						</div>
						<div class="turbo-list-heading turbo-list-translations-num">№</div>
						<div class="turbo-list-heading turbo-list-translations-name">
							{$btr->global_translation|escape}
							{if $sort == 'lang_asc'}
								<a href="{url sort=lang_desc}" class="lang-desc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
							{elseif $sort == 'lang_desc'}
								<a href="{url sort=lang_asc}" class="lang-asc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
							{else}
								<a href="{url sort=lang_desc}">{include file='svg_icon.tpl' svgId='sorts'}</a>
							{/if}
						</div>
						<div class="turbo-list-heading turbo-list-translations-variable">
							{$btr->translations_var|escape}
							{if $sort == 'label_asc'}
								<a href="{url sort=label_desc}" class="label-desc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
							{elseif $sort == 'label_desc'}
								<a href="{url sort=label_asc}" class="label-asc selected">{include file='svg_icon.tpl' svgId='sorts'}</a>
							{else}
								<a href="{url sort=label_desc}">{include file='svg_icon.tpl' svgId='sorts'}</a>
							{/if}
						</div>
						<div class="turbo-list-heading turbo-list-delete"></div>
					</div>
					<div class="turbo-list-body">
						{foreach $translations as $translation}
							<div class="js-row turbo-list-body-item js-sort-item">
								<div class="turbo-list-row">
									<div class="turbo-list-boding turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$translation->id}">
										</label>
									</div>
									<div class="turbo-list-heading turbo-list-translations-num">№ {$translation@iteration}</div>
									<div class="turbo-list-boding turbo-list-translations-name">
										<a href="{url module=TranslationAdmin id=$translation->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$translation->lang_{$lang_label}|escape}</a>
									</div>
									<div class="turbo-list-boding  turbo-list-translations-variable">
										<a href="{url module=TranslationAdmin id=$translation->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$translation->label|escape}</a>
									</div>
									<div class="turbo-list-boding turbo-list-delete">
										{if !$locked_theme}
											<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
												<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
													<i class="align-middle" data-feather="trash-2"></i>
												</span>
											</button>
										{/if}
									</div>
								</div>
							</div>
						{/foreach}
					</div>
					{if !$locked_theme}
						<div class="turbo-list-footer js-action-block">
							<div class="turbo-list-foot-left">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-option">
									<select name="action" class="selectpicker">
										<option value="delete">{$btr->global_delete|escape}</option>
									</select>
								</div>
							</div>
							<button id="apply-action" type="submit" class="btn btn-primary">
								<i class="align-middle" data-feather="check"></i>
								{$btr->global_apply|escape}
							</button>
						</div>
					{/if}
				</div>
			</form>
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->translations_no|escape}</h5>
		{/if}
	</div>
</div>