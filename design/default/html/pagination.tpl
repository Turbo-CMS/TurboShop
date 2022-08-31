{* Pagination *}

{if $total_pages_num>1}

	<!-- Pagination -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			{$visible_pages = 11}

			{$page_from = 1}

			{if $current_page_num> floor($visible_pages/2)}
				{$page_from = max(1, $current_page_num-floor($visible_pages/2)-1)}
			{/if}

			{if $current_page_num> $total_pages_num-ceil($visible_pages/2)}
				{$page_from = max(1, $total_pages_num-$visible_pages-1)}
			{/if}

			{$page_to = min($page_from+$visible_pages, $total_pages_num-1)}

			{if $current_page_num==2}<li class="page-item"><a class="page-link" href="{url page=null}">{$lang->previous}</a></li>{/if}
			{if $current_page_num>2}<li class="page-item"><a class="page-link" href="{url page=$current_page_num-1}">{$lang->previous}</a></li>{/if}

			<li class="page-item {if $current_page_num==1}active{/if}"><a class="page-link" href="{url page=null}">1</a></li>

			{section name=pages loop=$page_to start=$page_from}
				{$p = $smarty.section.pages.index+1}
				{if ($p == $page_from+1 && $p!=2) || ($p == $page_to && $p != $total_pages_num-1)}
					<li class="page-item {if $p==$current_page_num}active{/if}"><a class="page-link" href="{url page=$p}">...</a></li>
				{else}
					<li class="page-item {if $p==$current_page_num}active{/if}"><a class="page-link" href="{url page=$p}">{$p}</a></li>
				{/if}
			{/section}

			<li class="page-item  {if $current_page_num==$total_pages_num}active{/if}"><a class="page-link" href="{url page=$total_pages_num}">{$total_pages_num}</a></li>

			{if $current_page_num<$total_pages_num}<li class="page-item"><a class="page-link" href="{url page=$current_page_num+1}">{$lang->next}</a></li>{/if}
			<li class="page-item"><a class="page-link" href="{url page=all}">{$lang->general_all}</a></li>
		</ul>
	</nav>

{/if}