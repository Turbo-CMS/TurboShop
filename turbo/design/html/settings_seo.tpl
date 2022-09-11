{$meta_title =$btr->seo_automation scope=global}

<div class="row">
	<div class="col-lg-7 col-md-7">
		<div class="heading_page">{$btr->seo_automation|escape}</div>
	</div>
	<div class="col-lg-5 col-md-3 text-xs-right float-xs-right"></div>
</div>

{if $message_success}
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="boxed boxed_success">
				<div class="heading_box">
					{if $message_success == 'saved'}
						{$btr->general_settings_saved|escape}
					{/if}
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
					{$btr->additional_templates_seo|escape}
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-5 col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="heading_label">{$btr->url_site|escape}</div>
									<div class="mb-1">
										<input name="am_url" class="form-control mb-h" type="text" value="{$seo->am_url|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_patterns_ajax_site_name|escape}</div>
									<div class="mb-1">
										<input name="am_name" class="form-control mb-h" type="text" value="{$seo->am_name|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->general_phone|escape}</div>
									<div class="mb-1">
										<input name="am_phone" class="form-control mb-h" type="text" value="{$seo->am_phone|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">E-mail</div>
									<div class="mb-1">
										<input name="am_email" class="form-control mb-h" type="text" value="{$seo->am_email|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_automation|escape}</div>
									<div class="mb-1">
										<select name="seo_automation" class="selectpicker">
											<option value="on" {if $seo->seo_automation == "on"}selected{/if}>{$btr->general_default|escape}</option>
											<option value="off" {if $seo->seo_automation == "off"}selected{/if}>{$btr->general_forcibly|escape}</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-7 col-md-12">
							<div class="clearfix mt-2">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="boxed boxed_attention">
											<div class="heading_box">
												{$btr->basic_templates|escape}
											</div>
											<div class="text_box">
												<div>
													<ul class="mb-0 pl-1">
														<li><label class="property">{ldelim}category{rdelim} </label> - {$btr->seo_patterns_ajax_cat_name|escape}</li>
														<li><label class="property">{ldelim}brand{rdelim} </label> - {$btr->seo_patterns_ajax_brand_name|escape}</li>
														<li><label class="property">{ldelim}product{rdelim} </label> - {$btr->seo_patterns_ajax_product_name|escape}</li>
														<li><label class="property">{ldelim}price{rdelim} </label> - {$btr->seo_patterns_ajax_product_price|escape}</li>
														<li><label class="property">{ldelim}page{rdelim} </label> - {$btr->pages_name|escape}</li>
														<li><label class="property">{ldelim}post{rdelim} </label> - {$btr->seo_patterns_post_name|escape}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 mt-1">
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
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap">
				<div class="heading_box">
					Meta-title
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-5 col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="heading_label">{$btr->general_categories|escape}</div>
									<div class="mb-1">
										<input name="category_meta_title" class="form-control mb-h" type="text" value="{$seo->category_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->categories_brands|escape}</div>
									<div class="mb-1">
										<input name="category_brand_meta_title" class="form-control mb-h" type="text" value="{$seo->category_brand_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_brands|escape}</div>
									<div class="mb-1">
										<input name="brand_meta_title" class="form-control mb-h" type="text" value="{$seo->brand_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_products|escape}</div>
									<div class="mb-1">
										<input name="product_meta_title" class="form-control mb-h" type="text" value="{$seo->product_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_pages|escape}</div>
									<div class="mb-1">
										<input name="page_meta_title" class="form-control mb-h" type="text" value="{$seo->page_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_blog_title|escape}</div>
									<div class="mb-1">
										<input name="post_meta_title" class="form-control mb-h" type="text" value="{$seo->post_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->article_categories|escape}</div>
									<div class="mb-1">
										<input name="category_article_meta_title" class="form-control mb-h" type="text" value="{$seo->category_article_meta_title|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_articles_title|escape}</div>
									<div class="mb-1">
										<input name="article_meta_title" class="form-control mb-h" type="text" value="{$seo->article_meta_title|escape}">
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-7 col-md-12">
							<div class="clearfix mt-2">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="boxed boxed_attention">
											<div class="heading_box">
												{$btr->general_caution|escape}
											</div>
											<div class="text_box">
												<div class="mb-1">
													{$btr->seo_patterns_ajax_message1|escape}
													{$btr->seo_patterns_ajax_message2|escape} <b style="display: inline;">{ldelim}$brand{rdelim}</b> {$btr->seo_patterns_ajax_message3|escape}
												</div>
												<div class="mb-h"><b>{$btr->seo_patterns_ajax_message4|escape}</b> </div>
												<div>
													<ul class="mb-0 pl-1">
														<li><b>{$btr->general_categories|escape}</b> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->categories_brands|escape}</b> - {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->seo_brands|escape}</b> - {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->seo_products|escape}</b> - {ldelim}product{rdelim}, {ldelim}price{rdelim}, {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_pages|escape}</b> - {ldelim}page{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_blog_title|escape}</b> - {ldelim}post{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->article_categories|escape}</b> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_articles_title|escape}</b> - {ldelim}post{rdelim}, {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 mt-1">
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
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap">
				<div class="heading_box">
					Meta-keywords
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-5 col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="heading_label">{$btr->general_categories|escape}</div>
									<div class="mb-1">
										<input name="category_meta_keywords" class="form-control mb-h" type="text" value="{$seo->category_meta_keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->categories_brands|escape}</div>
									<div class="mb-1">
										<input name="category_brand_meta_keywords" class="form-control mb-h" type="text" value="{$seo->category_brand_meta_keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_brands|escape}</div>
									<div class="mb-1">
										<input name="brand_meta_keywords" class="form-control mb-h" type="text" value="{$seo->brand_meta_keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_products|escape}</div>
									<div class="mb-1">
										<input name="product_meta_keywords" class="form-control mb-h" type="text" value="{$seo->product_meta_keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_pages|escape}</div>
									<div class="mb-1">
										<input name="page_meta_keywords" class="form-control mb-h" type="text" value="{$seo->page_meta_keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_blog_title|escape}</div>
									<div class="mb-1">
										<input name="post_meta_title_keywords" class="form-control mb-h" type="text" value="{$seo->post_meta__keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->article_categories|escape}</div>
									<div class="mb-1">
										<input name="category_article_meta_keywords" class="form-control mb-h" type="text" value="{$seo->category_article_meta_keywords|escape}">
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_articles_title|escape}</div>
									<div class="mb-1">
										<input name="article_meta_keywords" class="form-control mb-h" type="text" value="{$seo->article_meta_keywords|escape}">
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-7 col-md-12">
							<div class="clearfix mt-2">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="boxed boxed_attention">
											<div class="heading_box">
												{$btr->general_caution|escape}
											</div>
											<div class="text_box">
												<div class="mb-1">
													{$btr->seo_patterns_ajax_message1|escape}
													{$btr->seo_patterns_ajax_message2|escape} <b style="display: inline;">{ldelim}$brand{rdelim}</b> {$btr->seo_patterns_ajax_message3|escape}
												</div>
												<div class="mb-h"><b>{$btr->seo_patterns_ajax_message4|escape}</b> </div>
												<div>
													<ul class="mb-0 pl-1">
														<li><b>{$btr->general_categories|escape}</b> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->categories_brands|escape}</b> - {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->seo_brands|escape}</b> - {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->seo_products|escape}</b> - {ldelim}product{rdelim}, {ldelim}price{rdelim}, {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_pages|escape}</b> - {ldelim}page{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_blog_title|escape}</b> - {ldelim}post{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->article_categories|escape}</b> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_articles_title|escape}</b> - {ldelim}post{rdelim}, {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 mt-1">
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
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="boxed fn_toggle_wrap">
				<div class="heading_box">
					Meta-description
					<div class="toggle_arrow_wrap fn_toggle_card text-primary">
						<a class="btn-minimize" href="javascript:;"><i class="fn_icon_arrow icon-chevron-down"></i></a>
					</div>
				</div>
				<div class="toggle_body_wrap on fn_card">
					<div class="row">
						<div class="col-lg-5 col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="heading_label">{$btr->general_categories|escape}</div>
									<div class="mb-1">
										<textarea name="category_meta_description" class="form-control turbo_textarea">{$seo->category_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->categories_brands|escape}</div>
									<div class="mb-1">
										<textarea name="category_brand_meta_description" class="form-control turbo_textarea">{$seo->category_brand_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_brands|escape}</div>
									<div class="mb-1">
										<textarea name="brand_meta_description" class="form-control turbo_textarea">{$seo->brand_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->seo_products|escape}</div>
									<div class="mb-1">
										<textarea name="product_meta_description" class="form-control turbo_textarea">{$seo->product_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_pages|escape}</div>
									<div class="mb-1">
										<textarea name="page_meta_description" class="form-control turbo_textarea">{$seo->page_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_blog_title|escape}</div>
									<div class="mb-1">
										<textarea name="post_meta_description" class="form-control turbo_textarea">{$seo->post_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->article_categories|escape}</div>
									<div class="mb-1">
										<textarea name="category_article_meta_description" class="form-control turbo_textarea">{$seo->category_article_meta_description|escape}</textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="heading_label">{$btr->left_articles_title|escape}</div>
									<div class="mb-1">
										<textarea name="article_meta_description" class="form-control turbo_textarea">{$seo->article_meta_description|escape}</textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-7 col-md-12">
							<div class="clearfix mt-2">
								<div class="row">
									<div class="col-lg-12 col-md-12 col-sm-12">
										<div class="boxed boxed_attention">
											<div class="heading_box">
												{$btr->general_caution|escape}
											</div>
											<div class="text_box">
												<div class="mb-1">
													{$btr->seo_patterns_ajax_message1|escape}
													{$btr->seo_patterns_ajax_message2|escape} <b style="display: inline;">{ldelim}$brand{rdelim}</b> {$btr->seo_patterns_ajax_message3|escape}
												</div>
												<div class="mb-h"><b>{$btr->seo_patterns_ajax_message4|escape}</b> </div>
												<div>
													<ul class="mb-0 pl-1">
														<li><b>{$btr->general_categories|escape}</b> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->categories_brands|escape}</b> - {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->seo_brands|escape}</b> - {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->seo_products|escape}</b> - {ldelim}product{rdelim}, {ldelim}price{rdelim}, {ldelim}category{rdelim}, {ldelim}brand{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_pages|escape}</b> - {ldelim}page{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_blog_title|escape}</b> - {ldelim}post{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->article_categories|escape}</b> - {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
														<li><b>{$btr->left_articles_title|escape}</b> - {ldelim}post{rdelim}, {ldelim}category{rdelim}, {ldelim}site_name{rdelim}, {ldelim}site_url{rdelim}, {ldelim}site_phone{rdelim}, {ldelim}site_email{rdelim}</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 mt-1">
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