{$meta_title = $btr->settings_feed_yml scope=global}

<h1 class="mb-3">
	{$btr->settings_feed_yml|escape}
</h1>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'saved'}{$btr->global_settings_saved|escape}{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">{$btr->global_parameters|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="bg-light rounded mb-3">
							<div class="p-3">
								<div class="row">
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="export-not-stock">{$btr->settings_feed_ava_false|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="export-not-stock" name="export_export_not_in_stock" value="1" type="checkbox" {if $settings->export_export_not_in_stock}checked="" {/if}>
											</div>
										</div>
									</div>
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="export-for-store">{$btr->settings_feed_store|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="export-for-store" name="export_available_for_retail_store" value="1" type="checkbox" {if $settings->export_available_for_retail_store}checked="" {/if}>
											</div>
										</div>
									</div>
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="export-for-reservation">{$btr->settings_feed_pickup|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="export-for-reservation" name="export_available_for_reservation" value="1" type="checkbox" {if $settings->export_available_for_reservation}checked="" {/if}>
											</div>
										</div>
									</div>
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="export-short-description">{$btr->settings_feed_descr|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="export-short-description" name="export_short_description" value="1" type="checkbox" {if $settings->export_short_description}checked="" {/if}>
											</div>
										</div>
									</div>
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="export-manufacturer-warranty">{$btr->settings_feed_manufacturer_warranty|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="export-manufacturer-warranty" name="export_has_manufacturer_warranty" value="1" type="checkbox" {if $settings->export_has_manufacturer_warranty}checked="" {/if}>
											</div>
										</div>
									</div>
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="export-seller-warranty">{$btr->settings_feed_seller_warranty|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="export-seller-warranty" name="export_has_seller_warranty" value="1" type="checkbox" {if $settings->export_has_seller_warranty}checked="" {/if}>
											</div>
										</div>
									</div>
									<div class="col-12 my-2">
										<div class="d-flex align-items-center">
											<label class="form-check-label" for="no-export-without-price">{$btr->settings_feed_no_export_without_price|escape}</label>
											<div class="form-check form-switch ms-2">
												<input class="form-check-input" id="no-export-without-price" name="export_no_export_without_price" value="1" type="checkbox" {if $settings->export_no_export_without_price}checked="" {/if}>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-7">
								<div class="mb-0">
									<div class="form-label">
										Sales notes * <span class="text-danger">{$btr->settings_feed_max_lenth|escape}</span>
									</div>
									<input id="export_sales_notes" name="export_sales_notes" class="form-control" type="text" value="{$settings->export_sales_notes}">
								</div>
							</div>
						</div>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</form>