<html>
<title>{$settings->site_name}</title>

<body>
	<div class="site-off-logo">
		<img src="{$config->root_url}/design/{$settings->theme}/images/logo.png">
	</div>
	<div class="site-off-text">
		{$lang->site_closed|escape}
	</div>
	<div class="site-off-text-small">
		{$lang->apologize|escape}
	</div>
</body>

</html>

{literal}
	<style>
		html,
		body {
			font-family: tahoma, verdana;
		}

		.site-off-logo {
			display: flex;
			align-content: center;
			justify-content: center;
		}

		.site-off-text {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 12px;
			font-size: 32px;
		}

		.site-off-text-small {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 12px;
			font-size: 20px;
		}
	</style>
{/literal}