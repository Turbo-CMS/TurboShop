{* CSS Head *}

{* CSS Main *}
{css id="main" include=[
	"design/{$settings->theme|escape}/vendor/bootstrap/bootstrap.css",
	"design/{$settings->theme|escape}/css/theme.css",
	"design/{$settings->theme|escape}/vendor/fontawesome/fontawesome.css",
	"design/{$settings->theme|escape}/vendor/flag-icon/flag-icon.min.css",
	"design/{$settings->theme|escape}/vendor/fancybox/fancybox.css",
	"design/{$settings->theme|escape}/css/products/products.css"
]}{/css}
{stylesheet minify=true}

{* CSS Product *}
{if $module == 'ProductView'}
	{css id="product" include=["design/{$settings->theme|escape}/css/products/product.css"]}{/css}
	{stylesheet minify=true}
{/if}

{* CSS Cart *}
{if $module=='CartView' || $module=='OrderView' }
	{css id="cart" include=["design/{$settings->theme|escape}/css/cart/cart.css"]}{/css}
	{stylesheet minify=true}
{/if}