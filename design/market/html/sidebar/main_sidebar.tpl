{* Main Sidebar *}

<div class="col-xl-3 d-none d-xl-block">
	<div class="py-4">
		{* Categories *}
		<ul class="nav mb-3">
			{foreach $categories as $c}
				<li class="nav-item w-100 px-0">
					<a href="{$lang_link}catalog/{$c->url}" class="nav-link link-body-emphasis link-success-hover d-flex align-items-center justify-content-between px-0">
						<span class="d-flex align-items-center">
							{if $c->code}<i class="fal fa-{$c->code|escape} me-2"></i>{/if}
							<span class="ms-2" data-category="{$c->id}">{$c->name|escape}</span>
						</span>
					</a>
				</li>
			{/foreach}
		</ul>

		{* Personal Account *}
		{if $user}
			<ul class="nav border-top border-bottom mb-3">
				<li class="nav-item w-100">
					<a href="{$lang_link}user" class="nav-link link-body-emphasis link-success-hover d-flex align-items-center justify-content-between px-0">
						<span class="d-flex align-items-center">
							<i class="fal fa-user"></i>
							<span class="ms-2">{$user->name}</span>
						</span>
					</a>
				</li>
			</ul>
		{else}
			<div class="bg-body-emphasis p-3 rounded text-center mb-3">
				<p class="small">{$lang->user_login_text|escape}</p>
				<a class="btn btn-primary btn-sm" href="#!" role="button" data-bs-toggle="modal" data-bs-target="#userModal">{$lang->user_login_button|escape}</a>
			</div>
			<hr class="border-color">
		{/if}

		{* Social Buttons *}
		<div class="ps-3">
			<h6 class="text-muted">{$lang->social_networks|escape}</h6>
			<ul class="list-unstyled list-inline">
				<li class="list-inline-item">
					<a href="{$theme_settings->facebook|escape}" class="btn-sm link-secondary mx-1 fs-5">
						<i class="fab fa-facebook-f bs-facebook"></i>
					</a>
				</li>
				<li class="list-inline-item">
					<a href="{$theme_settings->instagram|escape}" class="btn-sm link-secondary mx-1 fs-5 ms-1">
						<i class="fab fa-instagram bs-instagram"></i>
					</a>
				</li>
				<li class="list-inline-item">
					<a href="{$theme_settings->twitterx|escape}" class="btn-sm link-secondary mx-1 fs-5 ms-1">
						<i class="fab fa-x-twitter"></i>
					</a>
				</li>
				<li class="list-inline-item">
					<a href="{$theme_settings->youtube|escape}" class="btn-sm link-secondary mx-1 fs-5 ms-1">
						<i class="fab fa-youtube bs-youtube"></i>
					</a>
				</li>
				<li class="list-inline-item">
					<a href="{$theme_settings->linkedin|escape}" class="btn-sm link-secondary mx-1 fs-5 ms-1">
						<i class="fab fa-linkedin-in bs-linkedin"></i>
					</a>
				</li>
			</ul>
		</div>

		<hr class="border-color">

		{* Pages About Shop *}
		<div class="ps-3">
			<h6 class="text-muted">{$lang->about_shop|escape}</h6>
			<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->menu_main_1}
						{if $p->visible}
							<li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
								<a itemprop="url" class="nav-link {if $p->subpages}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" role="button" {if $p->subpages}data-bs-toggle="dropdown" aria-expanded="false"{/if} aria-haspopup="true">
									<span data-page="{$p->id}">{$p->header|escape}</span>
								</a>
								{if $p->subpages}
									<div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
										{foreach $p->subpages as $p2}
											<a itemprop="url" class="dropdown-item {if $page && $page->id == $p2->id}active{/if}" href="{$lang_link}{$p2->url}">
												<span data-page="{$p2->id}">{$p2->header|escape}</span>
											</a>
										{/foreach}
									</div>
								{/if}
							</li>
						{/if}
					{/if}
				{/foreach}
			</ul>
		</div>

		<hr class="border-color">

		{* Pages Catalog *}
		<div class="ps-3">
			<h6 class="text-muted">{$lang->catalog|escape}</h6>
			<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				{foreach $pages as $p}
					{if $p->menu_id == $theme_settings->menu_main_2}
						{if $p->visible}
							<li itemprop="name" class="nav-item dropdown {if $page && $page->id == $p->id}active{/if}">
								<a itemprop="url" class="nav-link {if $p->subpages}dropdown-toggle{/if}" href="{$lang_link}{$p->url}" id="dropdown{$p->id}" role="button" {if $p->subpages}data-bs-toggle="dropdown" aria-expanded="false"{/if} aria-haspopup="true">
									<span data-page="{$p->id}">{$p->header|escape}</span>	
								</a>
								{if $p->subpages}
									<div class="dropdown-menu" aria-labelledby="dropdown{$p->id}">
										{foreach $p->subpages as $p2}
											<a itemprop="url" class="dropdown-item {if $page && $page->id == $p2->id}active{/if}" href="{$lang_link}{$p2->url}">
												<span data-page="{$p2->id}">{$p2->header|escape}</span>	
											</a>
										{/foreach}
									</div>
								{/if}
							</li>
						{/if}
					{/if}
				{/foreach}
			</ul>
		</div>

		<hr class="border-color">

		{* Subscribe *}
		<div class="card bg-body-emphasis">
			<div class="card-body">
				<p class="card-title text-center small mb-3">{$lang->subscribe_title|escape}</p>
				<form class="needs-validation" method="post" novalidate>
					<div class="mb-3">
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
						<input type="email" class="form-control {if $subscribe_error}border-danger{/if} {if $subscribe_success}border-success{/if}" name="subscribe_email" value="{$email|escape}" placeholder="Email" size="20" required>
					</div>
					<button type="submit" class="btn btn-primary w-100" name="subscribe" value="{$lang->subscribe|escape}">{$lang->subscribe|escape}</button>
				</form>
			</div>
		</div>
	</div>
</div>