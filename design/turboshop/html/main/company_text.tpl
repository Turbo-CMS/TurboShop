<div class="drag-block container COMPANY_TEXT" data-class="company_text_drag" data-order="{$theme_settings->block_9}">
	<div class="index-block index-block--padding-top-{$theme_settings->company_text_padding_top} index-block--padding-bottom-{$theme_settings->company_text_padding_bottom} {if $theme_settings->company_text_delimiter}index-block--delimiter{/if} {if $theme_settings->company_text_background}index-block--fon{/if}">
		<div class="company-item front_company-template">
			<div class="company-item__wrapper company-item--IMG_AND_TEXT">
				<div class="maxwidth-theme">
					<div class="flexbox flexbox--direction-row company-front-wrapper outer-rounded-x relative company-image-type {if $theme_settings->company_text_bordered}bordered{/if}">
						<div class="company-item__heading flex-1 relative">
							<div class="company-item__title sticky-block">
								<h3 class="index-block__title switcher-title">
									<a class="company-item__link dark_link stroke-theme-hover" href="{$lang_link}shop">
										<span data-page="{$page->id}">{$page->name|escape}</span>
									</a>
								</h3>
								{if $theme_settings->company_text_image}
									<div class="company-item__text index-block__preview">
										{if $page && $page->body}
											{$page->body}
										{/if}
									</div>
								{/if}
							</div>
						</div>
						<div class="company-item__right flex-1">
							<div class="sticky-block company-item__info">
								{if $theme_settings->company_text_image}
									<div class="company-item__picture-wrapper">
										<div class="lazyload company-item__picture rounded-x" style="background-image:url(data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==)" data-bg="design/{$settings->theme|escape}/images/abaut_shop.jpg">
										</div>
									</div>
								{else}
									<div class="company-item__text index-block__preview">
										{if $page && $page->body}
											{$page->body}
										{/if}
									</div>
								{/if}
							</div>
						</div>
						{if $theme_settings->company_text_button}
							<div class="index-block__btn">
								<a href="{$lang_link}{$theme_settings->company_text_url}" class="btn btn-default btn-elg">{$lang->about_shop|escape}</a>
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>