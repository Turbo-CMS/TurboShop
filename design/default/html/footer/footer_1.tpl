{* Subscribe *}
<div class="container-fluid bg-dark mt-auto">
	<div class="row">
		<hr class="text-black-50">
		<div class="col-md-4 offset-md-4">
			<form class="form-group needs-validation pb-2 pt-3" method="post" novalidate>
				{if isset($subscribe_error)}
					<label class="error text-danger">
						{if $subscribe_error == 'email_exist'}
							{$lang->already_subscribe}
						{/if}
						{if $subscribe_error == 'empty_email'}
							{$lang->enter_your_email}
						{/if}
					</label>
				{/if}
				{if isset($subscribe_success)}
					<label class="success text-success">
						{$lang->success_subscribe}
					</label>
				{/if}
				<div class="input-group mb-4">
					<input type="email" class="form-control {if isset($subscribe_error)}border-danger{/if} {if isset($subscribe_success)}border-success{/if}" name="subscribe_email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" size="20" required>
					<button type="submit" class="btn btn-warning" name="subscribe" value="{$lang->subscribe}"><i class="fa fa-envelope"></i></button>
				</div>
			</form>
		</div>
		<hr class="text-black-50">
	</div>
</div>

<footer itemscope itemtype="https://schema.org/WPFooter" class="page-footer font-small bg-dark text-white pb-5 pb-lg-0">
	<div class="container text-center text-md-start">
		<div class="row text-center text-md-start">
			{* Footer Description *}
			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
				<h6 class="text-uppercase mb-4 font-weight-bold">{$settings->company_name|escape}</h6>
				<div>{$lang->main_description}</div>
			</div>
			<hr class="text-black-50 w-100 clearfix d-md-none">
			{* Footer Links *}
			<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
				<h6 class="text-uppercase mb-4 font-weight-bold">{$lang->about_shop}</h6>
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->id_menu_footer_1}
						<div class="mb-3 {if $page && $page->id == $p->id}selected{/if}">
							<a data-page="{$p->id}" class="text-decoration-none" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
						</div>
					{/if}
				{/foreach}
			</div>
			<hr class="text-black-50 w-100 clearfix d-md-none">
			{* Footer Links *}
			<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
				<h6 class="text-uppercase mb-4 font-weight-bold">{$lang->information}</h6>
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->id_menu_footer_2}
						<div class="mb-3 {if $page && $page->id == $p->id}selected{/if}">
							<a data-page="{$p->id}" class="text-decoration-none" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
						</div>
					{/if}
				{/foreach}
			</div>
			<hr class="text-black-50 w-100 clearfix d-md-none">
			<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
				{* Footer Contacts *}
				<h6 class="text-uppercase mb-4 font-weight-bold">{$lang->contacts}</h6>
				<div class="mb-3"><i class="fal fa-map-marker-alt text-white-50 me-2"></i>{$lang->contact_details}</div>
				<div class="mb-3"><i class="fal fa-envelope text-white-50 me-2"></i>{$theme_settings->email|escape}</div>
				<div class="mb-3"><i class="fal fa-phone text-white-50 me-2"></i>{$theme_settings->phone_1|escape}</div>
				<div class="mb-3"><i class="fal fa-print text-white-50 me-2"></i>{$theme_settings->phone_2|escape}</div>
				{* Footer Payment *}
				<div class="text-white-50">
					<i class="fab fa-xl fa-cc-visa me-1"></i>
					<i class="fab fa-xl fa-cc-mastercard me-1"></i>
					<i class="fab fa-xl fa-cc-paypal me-1"></i>
					<i class="fab fa-xl fa-cc-stripe me-1"></i>
					<i class="fab fa-xl fa-cc-apple-pay"></i>
				</div>
			</div>
		</div>
		<hr class="text-black-50">
		<div class="row d-flex align-items-center">
			<div class="col-md-6 col-lg-6">
				{* Copyright *}
				<div class="text-center text-md-start text-white-50 mb-3">© <span itemprop="copyrightYear">{$smarty.now|date_format:"Y"}</span><strong class="ms-1">TurboCMS</strong></div>
			</div>
			<div class="col-md-6 col-lg-6 ml-lg-0">
				{* Social Buttons *}
				<div class="text-center text-md-end">
					<ul class="list-unstyled list-inline">
						<li class="list-inline-item">
							<a href="{$theme_settings->facebook|escape}" class="btn-floating btn-sm rgba-white-slight mx-1">
								<i class="fab fa-facebook-f bs-facebook"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a href="{$theme_settings->instagram|escape}" class="btn-floating btn-sm rgba-white-slight mx-1">
								<i class="fab fa-instagram bs-instagram"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a href="{$theme_settings->twitterx|escape}" class="btn-floating btn-sm rgba-white-slight mx-1">
								<i class="fab fa-x-twitter"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a href="{$theme_settings->youtube|escape}" class="btn-floating btn-sm rgba-white-slight mx-1">
								<i class="fab fa-youtube bs-youtube"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a href="{$theme_settings->linkedin|escape}" class="btn-floating btn-sm rgba-white-slight mx-1">
								<i class="fab fa-linkedin-in bs-linkedin"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a class="btn-floating btn-sm rgba-white-slight mx-1" href="{$config->root_url}/{$lang_link}feeds/rss.xml" target="_blank">
								<i class="fa fa-rss"></i>
							</a>
						</li>
						<li class="list-inline-item">
							<a href="{$lang_link}sitemap" class="btn-floating btn-sm rgba-white-slight mx-1">
								<i class="fa fa-sitemap"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>