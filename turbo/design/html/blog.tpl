{$meta_title= $btr->global_blog scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{$btr->global_blog|escape} - {$posts_count}
			</h1>
			<div class="d-grid d-sm-block mt-2 mt-md-0">
				<a class="btn btn-primary" href="{url module=PostAdmin return=$smarty.server.REQUEST_URI}"><i data-feather="plus"></i> {$btr->blog_add|escape}</a>
			</div>
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="BlogAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->global_search|escape}" type="text" value="{$keyword|escape}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

<div class="card">
	<div class="card-body">
		{if $posts}
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="post-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-photo">{$btr->global_photo|escape}</div>
								<div class="turbo-list-heading turbo-list-blog-name">{$btr->blog_name|escape}</div>
								<div class="turbo-list-heading turbo-list-status">{$btr->global_enable|escape}</div>
								<div class="turbo-list-heading turbo-list-setting turbo-list-blog-setting">{$btr->global_activities|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body">
								{foreach $posts as $post}
									<div class="js-row turbo-list-body-item">
										<div class="turbo-list-row">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$post->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-photo">
												{if $post->image}
													<a href="{url module=PostAdmin id=$post->id return=$smarty.server.REQUEST_URI}">
														<img src="{$post->image|resize_posts:45:45}">
													</a>
												{else}
													<a href="{url module=PostAdmin id=$post->id return=$smarty.server.REQUEST_URI}">
														<i class="align-middle" data-feather="camera"></i>
													</a>
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-blog-name">
												<a class="fw-bold text-body text-decoration-none" href="{url module=PostAdmin id=$post->id return=$smarty.server.REQUEST_URI}">{$post->name|escape}</a>
												<div class="mb-0">
													<span class="fw-bold text-secondary">{$post->date|date}</span>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-status">
												<div class="form-check form-switch">
													<input class="form-check-input js-ajax-action {if $post->visible}js-active-class{/if}" id="id-{$post->id}" data-module="blog" data-action="visible" data-id="{$post->id}" name="visible" value="1" type="checkbox" {if $post->visible}checked=""{/if}>
													<label class="form-check-label" for="id-{$post->id}"></label>
												</div>
											</div>
											<div class="turbo-list-setting turbo-list-blog-setting">
												<a href="../{$lang_link}blog/{$post->url}" target="_blank" class="setting-icon setting-icon-open" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_view|escape}">
													<i class="align-middle" data-feather="external-link"></i>
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
													<span data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->global_delete|escape}">
														<i class="align-middle" data-feather="trash-2"></i>
													</span>
												</button>
											</div>
										</div>
									</div>
								{/foreach}
							</div>
							<div class="turbo-list-footer js-action-block">
								<div class="turbo-list-foot-left">
									<div class="turbo-list-heading turbo-list-check">
										<label class="form-check">
											<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
										</label>
									</div>
									<div class="turbo-list-option">
										<select name="action" class="selectpicker">
											<option value="enable">{$btr->global_do_enable|escape}</option>
											<option value="disable">{$btr->global_do_disable|escape}</option>
											<option value="delete">{$btr->global_delete|escape}</option>
										</select>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="align-middle" data-feather="check"></i>
									{$btr->global_apply|escape}
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->blog_no_post|escape}</h5>
		{/if}
	</div>
</div>