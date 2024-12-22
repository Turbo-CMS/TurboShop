{* Footer *}

<footer itemscope itemtype="https://schema.org/WPFooter" class="bg-body pb-5 pb-lg-0">
	<div class="container-xxl text-center text-md-start">
		<div class="row text-center text-md-start">
			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
				{* Callback *}
				<a class="fs-6 mb-4 text-decoration-none" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#callbackModal" role="button">
					<i class="fal fa-headset me-2"></i>
					{$lang->callback|escape}
				</a>

				{* Social Buttons *}
				<ul class="list-unstyled list-inline mt-3">
					<li class="list-inline-item">
						<a href="{$theme_settings->facebook|escape}" class="btn-sm link-secondary mx-1">
							<i class="fab fa-facebook-f bs-facebook"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="{$theme_settings->instagram|escape}" class="btn-sm link-secondary mx-1">
							<i class="fab fa-instagram bs-instagram"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="{$theme_settings->twitterx|escape}" class="btn-sm link-secondary mx-1">
							<i class="fab fa-x-twitter"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="{$theme_settings->youtube|escape}" class="btn-sm link-secondary mx-1">
							<i class="fab fa-youtube bs-youtube"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="{$theme_settings->linkedin|escape}" class="btn-sm link-secondary mx-1">
							<i class="fab fa-linkedin-in bs-linkedin"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a class="btn-sm link-secondary mx-1" href="{$config->root_url}/{$lang_link}feeds/rss.xml" target="_blank">
							<i class="fa fa-rss"></i>
						</a>
					</li>
					<li class="list-inline-item">
						<a href="{$lang_link}sitemap" class="btn-sm link-secondary mx-1">
							<i class="fa fa-sitemap"></i>
						</a>
					</li>
				</ul>
			</div>
			
			<hr class="border-color d-md-none">

			{* Footer Links *}
			<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
				<h6 class="mb-4 text-muted">{$lang->about_shop|escape}</h6>
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->id_menu_footer_1}
						<div class="mb-2 {if $page && $page->id == $p->id}selected{/if}">
							<a data-page="{$p->id}" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
						</div>
					{/if}
				{/foreach}
			</div>

			<hr class="border-color d-md-none">
			
			{* Footer Links *}
			<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
				<h6 class="mb-4 text-muted">{$lang->catalog|escape}</h6>
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->id_menu_footer_2}
						<div class="mb-2 {if $page && $page->id == $p->id}selected{/if}">
							<a data-page="{$p->id}" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
						</div>
					{/if}
				{/foreach}
			</div>

			<hr class="border-color d-md-none">
			
			{* Footer Links *}
			<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
				<h6 class="mb-4 text-muted">{$lang->help|escape}</h6>
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->id_menu_footer_3}
						<div class="mb-2 {if $page && $page->id == $p->id}selected{/if}">
							<a data-page="{$p->id}" class="link-underline link-underline-opacity-0 link-underline-opacity-100-hover" href="{$lang_link}{$p->url}">{$p->header|escape}</a>
						</div>
					{/if}
				{/foreach}
			</div>
		</div>
		
		<hr class="border-color">

		<div class="row d-flex align-items-center">
			
			{* Payment *}
			<div class="col-md-6 col-lg-6">
				<div class="mb-3 text-muted">
					<i class="fab fa-xl fa-cc-visa me-1"></i>
					<i class="fab fa-xl fa-cc-mastercard me-1"></i>
				</div>
			</div>

			{* Copyright *}
			<div class="col-md-6 col-lg-6 ml-lg-0">
				<div class="text-center text-md-end mb-3 text-muted small">© <span itemprop="copyrightYear">{$smarty.now|date_format:"Y"}</span><strong class="ms-1">TurboCMS</strong></div>
			</div>
		</div>
	</div>
</footer>