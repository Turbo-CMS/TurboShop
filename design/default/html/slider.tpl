{get_banner var=banner_1 group='1'}
{if $banner_1->items}
	<!-- Slider -->
	<div id="MainSlider" class="carousel slide my-4 {if $smarty.cookies.mode == 'mode'}bg-dark{else}bg-light carousel-dark{/if} rounded" data-bs-ride="carousel">
		<div class="carousel-indicators">
			{foreach $banner_1->items as $s name=indicator}
				<button type="button" data-bs-target="#MainSlider" data-bs-slide-to="{$smarty.foreach.indicator.index}" aria-label="Slide {$smarty.foreach.indicator.index}" {if $smarty.foreach.indicator.first}class="active" aria-current="true" {/if}></button>
			{/foreach}
		</div>
		<div class="carousel-inner">
			{foreach $banner_1->items as $s name=foo}
				<div class="carousel-item {if $smarty.foreach.foo.first}active{/if}">
					<div class="row align-items-center py-3">
						<div class="col-md-5">
							<div class="ps-3 pe-3 ps-md-5 pe-md-0 pt-4 pt-lg-5 pb-5 text-center text-md-start">
								{if $s->name}<h3 class="mb-1">{$s->name|escape}</h3>{/if}
								{if $s->description}<h4 class="font-weight-light opacity-70 pb-3">{$s->description}</h4>{/if}
								{if $s->url}<a class="btn btn-primary" href="{$lang_link}{$s->url|escape}">{$s->button|escape}<i class="fal fa-arrow-right ms-2"></i></a>{/if}
							</div>
						</div>
						<div class="col-md-7"><img class="d-block mx-auto" src="{$s->image|resize_banners:550:440}" alt="{$s->alt|escape}" title="{$s->title|escape}"></div>
					</div>
				</div>
			{/foreach}
		</div>
	</div>
{/if}