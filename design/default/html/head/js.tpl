{* JS Head *}

{* JS jQuery & Bootstrap *}
{js id="main" priority=99 include=[
	"design/{$settings->theme|escape}/js/jquery/jquery.min.js",
	"design/{$settings->theme|escape}/vendor/bootstrap/bootstrap.bundle.js"
]}{/js}
{javascript minify=true}

{* Custom Scripts Head *}
{if $counters['head']}
	{foreach $counters['head'] as $counter}
		{$counter->code}
	{/foreach}
{/if}