{* Pagination *}

{if $total_pages_num > 1}

	{$visible_pages = 11}

	{$page_from = 1}

	{if $current_page_num> floor($visible_pages/2)}
		{$page_from = max(1, $current_page_num-floor($visible_pages/2)-1)}
	{/if}

	{if $current_page_num> $total_pages_num-ceil($visible_pages/2)}
		{$page_from = max(1, $total_pages_num-$visible_pages-1)}
	{/if}

	{$page_to = min($page_from+$visible_pages, $total_pages_num-1)}

	<div class="module-pagination">
		<div class="module-pagination__wrapper">
			<div class="arrows-pagination hide-600">
				{if $current_page_num == 2}
					<a href="{url page=null}" class="arrows-pagination__prev arrows-pagination__item rounded-x" title="{$lang->previous}">
						<span class="arrow-all arrow-all--reverce arrow-all--wide arrow-all--sm stroke-theme-target">
							<i class="svg inline stroke-dark-light" aria-hidden="true">
								<svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
								</svg>
							</i>
						</span>
					</a>
				{/if}

				{if $current_page_num > 2}
					<a href="{url page=$current_page_num - 1}" class="arrows-pagination__prev arrows-pagination__item rounded-x" title="{$lang->previous}">
						<span class="arrow-all arrow-all--reverce arrow-all--wide arrow-all--sm stroke-theme-target">
							<i class="svg inline stroke-dark-light" aria-hidden="true">
								<svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#left-7-12"></use>
								</svg>
							</i>
						</span>
					</a>
				{/if}

				{if $current_page_num < $total_pages_num}
					<a href="{url page=$current_page_num + 1}" class="arrows-pagination__next arrows-pagination__item rounded-x" title="{$lang->next}">
						<span class="arrow-all arrow-all--wide arrow-all--sm stroke-theme-target">
							<i class="svg inline stroke-dark-light" aria-hidden="true">
								<svg width="7" height="12">
									<use xlink:href="design/{$settings->theme|escape}/images/svg/sprite/arrows.svg#right-7-12"></use>
								</svg>
							</i>
						</span>
					</a>
				{/if}
			</div>

			{if $current_page_num == 1}
				<span class="cur module-pagination__item">1</span>
			{else}
				<a href="{url page=null}" class="module-pagination__item">1</a>
			{/if}

			{section name=pages loop=$page_to start=$page_from}
				{$p = $smarty.section.pages.index + 1}
				{if ($p == $page_from + 1 && $p != 2) || ($p == $page_to && $p != $total_pages_num - 1)}
					{if $p == $current_page_num}
						<span class="cur module-pagination__item">...</span>
					{else}
						<a href="{url page=$p}" class="module-pagination__item">...</a>
					{/if}
				{else}
					{if $p == $current_page_num}
						<span class="cur module-pagination__item">{$p}</span>
					{else}
						<a href="{url page=$p}" class="module-pagination__item">{$p}</a>
					{/if}
				{/if}
			{/section}

			{if $current_page_num == $total_pages_num}
				<span class="cur module-pagination__item">{$total_pages_num}</span>
			{else}
				<a href="{url page=$total_pages_num}" class="module-pagination__item">{$total_pages_num}</a>
			{/if}

			<a href="{url page=all}" class="module-pagination__item">{$lang->general_all}</a>
		</div>
	</div>
{/if}