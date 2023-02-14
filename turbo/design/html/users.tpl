{$meta_title=$btr->global_users scope=global}

<div class="row">
	<div class="col-lg-8 col-md-8">
		<div class="d-md-flex mb-3">
			<h1 class="d-inline align-middle me-3">
				{if $keyword && $users_count>0}
					{$btr->global_users|escape} - {$users_count}
				{elseif $users_count>0}
					{$btr->global_users|escape} - {$users_count}
				{else}
					{$btr->users_no|escape}
				{/if}
			</h1>
			{if $users_count>0}
				<div class="d-inline-block heading-block text-dark me-3 mb-3 mt-1" data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->users_export|escape}">
					<i class="align-middle cursor-pointer" data-feather="file-text"></i>
				</div>
			{/if}
		</div>
	</div>
	<div class="col-lg-4 col-md-4 col-xs-12 float-sm-end">
		<form class="search mb-3" method="get">
			<input type="hidden" name="module" value="UsersAdmin">
			<div class="input-group">
				<input name="keyword" class="form-control" placeholder="{$btr->users_search|escape}" type="text" value="{$keyword|escape}">
				<button class="btn btn-primary" type="submit"><i class="align-middle mt-n1" data-feather="search"></i></button>
			</div>
		</form>
	</div>
</div>

<div class="card">
	<div class="card-header d-block d-lg-none">
		<div class="card-actions float-end">
			<div class="position-relative collapse-icon">
				<a href="javascript:;" class="collapse-chevron">
					<i class="align-middle" data-feather="chevron-down"></i>
				</a>
			</div>
		</div>
		<h5 class="card-title mb-0">{$btr->global_filter|escape}</h5>
	</div>
	<div class="card-body">
		<div class="row">
			{if $users_count>0}
				<div class="col-lg-12 col-md-12">
					<div class="progress mb-1" style="display: none;">
						<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
					</div>
				</div>
			{/if}
			<div class="col-lg-12 col-md-12 col-sm-12 mb-3">
				<div class="collapse-card boxed-sorting">
					<div class="row">
						<div class="col-md-3 col-lg-3 col-sm-12">
							<select class="selectpicker" onchange="location = this.value;">
								<option value="{url group_id=null}">{$btr->global_filter|escape}</option>
								{foreach $groups as $g}
									<option value="{url group_id=$g->id}" {if $group->id == $g->id}selected{/if}>{$g->name|escape}</option>
								{/foreach}
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $users}
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form class="js-form-list" method="post">
						<input type="hidden" name="session_id" value="{$smarty.session.id}">
						<div class="users-wrap turbo-list">
							<div class="turbo-list-head">
								<div class="turbo-list-heading turbo-list-check">
									<label class="form-check">
										<input class="form-check-input js-check-all js-check-all-single" type="checkbox" value="">
									</label>
								</div>
								<div class="turbo-list-heading turbo-list-users-name">
									<span>{$btr->global_name|escape}</span>
									<a href="{url sort=name}" {if $sort == 'name'}class="active" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
								</div>
								<div class="turbo-list-heading turbo-list-users-email">
									<span>Email</span>
									<a href="{url sort=email}" {if $sort == 'email'}class="active" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
								</div>
								<div class="turbo-list-heading turbo-list-users-date">
									<span>{$btr->global_registration_date|escape}</span>
									<a href="{url sort=date}" {if $sort == 'date'}class="active" {/if}>{include file='svg_icon.tpl' svgId='sorts'}</a>
								</div>
								<div class="turbo-list-heading turbo-list-users-group">{$btr->global_group|escape}</div>

								<div class="turbo-list-heading turbo-list-count">{$btr->users_orders|escape}</div>

								<div class="turbo-list-heading turbo-list-status">{$btr->global_activities|escape}</div>
								<div class="turbo-list-heading turbo-list-delete"></div>
							</div>
							<div class="turbo-list-body sortable">
								{foreach $users as $user}
									<div class="js-row turbo-list-body-item js-sort-item body-narrow">
										<div class="turbo-list-row narrow">
											<div class="turbo-list-boding turbo-list-check">
												<label class="form-check">
													<input class="form-check-input js-check-all-single" type="checkbox" name="check[]" value="{$user->id}">
												</label>
											</div>
											<div class="turbo-list-boding turbo-list-users-name">
												<a href="{url module=UserAdmin id=$user->id}" class="fw-bold text-body text-decoration-none">
													{$user->name|escape}
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-users-email">
												<a href="mailto:{$user->name|escape}<{$user->email|escape}>" class="fw-bold text-body text-decoration-none">
													{$user->email|escape}
												</a>
											</div>
											<div class="turbo-list-boding turbo-list-users-date">
												{$user->created|date} | {$user->created|time}
											</div>
											<div class="turbo-list-boding turbo-list-users-group">
												{if $groups[$user->group_id]}
													{$groups[$user->group_id]->name|escape}
												{else}
													—
												{/if}
											</div>
											<div class="turbo-list-boding turbo-list-count">
												{$user->orders|count}
											</div>
											<div class="turbo-list-boding turbo-list-status">
												<div class="form-check form-switch">
													<input class="form-check-input js-ajax-action {if $user->enabled}js-active-class{/if}" id="id_{$user->id}" data-module="user" data-action="enabled" data-id="{$user->id}" name="enabled" value="1" type="checkbox" {if $user->enabled}checked="" {/if}>
													<label class="form-check-label" for="id_{$user->id}"></label>
												</div>
											</div>
											<div class="turbo-list-boding turbo-list-delete">
												<div data-bs-toggle="tooltip" data-bs-placement="top" title="{$btr->users_delete|escape}">
													<button type="button" class="btn-delete js-remove" data-bs-toggle="modal" data-bs-target="#actionModal" onclick="success_action($(this));">
														<i class="align-middle" data-feather="trash-2"></i>
													</button>
												</div>
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
										<select name="action" class="selectpicker js-user-select">
											<option value="0">{$btr->global_select_action|escape}</option>
											<option value="enable">{$btr->global_do_enable|escape}</option>
											<option value="disable">{$btr->global_do_disable|escape}</option>
											<option value="move_to">{$btr->users_move|escape}</option>
											<option value="delete">{$btr->global_delete|escape}</option>
										</select>
									</div>
									<div id="move_to" class="turbo-list-option hidden js-hide-block">
										<select name="move_group" class="selectpicker">
											{if $groups}
												{foreach $groups as $group}
													<option value="{$group->id}">{$group->name|escape}</option>
												{/foreach}
											{/if}
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
				<div class="col-12">
					{include file='pagination.tpl'}
				</div>
			</div>
		{else}
			<h5 class="card-title ms-1 my-3">{$btr->users_no|escape}</h5>
		{/if}
	</div>
