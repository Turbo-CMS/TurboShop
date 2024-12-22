{$meta_title = $btr->global_system scope=global}

<h1 class="mb-3">
	{$btr->global_system|escape}
</h1>

<div class="row gx-2">
	{if $php_version}
		<div class="col-12 col-md-6 col-xxl">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">PHP Version</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<h4 class="mt-0 mb-1">Version: <b>{$php_version|escape}</b></h4>
					</div>
				</div>
			</div>
		</div>
	{/if}
	{if $sql_info}
		<div class="col-12 col-md-6 col-xxl">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">SQL</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						{foreach $sql_info as $sql_param => $sql_ver}
							<h4 class="mt-0 mb-1">{$sql_param|escape}: <b>{$sql_ver|escape}</b></h4>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	{/if}
	{if $server_ip}
		<div class="col-12 col-md-6 col-xxl">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">{$btr->system_server_ip|escape}</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<h4 class="mt-0 mb-1">IP: <b>{$server_ip|escape}</b></h4>
					</div>
				</div>
			</div>
		</div>
	{/if}
</div>

{if $ini_params}
	<div class="row gx-2">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">INI params</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						{foreach $ini_params as $param_name => $param_value}
							<div>
								<span>{$param_name|escape}: </span>
								<span><b>{$param_value|escape}</b></span>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
		<div class="col-12">
			<div class="alert alert-primary alert-dismissible mb-2" role="alert">
				<div class="alert-message">
					<h4 class="alert-heading">{$btr->global_caution|escape}</h4>
					<div class="mb-1">{$btr->system_message_1|escape}</div>
					<div class="mb-1"><strong>{$btr->system_message_2|escape}</strong> </div>
					<ul class="mb-0 ps-3">
						<li class="mb-1"><strong>display_errors</strong> - {$btr->system_display_errors|escape}</li>
						<li class="mb-1"><strong>memory_limit</strong> - {$btr->system_memory_limit|escape}</li>
						<li class="mb-1"><strong>post_max_size</strong> - {$btr->system_post_max_size|escape}</li>
						<li class="mb-1"><strong>max_input_time</strong> - {$btr->system_max_input_time|escape}</li>
						<li class="mb-1"><strong>max_file-uploads</strong> - {$btr->system_max_file_uploads|escape}</li>
						<li class="mb-1"><strong>max_execution_time</strong> - {$btr->system_max_execution_time|escape}</li>
						<li class="mb-1"><strong>upload_max_filesize</strong> - {$btr->system_upload_max_filesize|escape}</li>
						<li class="mb-1"><strong>max_input_vars</strong> - {$btr->system_max_input_vars|escape}</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
{/if}

{if $all_extensions}
	<div class="row gx-2">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="card">
				<div class="card-header">
					<div class="card-actions float-end">
						<div class="d-block d-lg-none position-relative collapse-icon">
							<a href="javascript:;" class="collapse-chevron">
								<i class="align-middle" data-feather="chevron-up"></i>
							</a>
						</div>
					</div>
					<h5 class="card-title mb-0">Server extensions</h5>
				</div>
				<div class="collapse-card">
					<div class="card-body">
						<div class="row">
							{foreach $all_extensions as $ext_val}
								<div class="col-xl-3 col-lg-4 col-md-6">
									<div>
										<span {if in_array($ext_val|lower,['curl','memcache','memcached','json','php_zip','zip','gd','mysqli','imagick','openssl','zlib','xmlreader','xmlwriter']) }class="fw-bold" {/if}>{$ext_val|escape}{assign var='req_'|cat:$ext_val|lower value="1"}</span>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{/if}