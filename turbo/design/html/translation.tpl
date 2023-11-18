{if $translation->id}
	{$meta_title = $translation->label scope=global}
{else}
	{$meta_title = $btr->translation_new scope=global}
{/if}

<h1 class="mb-3">
	{if !$translation->id}
		{$btr->translation_add|escape}
	{else}
		{$translation->label|escape}
	{/if}
</h1>

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

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'added'}
						{$btr->translation_added|escape}
					{elseif $message_success == 'updated'}
						{$btr->translation_updated|escape}
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

{if isset($message_error)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error == 'label_empty'}{$btr->translation_empty|escape}{/if}
					{if $message_error == 'label_exists'}{$btr->translation_used|escape}{/if}
					{if $message_error == 'label_is_class'}{$btr->translation_not_allowed|escape}{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<div class="card-actions float-end">
					<div class="d-block d-lg-none position-relative collapse-icon">
						<a href="javascript:;" class="collapse-chevron">
							<i class="align-middle" data-feather="chevron-up"></i>
						</a>
					</div>
				</div>
				<h5 class="card-title mb-0">{$btr->global_translation|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<form method="post" enctype="multipart/form-data">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<input name="id" type="hidden" value="{$translation->id}">
						<div class="row">
							<div class="col-12">
								<div class="mb-3">
									<div class="form-label">{$btr->translation_name|escape}</div>
									<input name="label" class="form-control" type="text" value="{if isset($translation->label)}{$translation->label}{/if}" {if $locked_theme}readonly="" {/if} />
								</div>
							</div>
						</div>
						<div class="row">
							{foreach $languages as $lang}
								<div class="col-lg-4 col-md-4 col-sm-6 col-12">
									<div class="mb-3">
										<div class="form-label">
											<div class="translation-icon mb-2">
												<img src="design/flags/4x3/{$lang->label}.svg">
											</div>
											{$lang->name|escape}
										</div>
										<textarea name="lang_{$lang->label}" class="form-control" rows="5" {if $locked_theme}readonly="" {/if}>{if $translation->id}{$translation->lang_{$lang->label}}{/if}</textarea>
									</div>
								</div>
							{/foreach}
						</div>
						{if !$locked_theme}
							<div class="row">
								<div class="col-12">
									<div class="d-grid d-sm-block">
										<button type="submit" class="btn btn-primary float-end">
											<i class="align-middle" data-feather="check"></i>
											{$btr->global_apply|escape}
										</button>
									</div>
								</div>
							</div>
						{/if}
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

{literal}
	<script>
		$(function() {
			$('textarea').on("focusout", function() {
				label = $(this).val();
				label = label.replace(/[\s\-]+/gi, '_');
				label = translit(label);
				label = label.replace(/[^0-9a-z_\-]+/gi, '').toLowerCase();

				if (($('input[name="label"]').val() == label || $('input[name="label"]').val() == ''))
					$('input[name="label"]').val(label);
			});
		});

		function translit(str) {
			var cyr = ("А-а-Б-б-В-в-Ґ-ґ-Г-г-Д-д-Е-е-Ё-ё-Є-є-Ж-ж-З-з-И-и-І-і-Ї-ї-Й-й-К-к-Л-л-М-м-Н-н-О-о-П-п-Р-р-С-с-Т-т-У-у-Ф-ф-Х-х-Ц-ц-Ч-ч-Ш-ш-Щ-щ-Ъ-ъ-Ы-ы-Ь-ь-Э-э-Ю-ю-Я-я").split("-")
			var lat = ("A-a-B-b-V-v-G-g-G-g-D-d-E-e-E-e-E-e-ZH-zh-Z-z-I-i-I-i-I-i-J-j-K-k-L-l-M-m-N-n-O-o-P-p-R-r-S-s-T-t-U-u-F-f-H-h-TS-ts-CH-ch-SH-sh-SCH-sch-'-'-Y-y-'-'-E-e-YU-yu-YA-ya").split("-")
			var res = '';
			for (var i = 0, l = str.length; i < l; i++) {
				var s = str.charAt(i),
					n = cyr.indexOf(s);
				if (n >= 0) { res += lat[n]; } else { res += s; }
			}
			return res;
		}
	</script>
{/literal}