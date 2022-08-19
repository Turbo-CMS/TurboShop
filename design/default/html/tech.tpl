<html>
<title>{$settings->site_name}</title>

<body>
	<div class="site_off_logo">
		<img src="{$config->root_url}/design/{$settings->theme}/images/logo.png">
	</div>
	<div class="site_off_text">
		{$lang->site_closed}
	</div>
	<div class="site_off_text_small">
		{$lang->apologize}
	</div>
</body>

</html>
{literal}
	<style>
		html,
		body {
			font-family: tahoma, verdana;
		}

		.site_off_logo {
			display: flex;
			align-content: center;
			justify-content: center;
		}

		.site_off_text {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 12px;
			font-size: 32px;
		}

		.site_off_text_small {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 12px;
			font-size: 20px;
		}
	</style>
{/literal}