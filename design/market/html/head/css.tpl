{* CSS Head *}

{* CSS Main*}
{css id="main" include=[
	"design/{$settings->theme|escape}/css/theme.css",
	"design/{$settings->theme|escape}/vendor/fontawesome/fontawesome.css",
	"design/{$settings->theme|escape}/css/style.css"
]}{/css}
{stylesheet minify=true}

{* CSS Products *}
{css id="products" include=["design/{$settings->theme|escape}/css/products/products.css"]}{/css}
{stylesheet minify=true}

{* CSS Product *}
{if $module == 'ProductView'}
	{css id="product" include=["design/{$settings->theme|escape}/css/products/product.css"]}{/css}
	{stylesheet minify=true}
{/if}
