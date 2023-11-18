<a class="btn btn-outline-secondary dropdown-toggle" href="#" role="button" id="sortBy" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	{$lang->sort_by}
</a>
<div class="dropdown-menu" aria-labelledby="sortBy">
	<a class="dropdown-item {if $sort=='position'}active{/if}" href="{furl sort=position page=null}">{$lang->default}</a>
	<a class="dropdown-item {if $sort=='name'}active{/if}" href="{furl sort=name page=null}">{$lang->name_a_z}</a>
	<a class="dropdown-item {if $sort=='name_desc'}active{/if}" href="{furl sort=name_desc page=null}">{$lang->name_z_a}</a>
	<a class="dropdown-item {if $sort=='price'}active{/if}" href="{furl sort=price page=null}">{$lang->cheap_expensive}</a>
	<a class="dropdown-item {if $sort=='price_desc'}active{/if}" href="{furl sort=price_desc page=null}">{$lang->expensive_cheap}</a>
	<a class="dropdown-item {if $sort=='rating'}active{/if}" href="{furl sort=rating page=null}">{$lang->by_rating}</a>
</div>