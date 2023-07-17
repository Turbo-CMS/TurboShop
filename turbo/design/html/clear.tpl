{$meta_title = $btr->global_clear scope=global}

<div class="d-md-flex mb-3">
	<h1 class="d-inline align-middle me-3">{$btr->global_clear|escape}</h1>
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
						<div class="col-12">
							<div class="progress mb-1" style="display: none;">
								<div id="progressbar" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<div class="form-label">{$btr->site_cache|escape}</div>
								<a class="btn btn-danger clear-button" id="clear-site" href="javascript:void(0);">
									<i class="align-middle" data-feather="refresh-cw"></i> {$btr->clear_cache|escape}
								</a>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<div class="form-label">{$btr->admin_cache|escape}</div>
								<a class="btn btn-danger clear-button" id="clear-admin" href="javascript:void(0);">
									<i class="align-middle" data-feather="refresh-cw"></i> {$btr->clear_cache|escape}
								</a>
							</div>
						</div>
						<div class="col-xl-2 col-lg-3 col-md-4">
							<div class="mb-3 d-grid d-sm-block">
								<div class="form-label">{$btr->clear_resize_images|escape}</div>
								<a class="btn btn-danger clear-button" id="clear-resize" href="javascript:void(0);">
									<i class="align-middle" data-feather="refresh-cw"></i> {$btr->remove_resize_images|escape}
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

{* Piecon *}
{js id="piecon" priority=99 include=[
	"turbo/design/js/piecon/piecon.min.js"
]}{/js}
{javascript minify=true}

{literal}
	<script>
		$(document).on('click', '#clear-site', function() {
			Piecon.setOptions({fallback: 'force'});
			Piecon.setProgress(0);
			var progress_item = $("#progressbar");
			$(".progress").show();
			clear_site('', progress_item);
		});

		function clear_site(page, progress) {
			page = typeof(page) != 'undefined' ? page : 1;
			$.ajax({
				url: "ajax/clear_site.php",
				dataType: 'json',
				success: function(data) {
					if (data && !data.end) {
						Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
						progress.css('width', 100 * data.page / data.totalpages + '%');
						clear_site(data.page * 1 + 1, progress);
					} else {
						Piecon.setProgress(100);
						progress.css('width', '100%');
						$(".progress").fadeOut(500);
					}
				},
				error: function(xhr, status, errorThrown) {
					alert(errorThrown + '\n' + xhr.responseText);
				}
			});
		}

		$(document).on('click', '#clear-admin', function() {
			Piecon.setOptions({fallback: 'force'});
			Piecon.setProgress(0);
			var progress_item = $("#progressbar");
			$(".progress").show();
			clear_admin('', progress_item);
		});

		function clear_admin(page, progress) {
			page = typeof(page) != 'undefined' ? page : 1;
			$.ajax({
				url: "ajax/clear_admin.php",
				dataType: 'json',
				success: function(data) {
					if (data && !data.end) {
						Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
						progress.css('width', 100 * data.page / data.totalpages + '%');
						clear_admin(data.page * 1 + 1, progress);
					} else {
						Piecon.setProgress(100);
						progress.css('width', '100%');
						$(".progress").fadeOut(500);
					}
				},
				error: function(xhr, status, errorThrown) {
					alert(errorThrown + '\n' + xhr.responseText);
				}
			});
		}

		$(document).on('click', '#clear-resize', function() {
			Piecon.setOptions({fallback: 'force'});
			Piecon.setProgress(0);
			var progress_item = $("#progressbar");
			$(".progress").show();
			clear_resize('', progress_item);
		});

		function clear_resize(page, progress) {
			page = typeof(page) != 'undefined' ? page : 1;
			$.ajax({
				url: "ajax/clear_resize.php",
				dataType: 'json',
				success: function(data) {
					if (data && !data.end) {
						Piecon.setProgress(Math.round(100 * data.page / data.totalpages));
						progress.css('width', 100 * data.page / data.totalpages + '%');
						clear_resize(data.page * 1 + 1, progress);
					} else {
						Piecon.setProgress(100);
						progress.css('width', '100%');
						$(".progress").fadeOut(500);
					}
				},
				error: function(xhr, status, errorThrown) {
					alert(errorThrown + '\n' + xhr.responseText);
				}
			});
		}
	</script>
{/literal}