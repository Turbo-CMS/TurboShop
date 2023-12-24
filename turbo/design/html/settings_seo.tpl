{$meta_title =$btr->seo_automation_title scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->seo_automation_title|escape}</h1>
</div>

{if isset($message_success)}
	<div class="row">
		<div class="col-12">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<div class="alert-message">
					{if $message_success == 'saved'}
						{$btr->global_settings_saved|escape}
					{/if}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>
		</div>
	</div>
{/if}

<form method="post" enctype="multipart/form-data" class="js-fast-button">
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
					<h5 class="card-title mb-0">{$btr->additional_templates_seo|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-5 col-md-12">
								<div class="row">
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->url_site|escape}</div>
											<input name="am_url" class="form-control" type="text" value="{$seo->am_url|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_patterns_site_name|escape}</div>
											<input name="am_name" class="form-control" type="text" value="{$seo->am_name|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_phone|escape}</div>
											<input name="am_phone" class="form-control" type="text" value="{$seo->am_phone|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">E-mail</div>
											<input name="am_email" class="form-control" type="text" value="{$seo->am_email|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_automation|escape}</div>
											<select name="seo_automation" class="selectpicker">
												<option value="on" {if $seo->seo_automation == "on"}selected{/if}>{$btr->global_default|escape}</option>
												<option value="off" {if $seo->seo_automation == "off"}selected{/if}>{$btr->global_forcibly|escape}</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-12">
								<div class="mt-4">
									<div class="alert alert-primary alert-dismissible" role="alert">
										<div class="alert-message p-4">
											<h4 class="alert-heading">{$btr->basic_templates|escape}</h4>
											<ul class="mb-0 ps-3">
												<li class="mb-1"><strong>{ldelim}category{rdelim} </strong> - {$btr->seo_patterns_cat_name|escape}</li>
												<li class="mb-1"><strong>{ldelim}brand{rdelim} </strong> - {$btr->seo_patterns_brand_name|escape}</li>
												<li class="mb-1"><strong>{ldelim}product{rdelim} </strong> - {$btr->global_product_name|escape}</li>
												<li class="mb-1"><strong>{ldelim}price{rdelim} </strong> - {$btr->seo_patterns_product_price|escape}</li>
												<li class="mb-1"><strong>{ldelim}page{rdelim} </strong> - {$btr->pages_name|escape}</li>
												<li class="mb-1"><strong>{ldelim}post{rdelim} </strong> - {$btr->seo_patterns_post_name|escape}</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
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
					<h5 class="card-title mb-0">Meta-title</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-5 col-md-12">
								<div class="row">
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_categories|escape}</div>
											<input name="category_meta_title" class="form-control mb-h" type="text" value="{$seo->category_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->categories_brands|escape}</div>
											<input name="category_brand_meta_title" class="form-control mb-h" type="text" value="{$seo->category_brand_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_brands|escape}</div>
											<input name="brand_meta_title" class="form-control mb-h" type="text" value="{$seo->brand_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_products|escape}</div>
											<input name="product_meta_title" class="form-control mb-h" type="text" value="{$seo->product_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_pages|escape}</div>
											<input name="page_meta_title" class="form-control mb-h" type="text" value="{$seo->page_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_blogs|escape}</div>
											<input name="post_meta_title" class="form-control mb-h" type="text" value="{$seo->post_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->article_categories|escape}</div>
											<input name="category_article_meta_title" class="form-control mb-h" type="text" value="{$seo->category_article_meta_title|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_articles|escape}</div>
											<input name="article_meta_title" class="form-control mb-h" type="text" value="{$seo->article_meta_title|escape}">
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-12">
								<div class="mt-4">
									<div class="alert alert-primary alert-dismissible" role="alert">
										<div class="alert-message p-4">
											<h4 class="alert-heading">{$btr->global_caution|escape}</h4>
											<div class="mb-3">
												{$btr->seo_patterns_message1|escape}
												{$btr->seo_patterns_message2|escape} <strong>{ldelim}$brand{rdelim}</strong> {$btr->seo_patterns_message3|escape}
											</div>
											<div class="mb-1"><strong>{$btr->seo_patterns_message4|escape}</strong> </div>
											<ul class="mb-0 ps-3">
												<li class="mb-1"><strong>{$btr->global_categories|escape}</strong> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->categories_brands|escape}</strong> - {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->seo_brands|escape}</strong> - {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->seo_products|escape}</strong> - {ldelim}product{rdelim}, {ldelim}price{rdelim}, {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_pages|escape}</strong> - {ldelim}page{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_blogs|escape}</strong> - {ldelim}post{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->article_categories|escape}</strong> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_articles|escape}</strong> - {ldelim}post{rdelim}, {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
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
					<h5 class="card-title mb-0">Meta-keywords</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-5 col-md-12">
								<div class="row">
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_categories|escape}</div>
											<input name="category_meta_keywords" class="form-control mb-h" type="text" value="{$seo->category_meta_keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->categories_brands|escape}</div>
											<input name="category_brand_meta_keywords" class="form-control mb-h" type="text" value="{$seo->category_brand_meta_keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_brands|escape}</div>
											<input name="brand_meta_keywords" class="form-control mb-h" type="text" value="{$seo->brand_meta_keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_products|escape}</div>
											<input name="product_meta_keywords" class="form-control mb-h" type="text" value="{$seo->product_meta_keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_pages|escape}</div>
											<input name="page_meta_keywords" class="form-control mb-h" type="text" value="{$seo->page_meta_keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_blogs|escape}</div>
											<input name="post_meta_title_keywords" class="form-control mb-h" type="text" value="{$seo->post_meta__keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->article_categories|escape}</div>
											<input name="category_article_meta_keywords" class="form-control mb-h" type="text" value="{$seo->category_article_meta_keywords|escape}">
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_articles|escape}</div>
											<input name="article_meta_keywords" class="form-control mb-h" type="text" value="{$seo->article_meta_keywords|escape}">
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-12">
								<div class="mt-4">
									<div class="alert alert-primary alert-dismissible" role="alert">
										<div class="alert-message p-4">
											<h4 class="alert-heading">{$btr->global_caution|escape}</h4>
											<div class="mb-3">
												{$btr->seo_patterns_message1|escape}
												{$btr->seo_patterns_message2|escape} <strong>{ldelim}$brand{rdelim}</strong> {$btr->seo_patterns_message3|escape}
											</div>
											<div class="mb-1"><strong>{$btr->seo_patterns_message4|escape}</strong> </div>
											<ul class="mb-0 ps-3">
												<li class="mb-1"><strong>{$btr->global_categories|escape}</strong> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->categories_brands|escape}</strong> - {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->seo_brands|escape}</strong> - {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->seo_products|escape}</strong> - {ldelim}product{rdelim}, {ldelim}price{rdelim}, {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_pages|escape}</strong> - {ldelim}page{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_blogs|escape}</strong> - {ldelim}post{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->article_categories|escape}</strong> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_articles|escape}</strong> - {ldelim}post{rdelim}, {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
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
					<h5 class="card-title mb-0">Meta-description</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-5 col-md-12">
								<div class="row">
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_categories|escape}</div>
											<textarea name="category_meta_description" class="form-control turbo-textarea">{$seo->category_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->categories_brands|escape}</div>
											<textarea name="category_brand_meta_description" class="form-control turbo-textarea">{$seo->category_brand_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_brands|escape}</div>
											<textarea name="brand_meta_description" class="form-control turbo-textarea">{$seo->brand_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->seo_products|escape}</div>
											<textarea name="product_meta_description" class="form-control turbo-textarea">{$seo->product_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_pages|escape}</div>
											<textarea name="page_meta_description" class="form-control turbo-textarea">{$seo->page_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_blogs|escape}</div>
											<textarea name="post_meta_description" class="form-control turbo-textarea">{$seo->post_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->article_categories|escape}</div>
											<textarea name="category_article_meta_description" class="form-control turbo-textarea">{$seo->category_article_meta_description|escape}</textarea>
										</div>
									</div>
									<div class="col-md-12">
										<div class="mb-3">
											<div class="form-label">{$btr->global_articles|escape}</div>
											<textarea name="article_meta_description" class="form-control turbo-textarea">{$seo->article_meta_description|escape}</textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-12">
								<div class="mt-4">
									<div class="alert alert-primary alert-dismissible" role="alert">
										<div class="alert-message p-4">
											<h4 class="alert-heading">{$btr->global_caution|escape}</h4>
											<div class="mb-3">
												{$btr->seo_patterns_message1|escape}
												{$btr->seo_patterns_message2|escape} <strong>{ldelim}$brand{rdelim}</strong> {$btr->seo_patterns_message3|escape}
											</div>
											<div class="mb-1"><strong>{$btr->seo_patterns_message4|escape}</strong> </div>
											<ul class="mb-0 ps-3">
												<li class="mb-1"><strong>{$btr->global_categories|escape}</strong> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->categories_brands|escape}</strong> - {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->seo_brands|escape}</strong> - {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->seo_products|escape}</strong> - {ldelim}product{rdelim}, {ldelim}price{rdelim}, {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_pages|escape}</strong> - {ldelim}page{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_blogs|escape}</strong> - {ldelim}post{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->article_categories|escape}</strong> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
												<li class="mb-1"><strong>{$btr->global_articles|escape}</strong> - {ldelim}post{rdelim}, {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
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
</form>