{$meta_title = $btr->settings_feed_yml scope=global}

<div class="row">
	<div class="col-lg-6 col-md-6">
		<div class="heading_page">{$btr->settings_feed_yml|escape}</div>
	</div>
	<div class="col-lg-4 col-md-3 text-xs-right float-xs-right"></div>
</div>

{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					{if $message_success == 'saved'}{$btr->general_settings_saved|escape}{/if}
					{if $smarty.get.return}
						<a class="btn btn_return float-xs-right" href="{$smarty.get.return}">
							{include file='svg_icon.tpl' svgId='return'}
							<span>{$btr->general_back|escape}</span>
						</a>
					{/if}
				</div>

			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data">
	<input type="hidden" name="session_id" value="{$smarty.session.id}">

	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap">
				<div class="heading_box">
					{$btr->settings_general_options|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="permission_block">
						<div class="permission_boxes row">
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_ava_false|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_export_not_in_stock" name="export_export_not_in_stock" value="1" type="checkbox" {if $settings->export_export_not_in_stock}checked=""{/if}>
										<label class="form-check-label" for="export_export_not_in_stock"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_store|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_available_for_retail_store" name="export_available_for_retail_store" value="1" type="checkbox" {if $settings->export_available_for_retail_store}checked=""{/if}>
										<label class="form-check-label" for="export_available_for_retail_store"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_pickup|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_available_for_reservation" name="export_available_for_reservation" value="1" type="checkbox" {if $settings->export_available_for_reservation}checked=""{/if}>
										<label class="form-check-label" for="export_available_for_reservation"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_descr|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_short_description" name="export_short_description" value="1" type="checkbox" {if $settings->export_short_description}checked=""{/if}>
										<label class="form-check-label" for="export_short_description"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_manufacturer_warranty|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_has_manufacturer_warranty" name="export_has_manufacturer_warranty" value="1" type="checkbox" {if $settings->export_has_manufacturer_warranty}checked=""{/if}>
										<label class="form-check-label" for="export_has_manufacturer_warranty"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_seller_warranty|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_has_seller_warranty" name="export_has_seller_warranty" value="1" type="checkbox" {if $settings->export_has_seller_warranty}checked=""{/if}>
										<label class="form-check-label" for="export_has_seller_warranty"></label>
									</div>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12">
								<div class="permission_box">
									<span>{$btr->settings_feed_no_export_without_price|escape}</span>
									<div class="form-check form-switch">
										<input class="form-check-input" id="export_no_export_without_price" name="export_no_export_without_price" value="1" type="checkbox" {if $settings->export_no_export_without_price}checked=""{/if}>
										<label class="form-check-label" for="export_no_export_without_price"></label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-7 mb-1">
							<div class="heading_label">
								<strong>sales notes</strong> * <span class="text_warning">{$btr->settings_feed_max_lenth|escape}</span>
							</div>
							<div class="mb-1">
								<input id="export_sales_notes" name="export_sales_notes" class="form-control" type="text" value="{$settings->export_sales_notes}">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12">
							<button type="submit" class="btn btn_small btn-primary float-md-right">
								{include file='svg_icon.tpl' svgId='checked'}
								<span>{$btr->general_apply|escape}</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>