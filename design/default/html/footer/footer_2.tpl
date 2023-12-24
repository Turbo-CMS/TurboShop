<div class="container">
	<footer class="pt-5 border-top">
		<div class="row">
			<div class="col-6 col-md-2 mb-3">
				<h5>{$lang->about_shop}</h5>
				<ul class="nav flex-column">
					{foreach $pages as $p}
						{if $p->menu_id == 1}
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
				<h5>{$lang->information}</h5>
				<ul class="nav flex-column">
					{foreach $pages as $p}
						{if $p->menu_id == 3}
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
				<h5>{$lang->contacts}</h5>
				{* Footer Contacts *}
				<div class="mb-2"><i class="fal fa-map-marker-alt text-body-secondary me-2"></i>{$lang->contact_details}</div>
				<div class="mb-2"><i class="fal fa-envelope text-body-secondary me-2"></i>info@gmail.com</div>
				<div class="mb-2"><i class="fal fa-phone text-body-secondary me-2"></i>(123) 456-78-90</div>
				<div class="mb-2"><i class="fal fa-print text-body-secondary me-2"></i>(987) 654-32-10</div>
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
					<h5>{$lang->subscribe_newsletter}</h5>
					<p>{$lang->subscribe_text}</p>
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
					<div class="d-flex flex-column flex-sm-row w-100 gap-2">
						<label for="subscribeEmail" class="visually-hidden">Email</label>
						<input id="subscribeEmail" type="email" class="form-control {if isset($subscribe_error)}border-danger{/if} {if isset($subscribe_success)}border-success{/if}" name="subscribe_email" value="{if isset($email)}{$email|escape}{/if}" placeholder="{$lang->enter_your_email}" size="20" required>
						<button class="btn btn-primary" value="{$lang->subscribe}" name="subscribe" type="submit">{$lang->subscribe}</button>
					</div>
				</form>
			</div>
		</div>

		<div class="d-flex flex-column flex-sm-row justify-content-between pt-3 pt-lg-4 pb-5 pb-lg-0 mb-2 border-top">
			<p>© <span itemprop="copyrightYear">{$smarty.now|date_format:"Y"}</span><strong class="ms-1">TurboCMS</strong></p>
			<ul class="list-unstyled d-flex">
				<li class="me-3">
					<a class="link-body-emphasis" href="#">
						<i class="fab fa-facebook-f bs-facebook"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="#">
						<i class="fab fa-instagram bs-instagram"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="#">
						<i class="fab fa-x-twitter"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="#">
						<i class="fab fa-youtube bs-youtube"></i>
					</a>
				</li>
				<li class="me-3">
					<a class="link-body-emphasis" href="#">
						<i class="fab fa-linkedin-in bs-linkedin"></i>
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