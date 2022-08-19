{if $pages_count>1}
	<!-- Pagination -->
	<ul class="pagination">

		{* Number of output links to pages *}
		{$visible_pages = 5}

		{* By default, we start output from page 1 *}
		{$page_from = 1}

		{* If the page selected by the user is further than the middle of the "window" - we start the output not from the first one *}
		{if $current_page > floor($visible_pages/2)}
			{$page_from = max(1, $current_page-floor($visible_pages/2)-1)}
		{/if}

		{* If the page selected by the user is close to the end of navigation, we start with "end - window" *}
		{if $current_page > $pages_count-ceil($visible_pages/2)}
			{$page_from = max(1, $pages_count-$visible_pages-1)}
		{/if}

		{* To which page to display - we display the entire window, but no more than the total number of pages *}
		{$page_to = min($page_from+$visible_pages, $pages_count-1)}

		{if $current_page>1}
			<li class="page-item">
				<a id="PrevLink" href="{url page=$current_page-1}"><i class="icon-chevron-left"></i></a>
			</li>
		{/if}

		{* The link to 1 page is always displayed *}
		<li class="page-item {if $current_page==1}active{/if}">
			<a class="page-link {if $current_page==1}selected{else}droppable{/if}" href="{url page=1}">1</a>
		</li>
		{* Displaying the pages of our "window" *}
		{section name=pages loop=$page_to start=$page_from}
			{* Number of the currently displayed page *}
			{$p = $smarty.section.pages.index+1}
			{* For the extreme pages of the "window", output a three-dot if the window is not near the navigation border *}
			<li class="page-item {if $p==$current_page}active{/if}">
				{if ($p == $page_from+1 && $p!=2) || ($p == $page_to && $p != $pages_count-1)}
					<a class="page-link" href="{url page=$p}">...</a>
				{else}
					<a class="{if $p!=$current_page}droppable{/if}" href="{url page=$p}">{$p}</a>
				{/if}
			</li>
		{/section}

		{* The link to the last page is always displayed *}
		<li class="page-item {if $current_page == $pages_count}active{/if}">
			<a class="{if $current_page!=$pages_count}droppable{/if}" href="{url page=$pages_count}">{$pages_count}</a>
		</li>

		{if $current_page<$pages_count}
			<li class="page-item">
				<a id="NextLink" href="{url page=$current_page+1}"><i class="icon-chevron-right"></i></a>
			</li>
		{/if}
		<li class="page-item">
			<a href="{url page=all}">{$btr->pagination_show_all|escape}</a>
		</li>

	</ul>
	<!-- Pagination (The End) -->
{/if}