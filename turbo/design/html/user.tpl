{if $user->id}
	{$meta_title = $user->name scope=global}
{/if}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">
		{$btr->global_buyer|escape} {$user->name|escape}
	</h1>
</div>

{if $message_success}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success=='updated'}
						{$btr->user_updated|escape}
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

{if $message_error}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_error=='login_exists'}
						{$btr->user_already_registered|escape}
					{elseif $message_error=='empty_name'}
						{$btr->user_name|escape}
					{elseif $message_error=='empty_email'}
						{$btr->user_email|escape}
					{else}
						{$message_error|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="clearfix js-fast-button">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="row d-flex">
						<div class="col-lg-10 col-md-9 col-sm-12">
							<div class="mb-3">
								<div class="form-label">{$btr->global_name|escape}</div>
								<input class="form-control" name="name" type="text" value="{$user->name|escape}">
								<input name="id" type="hidden" value="{$user->id|escape}">
							</div>
						</div>
						<div class="col-lg-2 col-md-3 col-sm-12">
							<div class="d-flex justify-content-center align-content-center flex-wrap flex-md-column h-100">
								<div class="form-check form-switch form-check-reverse ms-2 mb-2 mb-sm-1">
									<input class="form-check-input ms-2" type="checkbox" id="enabled" name="enabled" value="1" type="checkbox" {if $user->enabled}checked=""{/if}>
									<label class="form-check-label ms-2" for="enabled">{$btr->global_enable|escape}</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->user_options|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="mb-3">
									<div class="form-label">E-mail</div>
									<input name="email" class="form-control" type="text" value="{$user->email|escape}">
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_phone|escape}</div>
									<input class="form-control mb-h" name="phone" type="text" value="{$user->phone|escape}">
									<input name="id" type="hidden" value="{$user->id|escape}">
								</div>
								<div class="mb-1">
									<div class="form-label">{$btr->global_address|escape}</div>
									<input name="address" class="form-control" type="text" value="{$user->address|escape}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">
								<div class="mb-3">
									<div class="form-label">{$btr->global_group|escape}</div>
									<select name="group_id" class="selectpicker">
										<option value="0">{$btr->user_not_in_group|escape}</option>
										{foreach $groups as $g}
											<option value="{$g->id}" {if $user->group_id == $g->id}selected{/if}>{$g->name|escape}</option>
										{/foreach}
									</select>
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->global_registration_date|escape}</div>
									<input name="" class="form-control" type="text" disabled value="{$user->created|date}">
								</div>
								<div class="mb-3">
									<div class="form-label">{$btr->user_last_ip|escape}</div>
									<input name="" class="form-control" type="text" disabled value="{$user->last_ip|escape}">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	{if $orders}
		<div class="row">
			<div class="col-md-12">
				<div class="card mh-230px">
					<div class="card-header">
						<div class="card-actions float-end">
							<div class="d-block d-lg-none position-relative collapse-icon">
								<a href="javascript:;" class="collapse-chevron">
									<i class="align-middle" data-feather="chevron-up"></i>
								</a>
							</div>
						</div>
						<h5 class="card-title mb-0">{$btr->user_orders|escape}</h5>
					</div>
					<div class="collapse-card">
						<div class="card-body">
							<div class="scrollbar-inner">
								<div class="turbo-list turbo-list-order user-orders-scroll">
									<div class="turbo-list-head">
										<div class="turbo-list-heading turbo-list-user-number">№</div>
										<div class="turbo-list-heading turbo-list-user-name">{$btr->global_full_name|escape}</div>
										<div class="turbo-list-heading turbo-list-user-date">{$btr->global_date|escape}</div>
										<div class="turbo-list-heading turbo-list-user-price">{$btr->coupons_order_price|escape}</div>
									</div>
									<div class="turbo-list-body">
										{foreach $orders as $order}
											<div class="js-row turbo-list-body-item">
												<div class="turbo-list-row">
													<div class="turbo-list-boding turbo-list-user-number">
														<a href="{url module=OrderAdmin id=$order->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$btr->global_order_number|escape} {$order->id}</a>
													</div>
													<div class="turbo-list-boding turbo-list-user-name">
														<a href="{url module=OrderAdmin id=$order->id return=$smarty.server.REQUEST_URI}" class="fw-bold text-body text-decoration-none">{$order->name|escape}</a>
														{if $order->note}
															<div class="text-muted fw-light">{$order->note|escape}</div>
														{/if}
														{if $order->paid}
															<div class="mt-1">
																<span class="badge badge-success-light">{$btr->global_paid|escape}</span>
															</div>
														{/if}
													</div>
													<div class="turbo-list-boding turbo-list-user-date">
														{$order->date|date} | {$order->date|time}
													</div>

													<div class="turbo-list-boding turbo-list-user-price">
														<div class="input-group">
															<span class="form-control">{$order->total_price|escape}</span>
															<span class="input-group-text">{$currency->sign|escape}</span>
														</div>
													</div>
												</div>
											</div>
										{/foreach}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
	<div class="row">
		<div class="col-12">
			<div class="d-grid d-sm-block mt-3">
				<button type="submit" class="btn btn-primary float-end">
					<i class="align-middle" data-feather="check"></i>
					{$btr->global_apply|escape}
				</button>
			</div>
		</div>
	</div>
</form>