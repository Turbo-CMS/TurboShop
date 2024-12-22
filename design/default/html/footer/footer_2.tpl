<div class="container mt-auto">
	<footer class="pt-5 border-top">
		<div class="row">
			<div class="col-6 col-md-2 mb-3">
				<h5>{$lang->about_shop|escape}</h5>
				<ul class="nav flex-column">
					{foreach $pages as $p}
						{if $p->menu_id == $theme_settings->id_menu_footer_1}
							<li class="nav-item mb-2">
								<a class="nav-link p-0 text-body-secondary {if $page && $page->id == $p->id}active{/if}" href="{$lang_link}{$p->url}">
									<span data-page="{$p->id}">{$p->header|escape}</span>
								</a>
							</li>
						{/if}
					{/foreach}
				</ul>
			</div>

			<div class="col-6 col-md-2 mb-3">
				<h5>{$lang->information|escape}</h5>
				<ul class="nav flex-column">
					{foreach $pages as $p}
						{if $p->menu_id == $theme_settings->id_menu_footer_2}
							<li class="nav-item mb-2">
								<a class="nav-link p-0 text-body-secondary {if $page && $page->id == $p->id}active{/if}" href="{$lang_link}{$p->url}">
									<span data-page="{$p->id}">{$p->header|escape}</span>
								</a>
							</li>
						{/if}
					{/foreach}
				</ul>
			</div>

			<div class="col-6 col-md-3 mb-3">
				<h5>{$lang->contacts|escape}</h5>
				{* Footer Contacts *}
				<div class="mb-2"><i class="fal fa-map-marker-alt text-body-secondary me-2"></i>{$lang->contact_details|escape}</div>
				<div class="mb-2"><i class="fal fa-envelope text-body-secondary me-2"></i>{$theme_settings->email|escape}</div>
				<div class="mb-2"><i class="fal fa-phone text-body-secondary me-2"></i>{$theme_settings->phone_1|escape}</div>
				<div class="mb-2"><i class="fal fa-print text-body-secondary me-2"></i>{$theme_settings->phone_2|escape}</div>
				{* Footer Payment *}
				<div class="my-2">
					<i class="fab fa-xl fa-cc-visa me-1"></i>
					<i class="fab fa-xl fa-cc-mastercard me-1"></i>
					<i class="fab fa-xl fa-cc-paypal me-1"></i>
					<i class="fab fa-xl fa-cc-stripe me-1"></i>
					<i class="fab fa-xl fa-cc-apple-pay"></i>
				</div>
			</div>

			{* Subscribe *}
			<div class="col-md-4 offset-md-1 mb-3">
				<form class="needs-validation" method="post" novalidate>
					<h5>{$lang->subscribe_newsletter|escape}</h5>
					<p>{$lang->subscribe_text|escape}</p>
					{if $subscribe_error}
						<label class="error text-danger">
							{if $subscribe_error == 'email_exist'}
								{$lang->already_subscribe|escape}
							{/if}
							{if $subscribe_error == 'empty_email'}
								{$lang->enter_your_email|escape}
							{/if}
						</label>
					{/if}
					{if $subscribe_success}
						<label class="success text-success">
							{$lang->success_subscribe|escape}
						</label>
					{/if}
					<div class="d-flex flex-column flex-sm-row w-100 gap-2">
						<label for="subscribeEmail" class="visually-hidden">Email</label>
						<input id="subscribeEmail" type="email" class="form-control {if $subscribe_error}border-danger{/if} {if $subscribe_success}border-success{/if}" name="subscribe_email" value="{$email|escape}" placeholder="{$lang->enter_your_email|escape}" size="20" required>
						<button class="btn btn-primary" value="{$lang->subscribe|escape}" name="subscribe" type="submit">{$lang->subscribe|escape}</button>
					</div>
				</form>
			</div>
		</div>

		<div class="d-flex flex-column flex-sm-row justify-content-between pt-3 pt-lg-4 pb-5 pb-lg-0 mb-2 border-top">
			<p>© <span itemprop="copyrightYear">{$smarty.now|date_format:"Y"}</span><strong class="ms-1">TurboCMS</strong></p>
			<ul class="list-unstyled d-flex">
				<li class="me-3">
					<a class="link-body-emphasis" href="{$theme_settings->facebook|escape}">
						<i class="fab fa-facebook-f bs-facebook"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="{$theme_settings->instagram|escape}">
						<i class="fab fa-instagram bs-instagram"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="{$theme_settings->twitterx|escape}">
						<i class="fab fa-x-twitter"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="{$theme_settings->youtube|escape}">
						<i class="fab fa-youtube bs-youtube"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="{$theme_settings->linkedin|escape}">
						<i class="fab fa-linkedin-in bs-linkedin"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="{$config->root_url}/{$lang_link}feeds/rss.xml" target="_blank">
						<i class="fa fa-rss"></i>
					</a>
				</li>
				<li class="me-0">
					<a class="link-body-emphasis" href="{$lang_link}sitemap">
						<i class="fa fa-sitemap"></i>
					</a>
				</li>
			</ul>
		</div>
	</footer>
</div>