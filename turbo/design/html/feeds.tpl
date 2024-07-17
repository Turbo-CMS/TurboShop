{$meta_title = $btr->global_feeds scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_feeds|escape}</h1>
</div>

<div class="row">
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
				<h5 class="card-title mb-0">{$btr->global_parameters|escape}</h5>
			</div>
			<div class="collapse-card">
				<div class="card-body">
					<div class="row">
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<a class="btn btn-success" target="_blank" href="{$config->root_url}/{$lang_link}feeds/feed.xml">
									<i class="align-middle me-1" data-feather="external-link"></i>
									{$btr->global_xml_feed|escape}
								</a>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<a class="btn btn-success" target="_blank" href="{$config->root_url}/{$lang_link}feeds/rozetka.xml">
									<i class="align-middle me-1" data-feather="external-link"></i>
									Rozetka
								</a>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<a class="btn btn-success" target="_blank" href="{$config->root_url}/{$lang_link}feeds/google.xml">
									<i class="align-middle me-1" data-feather="external-link"></i>
									Google Merchant
								</a>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<a class="btn btn-danger" target="_blank" href="{$config->root_url}/{$lang_link}feeds/rss.xml">
									<i class="align-middle me-1" data-feather="rss"></i>
									RSS
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>