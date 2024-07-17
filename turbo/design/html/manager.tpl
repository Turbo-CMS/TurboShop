{if isset($m->login)}
	{$meta_title = $m->login scope=global}
{else}
	{$meta_title = $btr->manager_new scope=global}
{/if}

<h1 class="mb-3">
	{if isset($m->login)}
		{$m->login|escape}
	{else}
		{$btr->manager_add|escape}
	{/if}
</h1>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='added'}
						{$btr->manager_added|escape}
					{elseif $message_success=='updated'}
						{$btr->manager_updated|escape}
					{else}
						{$message_success|escape}
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
					{if $message_error=='login_exists'}
						{$btr->manager_exists|escape}
					{elseif $message_error=='empty_login'}
						{$btr->manager_enter_login|escape}
					{elseif $message_error=='not_writable'}
						{$btr->manager_not_writable|escape}
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
		<div class="col-lg-12 col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->manager_basic|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="mb-3">
							<div class="form-label">{$btr->manager_login|escape}</div>
							<input class="form-control" name="login" autocomplete="off" type="text" value="{if isset($m->login)}{$m->login|escape}{/if}">
							<input name="old_login" type="hidden" value="{if isset($m->login)}{$m->login|escape}{/if}">
							<input name="id" type="hidden" value="{if isset($m->id)}{$m->id|escape}{/if}">
						</div>
						<div class="mb-3">
							<div class="form-label">{$btr->manager_pass|escape}</div>
							<input class="form-control" autocomplete="off" name="password" type="password" value="" placeholder="••••••">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="card mh-230px">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->manager_rights|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="d-flex align-content-start mb-3">
							<div class="form-check form-switch form-check-reverse">
								<input class="form-check-input ms-2 js-all-perms" type="checkbox" id="all-perms">
								<label class="form-check-label" for="all-perms">{$btr->manager_all_access|escape}</label>
							</div>
						</div>
						{$dashboard = ['dashboard' => $btr->global_dashboard]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_dashboard|escape}</h5>
								<div class="row">
									{foreach $dashboard as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$catalog = [
							'products' => $btr->global_products,
							'categories' => $btr->global_categories,
							'brands' => $btr->global_brands,
							'features' => $btr->global_features
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_catalog|escape}</h5>
								<div class="row">
									{foreach $catalog as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$orders = [
							'orders' => $btr->global_orders,
							'labels' => $btr->global_labels
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_orders|escape}</h5>
								<div class="row">
									{foreach $orders as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$users = [
							'users' => $btr->global_users,
							'groups' => $btr->global_groups,
							'coupons' => $btr->global_coupons
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_users|escape}</h5>
								<div class="row">
									{foreach $users as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$pages = [
							'pages' => $btr->global_pages,
							'menus' => $btr->global_menu
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_pages|escape}</h5>
								<div class="row">
									{foreach $pages as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$blog = [
							'blog' => $btr->global_blog,
							'articles' => $btr->global_articles
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_blog|escape}</h5>
								<div class="row">
									{foreach $blog as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$feedbacks = [
							'comments' => $btr->global_comments,
							'feedbacks' => $btr->global_feedback,
							'callbacks' => $btr->global_callbacks,
							'subscribes' => $btr->global_subscribes
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_feedback|escape}</h5>
								<div class="row">
									{foreach $feedbacks as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$faq = ['faq' => $btr->global_faq]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_faq|escape}</h5>
								<div class="row">
									{foreach $faq as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$automation = [
							'import' => $btr->global_import,
							'export' => $btr->global_export,
							'backup' => $btr->global_backup,
							'clear' => $btr->global_clear
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_automation|escape}</h5>
								<div class="row">
									{foreach $automation as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$stats = ['stats' => $btr->global_stats]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_stats|escape}</h5>
								<div class="row">
									{foreach $stats as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$design = ['design' => $btr->global_design]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_design|escape}</h5>
								<div class="row">
									{foreach $design as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$banners = ['banners' => $btr->global_banners]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_banners|escape}</h5>
								<div class="row">
									{foreach $banners as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$seo = [
							'seo' => $btr->seo_automation,
							'scripts' => $btr->global_scripts
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_seo|escape}</h5>
								<div class="row">
									{foreach $seo as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$settings = [
							'settings' => $btr->global_settings,
							'currency' => $btr->global_currency,
							'delivery' => $btr->global_shipping,
							'payment' => $btr->global_payment,
							'managers' => $btr->global_managers,
							'languages' => $btr->global_languages
						]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_settings|escape}</h5>
								<div class="row">
									{foreach $settings as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						{$feeds = ['feeds' => $btr->global_feeds]}
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<h5 class="fw-bold text-black-50 mb-3">{$btr->global_feeds|escape}</h5>
								<div class="row">
									{foreach $feeds as $title=>$items}
										<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
											{foreach $items as $key=>$item}
												<div class="form-check form-switch form-check-reverse form-check-inline {if isset($m->login) && $m->login==$manager->login}text-muted{/if}">
													<input class="form-check-input ms-2 js-item-perm" id="{$title}" name="permissions[]" value="{$title}" type="checkbox" {if isset($m->permissions) && in_array($title, $m->permissions)}checked{/if} {if isset($m->login) && $m->login==$manager->login}disabled{/if}>
													<label class="form-check-label" for="{$title}">{$item|escape}</label>
												</div>
											{/foreach}
										</div>
									{/foreach}
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="d-grid d-sm-block mt-1 mb-3">
									<button type="submit" class="btn btn-primary float-end">
										<i class="align-middle" data-feather="check"></i>
										{$btr->global_apply|escape}
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
	$(document).on("change", ".js-all-perms", function() {
		if ($(this).is(":checked")) {
			$('.js-item-perm').each(function() {
				if (!$(this).is(":checked")) {
					$(this).trigger("click");
				}
			});
		} else {
			$('.js-item-perm').each(function() {
				if ($(this).is(":checked")) {
					$(this).trigger("click");
				}
			})
		}
	})
</script>