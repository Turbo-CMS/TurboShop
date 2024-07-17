{if $pages_count>1}
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center mt-3">

			{$visible_pages = 5}

			{$page_from = 1}

			{if $current_page > floor($visible_pages/2)}
				{$page_from = max(1, $current_page-floor($visible_pages/2)-1)}
			{/if}

			{if $current_page > $pages_count-ceil($visible_pages/2)}
				{$page_from = max(1, $pages_count-$visible_pages-1)}
			{/if}

			{$page_to = min($page_from+$visible_pages, $pages_count-1)}

			{if $current_page>1}
				<li class="page-item chevron-icon">
					<a id="PrevLink" class="page-link" href="{url page=$current_page-1}"><i class="align-middle" data-feather="chevron-left"></i></a>
				</li>
			{/if}

			<li class="page-item {if $current_page==1}active{/if}">
				<a class="page-link" href="{url page=null}">1</a>
			</li>

			{section name=pages loop=$page_to start=$page_from}
				{$p = $smarty.section.pages.index+1}
				<li class="page-item {if $p==$current_page}active{/if}">
					{if ($p == $page_from+1 && $p!=2) || ($p == $page_to && $p != $pages_count-1)}
						<a class="page-link" href="{url page=$p}">...</a>
					{else}
						<a class="page-link" href="{url page=$p}">{$p}</a>
					{/if}
				</li>
			{/section}

			<li class="page-item {if $current_page == $pages_count}active{/if}">
				<a class="page-link" href="{url page=$pages_count}">{$pages_count}</a>
			</li>

			{if $current_page<$pages_count}
				<li class="page-item chevron-icon">
					<a id="NextLink" class="page-link" href="{url page=$current_page+1}"><i class="align-middle" data-feather="chevron-right"></i></a>
				</li>
			{/if}

			<li class="page-item">
				<a class="page-link" href="{url page=all}">{$btr->pagination_show_all|escape}</a>
			</li>

		</ul>
	</nav>
{/if}