</div>

{* Piecon *}
{js id="piecon" priority=99 include=[
	"turbo/design/js/piecon/piecon.min.js"
]}{/js}
{javascript minify=true}

<script>
	var group_id='{$group_id|escape}';
	var keyword='{$keyword|escape}';
	var sort='{$sort|escape}';
</script>

{literal}
	<script>
		$(function() {
			$(document).on('change', 'select.js-user-select', function() {
				var elem = $(this).find('option:selected').val();
				$('.js-hide-block').addClass('hidden');
				if ($('#' + elem).size() > 0) {
					$('#' + elem).removeClass('hidden');
				}
			});

			// On document load
			$(document).on('click', '.feather-file-text', function() {
				Piecon.setOptions({fallback: 'force'});
				Piecon.setProgress(0);
				var progress_item = $("#progressbar"); //specify an element selector with animation
				$(".progress").show();
				do_export('', progress_item);
			});

			function do_export(page, progress) {
				page = typeof(page) != 'undefined' ? page : 1;
				$.ajax({
					url: "ajax/export_users.php",
					data: {page:page, group_id:group_id, keyword:keyword, sort:sort},
					dataType: 'json',
					success: function(data) {
						if (data && !data.end) {
							Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
							progress.css('width', 100 * data.page / data.totalpages + '%');
							do_export(data.page * 1 + 1, progress);
						} else {
							Piecon.setProgress(100);
							progress.css('width', '100%');
							window.location.href = 'files/export_users/users.csv';
							$(".progress").fadeOut(500);
						}
					},
					error: function(xhr, status, errorThrown) {
						alert(errorThrown + '\n' + xhr.responseText);
					}
				});
			}
		});
	</script>
{/literal}