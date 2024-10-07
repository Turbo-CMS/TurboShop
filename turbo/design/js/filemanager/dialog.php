<?php

$time = time();

$config = include 'config/config.php';

if (USE_ACCESS_KEYS == true) {
	if (!isset($_GET['akey'], $config['access_keys']) || empty($config['access_keys'])) {
		die('Access Denied!');
	}

	$_GET['akey'] = strip_tags(preg_replace("/[^a-zA-Z0-9\._-]/", '', $_GET['akey']));

	if (!in_array($_GET['akey'], $config['access_keys'])) {
		die('Access Denied!');
	}
}

$_SESSION['RF']["verify"] = "RESPONSIVEfilemanager";

if (!empty($_FILES)) {
	$directorio = $config['current_path'];
	if (!file_exists($directorio)) {
		mkdir($directorio);
	}

	$sExtension = pathinfo($_FILES['upload']['name'], PATHINFO_EXTENSION);
	$newname = str_replace('.' . $sExtension, '', $_FILES['upload']['name']) . '_' . time() . '.' . $sExtension;
	if (move_uploaded_file($_FILES['upload']['tmp_name'], $directorio . $newname)) {
		header('Content-type: application/json; charset=utf-8');
		echo json_encode([
			'fileName' => $newname,
			'uploaded' => 1,
			'url' => $config['base_url'] . $config['upload_dir'] . $newname,
		]);
		exit();
	}
}

if (isset($_POST['submit'])) {
	include 'upload.php';
} else {
	$available_languages = include 'lang/languages.php';

	list($preferred_language) = array_values(
		array_filter(
			[
				$_GET['lang'] ?? null,
				$_SESSION['RF']['language'] ?? null,
				$config['default_language']
			]
		)
	);

	if (array_key_exists($preferred_language, $available_languages)) {
		$_SESSION['RF']['language'] = $preferred_language;
	} else {
		$_SESSION['RF']['language'] = $config['default_language'];
	}
}

include 'include/utils.php';

$subdir_path = '';

if (isset($_GET['fldr']) && !empty($_GET['fldr'])) {
	$subdir_path = rawurldecode(trim(strip_tags($_GET['fldr']), "/"));
} elseif (isset($_SESSION['RF']['fldr']) && !empty($_SESSION['RF']['fldr'])) {
	$subdir_path = rawurldecode(trim(strip_tags($_SESSION['RF']['fldr']), "/"));
}

if (checkRelativePath($subdir_path)) {
	$subdir = strip_tags($subdir_path) . "/";
	$_SESSION['RF']['fldr'] = $subdir_path;
	$_SESSION['RF']["filter"] = '';
} else {
	$subdir = '';
}

if ($subdir == "") {
	if (!empty($_COOKIE['last_position']) && strpos($_COOKIE['last_position'], '.') === false) {
		$subdir = trim($_COOKIE['last_position']);
	}
}
//remember last position
setcookie('last_position', $subdir, time() + (86400 * 7));

if ($subdir == "/") {
	$subdir = "";
}

// If hidden folders are specified
if (count($config['hidden_folders'])) {
	// If hidden folder appears in the path specified in URL parameter "fldr"
	$dirs = explode('/', $subdir);
	foreach ($dirs as $dir) {
		if ($dir !== '' && in_array($dir, $config['hidden_folders'])) {
			// Ignore the path
			$subdir = "";
			break;
		}
	}
}

if ($config['show_total_size']) {
	list($sizeCurrentFolder, $fileCurrentNum, $foldersCurrentCount) = folder_info($config['current_path'], false);
}

/***
 * SUB-DIR CODE
 ***/
if (!isset($_SESSION['RF']["subfolder"])) {
	$_SESSION['RF']["subfolder"] = '';
}
$rfm_subfolder = '';

if (
	!empty($_SESSION['RF']["subfolder"])
	&& strpos($_SESSION['RF']["subfolder"], "/") !== 0
	&& strpos($_SESSION['RF']["subfolder"], '.') === false
) {
	$rfm_subfolder = $_SESSION['RF']['subfolder'];
}

if ($rfm_subfolder != "" && $rfm_subfolder[strlen($rfm_subfolder) - 1] != "/") {
	$rfm_subfolder .= "/";
}

$ftp = ftp_con($config);

if (($ftp && !$ftp->isDir(
	$config['ftp_base_folder'] . $config['upload_dir'] . $rfm_subfolder . $subdir
)) || (!$ftp && !file_exists($config['current_path'] . $rfm_subfolder . $subdir))) {
	$subdir = '';
	$rfm_subfolder = "";
}


$cur_dir = $config['upload_dir'] . $rfm_subfolder . $subdir;
$cur_dir_thumb = $config['thumbs_upload_dir'] . $rfm_subfolder . $subdir;
$thumbs_path = $config['thumbs_base_path'] . $rfm_subfolder . $subdir;
$parent = $rfm_subfolder . $subdir;

if ($ftp) {
	$cur_dir = $config['ftp_base_folder'] . $cur_dir;
	$cur_dir_thumb = $config['ftp_base_folder'] . $cur_dir_thumb;
	$thumbs_path = str_replace(['/..', '..'], '', $cur_dir_thumb);
	$parent = $config['ftp_base_folder'] . $parent;
}

if (!$ftp) {
	$cycle = true;
	$max_cycles = 50;
	$i = 0;
	while ($cycle && $i < $max_cycles) {
		$i++;

		if ($parent == "./") {
			$parent = "";
		}

		if (file_exists($config['current_path'] . $parent . "config.php")) {
			$configMain = $config;
			$configTemp = include $config['current_path'] . $parent . 'config.php';
			if (is_array($configTemp) && count($configTemp) > 0) {
				$config = array_merge($configMain, $configTemp);
				$config['ext'] = array_merge(
					$config['ext_img'],
					$config['ext_file'],
					$config['ext_misc'],
					$config['ext_video'],
					$config['ext_music']
				);
			} else {
				$config = $configMain;
			}
			$cycle = false;
		}

		if ($parent == "") {
			$cycle = false;
		} else {
			$parent = fix_dirname($parent) . "/";
		}
	}

	if (!is_dir($thumbs_path)) {
		create_folder(false, $thumbs_path, $ftp, $config);
	}
}

$multiple = null;

if (isset($_GET['multiple'])) {
	if ($_GET['multiple'] == 1) {
		$multiple = 1;
		$config['multiple_selection'] = true;
		$config['multiple_selection_action_button'] = true;
	} elseif ($_GET['multiple'] == 0) {
		$multiple = 0;
		$config['multiple_selection'] = false;
		$config['multiple_selection_action_button'] = false;
	}
}

if (isset($_GET['callback'])) {
	$callback = strip_tags($_GET['callback']);
	$_SESSION['RF']["callback"] = $callback;
} else {
	$callback = 0;

	if (isset($_SESSION['RF']["callback"])) {
		$callback = $_SESSION['RF']["callback"];
	}
}

$popup = isset($_GET['popup']) ? strip_tags($_GET['popup']) : 0;
//Sanitize popup
$popup = !!$popup;

$crossdomain = isset($_GET['crossdomain']) ? strip_tags($_GET['crossdomain']) : 0;
//Sanitize crossdomain
$crossdomain = !!$crossdomain;

//view type
if (!isset($_SESSION['RF']["view_type"])) {
	$view = $config['default_view'];
	$_SESSION['RF']["view_type"] = $view;
}

if (isset($_GET['view'])) {
	$view = fix_get_params($_GET['view']);
	$_SESSION['RF']["view_type"] = $view;
}

$view = $_SESSION['RF']["view_type"];

//filter
$filter = "";
if (isset($_SESSION['RF']["filter"])) {
	$filter = $_SESSION['RF']["filter"];
}

if (isset($_GET["filter"])) {
	$filter = fix_get_params($_GET["filter"]);
}

if (!isset($_SESSION['RF']['sort_by'])) {
	$_SESSION['RF']['sort_by'] = 'name';
}

if (isset($_GET["sort_by"])) {
	$sort_by = $_SESSION['RF']['sort_by'] = fix_get_params($_GET["sort_by"]);
} else {
	$sort_by = $_SESSION['RF']['sort_by'];
}

if (!isset($_SESSION['RF']['descending'])) {
	$_SESSION['RF']['descending'] = true;
}

if (isset($_GET["descending"])) {
	$descending = $_SESSION['RF']['descending'] = fix_get_params($_GET["descending"]) == 1;
} else {
	$descending = $_SESSION['RF']['descending'];
}

$boolarray = [false => 'false', true => 'true'];

$return_relative_url = isset($_GET['relative_url']) && $_GET['relative_url'] == "1";

if (!isset($_GET['type'])) {
	$_GET['type'] = 0;
}

$extensions = null;
if (isset($_GET['extensions'])) {
	$extensions = json_decode(urldecode($_GET['extensions']));
	$ext_tmp = [];
	foreach ($extensions as $extension) {
		$extension = fix_strtolower($extension);
		if (check_file_extension($extension, $config)) {
			$ext_tmp[] = $extension;
		}
	}
	if ($extensions) {
		$ext = $ext_tmp;
		$config['ext'] = $ext_tmp;
		$config['show_filter_buttons'] = false;
	}
}

if (isset($_GET['editor'])) {
	$editor = strip_tags($_GET['editor']);
} else {
	$editor = $_GET['type'] == 0 ? null : 'tinymce';
}

$field_id = isset($_GET['field_id']) ? fix_get_params($_GET['field_id']) : null;
$type_param = fix_get_params($_GET['type']);
$apply = null;

if ($multiple) {
	$apply = 'apply_multiple';
}

if ($type_param == 1) {
	$apply_type = 'apply_img';
} elseif ($type_param == 2) {
	$apply_type = 'apply_link';
} elseif ($type_param == 0 && !$field_id) {
	$apply_type = 'apply_none';
} elseif ($type_param == 3) {
	$apply_type = 'apply_video';
} else {
	$apply_type = 'apply';
}

if (!$apply) {
	$apply = $apply_type;
}

$content_css = isset($_GET['content_css']) ? $_GET['content_css'] : null;

$get_params = [
	'editor' => $editor,
	'type' => $type_param,
	'lang' => $lang,
	'popup' => $popup,
	'crossdomain' => $crossdomain,
	'extensions' => ($extensions) ? urlencode(json_encode($extensions)) : null,
	'field_id' => $field_id,
	'multiple' => $multiple,
	'content_css' => $content_css,
	'relative_url' => $return_relative_url,
	'akey' => (isset($_GET['akey']) && $_GET['akey'] != '' ? $_GET['akey'] : 'key')
];
if (isset($_GET['CKEditorFuncNum'])) {
	$get_params['CKEditorFuncNum'] = $_GET['CKEditorFuncNum'];
	$get_params['CKEditor'] = ($_GET['CKEditor'] ?? '');
}
$get_params['fldr'] = '';

$get_params = http_build_query($get_params);
?>
<!DOCTYPE html>
<html <?php if ($content_css === 'dark') echo 'data-bs-theme="dark"'; ?>>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="robots" content="noindex,nofollow">
	<title>Responsive FileManager</title>
	<link rel="shortcut icon" href="img/ico/favicon.ico">
	<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
	<link rel="stylesheet" href="css/jquery.fileupload.css">
	<link rel="stylesheet" href="css/jquery.fileupload-ui.css">
	<!-- CSS adjustments for browsers with JavaScript disabled -->
	<noscript>
		<link rel="stylesheet" href="css/jquery.fileupload-noscript.css">
	</noscript>
	<noscript>
		<link rel="stylesheet" href="css/jquery.fileupload-ui-noscript.css">
	</noscript>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jplayer/2.7.1/skin/blue.monday/jplayer.blue.monday.min.css" />
	<link href="css/style.css?v=<?php echo $version; ?>" rel="stylesheet" type="text/css" />
	<!--[if lt IE 8]>
    <style>
        .img-container span, .img-container-mini span {
            display: inline-block;
            height: 100%;
        }
    </style>
    <![endif]-->

	<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
	<script src="js/plugins.js?v=<?php echo $version; ?>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jplayer/2.9.2/jplayer/jquery.jplayer.min.js"></script>
	<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/fabric.js/3.6.0/fabric.js'></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
	<script src="js/modernizr.custom.js"></script>
	<script src="js/bootstrap.bundle.js"></script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.6.2/html5shiv.js"></script>
    <![endif]-->
	<!-- Only load TUI Libraries if we need it -->

	<script src="js/include.js?v=<?php echo $version; ?>"></script>
	<script>
		$(function() {
			$('[data-bs-toggle="tooltip"]').tooltip();
		});
	</script>
</head>

<body>
	<!-- The Templates plugin is included to render the upload/download listings -->
	<script src="//blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
	<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/blueimp-load-image/2.18.0/load-image.all.min.js"></script>
	<!-- The Canvas to Blob plugin is included for image resizing functionality -->
	<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
	<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
	<script src="js/jquery.iframe-transport.js"></script>
	<!-- The basic File Upload plugin -->
	<script src="js/jquery.fileupload.js"></script>
	<!-- The File Upload processing plugin -->
	<script src="js/jquery.fileupload-process.js"></script>
	<!-- The File Upload image preview & resize plugin -->
	<script src="js/jquery.fileupload-image.js"></script>
	<!-- The File Upload audio preview plugin -->
	<script src="js/jquery.fileupload-audio.js"></script>
	<!-- The File Upload video preview plugin -->
	<script src="js/jquery.fileupload-video.js"></script>
	<!-- The File Upload validation plugin -->
	<script src="js/jquery.fileupload-validate.js"></script>
	<!-- The File Upload user interface plugin -->
	<script src="js/jquery.fileupload-ui.js"></script>

	<input type="hidden" id="ftp" value="<?= !!$ftp; ?>" />
	<input type="hidden" id="popup" value="<?= $popup; ?>" />
	<input type="hidden" id="callback" value="<?= $callback; ?>" />
	<input type="hidden" id="crossdomain" value="<?= $crossdomain; ?>" />
	<input type="hidden" id="editor" value="<?= $editor; ?>" />
	<input type="hidden" id="view" value="<?= $view; ?>" />
	<input type="hidden" id="subdir" value="<?= $subdir; ?>" />
	<input type="hidden" id="field_id" value="<?= $field_id ? str_replace(['[', ']'], ['\[', '\]'], $field_id) : ''; ?>" />
	<input type="hidden" id="multiple" value="<?= $multiple; ?>" />
	<input type="hidden" id="type_param" value="<?= $type_param; ?>" />
	<input type="hidden" id="upload_dir" value="<?= $config['upload_dir']; ?>" />
	<input type="hidden" id="cur_dir" value="<?= $cur_dir; ?>" />
	<input type="hidden" id="cur_dir_thumb" value="<?= $cur_dir_thumb; ?>" />
	<input type="hidden" id="insert_folder_name" value="<?= trans('Insert_Folder_Name'); ?>" />
	<input type="hidden" id="rename_existing_folder" value="<?= trans('Rename_existing_folder'); ?>" />
	<input type="hidden" id="new_folder" value="<?= trans('New_Folder'); ?>" />
	<input type="hidden" id="ok" value="<?= trans('OK'); ?>" />
	<input type="hidden" id="cancel" value="<?= trans('Cancel'); ?>" />
	<input type="hidden" id="rename" value="<?= trans('Rename'); ?>" />
	<input type="hidden" id="lang_duplicate" value="<?= trans('Duplicate'); ?>" />
	<input type="hidden" id="duplicate" value="<?= $config['duplicate_files'] ? 1 : 0; ?>" />
	<input type="hidden" id="base_url" value="<?= $config['base_url']; ?>" />
	<input type="hidden" id="ftp_base_url" value="<?= $config['ftp_base_url']; ?>" />
	<input type="hidden" id="fldr_value" value="<?= $subdir; ?>" />
	<input type="hidden" id="sub_folder" value="<?= $rfm_subfolder; ?>" />
	<input type="hidden" id="return_relative_url" value="<?= $return_relative_url ? 1 : 0; ?>" />
	<input type="hidden" id="file_number_limit_js" value="<?= $config['file_number_limit_js']; ?>" />
	<input type="hidden" id="sort_by" value="<?= $sort_by; ?>" />
	<input type="hidden" id="descending" value="<?= $descending ? 1 : 0; ?>" />
	<input type="hidden" id="current_url" value="<?= str_replace(['&filter=' . $filter, '&sort_by=' . $sort_by, '&descending=' . intval($descending)], '', $config['base_url'] . htmlspecialchars($_SERVER['REQUEST_URI'])); ?>" />
	<input type="hidden" id="lang_show_url" value="<?= trans('Show_url'); ?>" />
	<input type="hidden" id="copy_cut_files_allowed" value="<?= $config['copy_cut_files'] ? 1 : 0; ?>" />
	<input type="hidden" id="copy_cut_dirs_allowed" value="<?= $config['copy_cut_dirs'] ? 1 : 0; ?>" />
	<input type="hidden" id="copy_cut_max_size" value="<?= $config['copy_cut_max_size']; ?>" />
	<input type="hidden" id="copy_cut_max_count" value="<?= $config['copy_cut_max_count']; ?>" />
	<input type="hidden" id="lang_copy" value="<?= trans('Copy'); ?>" />
	<input type="hidden" id="lang_cut" value="<?= trans('Cut'); ?>" />
	<input type="hidden" id="lang_paste" value="<?= trans('Paste'); ?>" />
	<input type="hidden" id="lang_paste_here" value="<?= trans('Paste_Here'); ?>" />
	<input type="hidden" id="lang_paste_confirm" value="<?= trans('Paste_Confirm'); ?>" />
	<input type="hidden" id="lang_files" value="<?= trans('Files'); ?>" />
	<input type="hidden" id="lang_folders" value="<?= trans('Folders'); ?>" />
	<input type="hidden" id="lang_files_on_clipboard" value="<?= trans('Files_ON_Clipboard'); ?>" />
	<input type="hidden" id="clipboard" value="<?= isset($_SESSION['RF']['clipboard']['path']) && trim($_SESSION['RF']['clipboard']['path']) ? 1 : 0; ?>" />
	<input type="hidden" id="lang_clear_clipboard_confirm" value="<?= trans('Clear_Clipboard_Confirm'); ?>" />
	<input type="hidden" id="lang_file_permission" value="<?= trans('File_Permission'); ?>" />
	<input type="hidden" id="chmod_files_allowed" value="<?= $config['chmod_files'] ? 1 : 0; ?>" />
	<input type="hidden" id="chmod_dirs_allowed" value="<?= $config['chmod_dirs'] ? 1 : 0; ?>" />
	<input type="hidden" id="lang_lang_change" value="<?= trans('Lang_Change'); ?>" />
	<input type="hidden" id="edit_text_files_allowed" value="<?= $config['edit_text_files'] ? 1 : 0; ?>" />
	<input type="hidden" id="lang_edit_file" value="<?= trans('Edit_File'); ?>" />
	<input type="hidden" id="lang_new_file" value="<?= trans('New_File'); ?>" />
	<input type="hidden" id="lang_filename" value="<?= trans('Filename'); ?>" />
	<input type="hidden" id="lang_file_info" value="<?= fix_strtoupper(trans('File_info')); ?>" />
	<input type="hidden" id="lang_edit_image" value="<?= trans('Edit_image'); ?>" />
	<input type="hidden" id="lang_error_upload" value="<?= trans('Error_Upload'); ?>" />
	<input type="hidden" id="lang_select" value="<?= trans('Select'); ?>" />
	<input type="hidden" id="lang_extract" value="<?= trans('Extract'); ?>" />
	<input type="hidden" id="extract_files" value="<?= $config['extract_files'] ? 1 : 0; ?>" />
	<input type="hidden" id="transliteration" value="<?= $config['transliteration'] ? 'true' : 'false'; ?>" />
	<input type="hidden" id="convert_spaces" value="<?= $config['convert_spaces'] ? 'true' : 'false'; ?>" />
	<input type="hidden" id="replace_with" value="<?= $config['convert_spaces'] ? $config['replace_with'] : ''; ?>" />
	<input type="hidden" id="lower_case" value="<?= $config['lower_case'] ? 'true' : 'false'; ?>" />
	<input type="hidden" id="show_folder_size" value="<?= $config['show_folder_size']; ?>" />
	<input type="hidden" id="add_time_to_img" value="<?= $config['add_time_to_img']; ?>" />

	<!-- Uploader -->
	<div class="modal fade uploader" id="uploader" tabindex="-1" aria-labelledby="uploader" aria-hidden="true">
		<div class="modal-dialog modal-fullscreen">
			<div class="modal-content">
				<div class="modal-body">
					<section class="text-center container">
						<div class="row py-1">
							<div class="col-lg-6 col-md-8 mx-auto">
								<a href="#" class="btn btn-secondary my-2 close-uploader">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left btn-icon">
										<line x1="19" y1="12" x2="5" y2="12"></line>
										<polyline points="12 19 5 12 12 5"></polyline>
									</svg>
									<?= trans('Return_Files_List'); ?>
								</a>
							</div>
						</div>
					</section>
					<div class="px-2 pt-5 pb-2 mb-4 border-dashed border-2 rounded-3" id="baseUpload">
						<!-- The file upload form used as target for the file upload widget -->
						<form id="fileupload" action="" method="POST" enctype="multipart/form-data">
							<div class="fileupload-progress px-3">
								<div class="progress" role="progressbar" aria-label="Animated striped example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
									<div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
								</div>
								<!-- The extended global progress state -->
								<div class="progress-extended"></div>
							</div>
							<div class="container-fluid py-5">
								<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5 fileupload-buttonbar">
									<button type="button" class="btn btn-secondary px-4 me-sm-3 fileinput-button">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus btn-icon">
											<line x1="12" y1="5" x2="12" y2="19"></line>
											<line x1="5" y1="12" x2="19" y2="12"></line>
										</svg>
										<?= trans('Upload_add_files'); ?>
										<input type="file" name="files[]" multiple="multiple" accept="<?= '.' . implode(',.', $config['ext']); ?>">
									</button>
									<button type="submit" class="btn btn-primary px-4 start">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload btn-icon me-1">
											<path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
											<polyline points="17 8 12 3 7 8"></polyline>
											<line x1="12" y1="3" x2="12" y2="15"></line>
										</svg>
										<?= trans('Upload_start'); ?>
									</button>
									<!-- The global file processing state -->
									<span class="fileupload-process"></span>
								</div>
								<!-- The table listing the files available for upload/download -->
								<div id="filesTable" class="table-responsive">
									<table role="presentation" class="table table-striped table-hover border-top-table table-sm">
										<tbody class="files"></tbody>
									</table>
								</div>
							</div>
						</form>
						<div class="text-center text-body-secondary">
							<small><?= trans('Upload_base_help'); ?></small>
						</div>
						<!-- The template to display files available for upload -->
						<script id="template-upload" type="text/x-tmpl">
							{% for (var i=0, file; file=o.files[i]; i++) { %}
								<tr class="template-upload">
									<td>
										<span class="preview"></span>
									</td>
									<td class="name">
										<p>{%=file.relativePath%}{%=file.name%}</p>
										<strong class="error text-danger"></strong>
									</td>
									<td>
										<p class="size">Processing...</p>
										<div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-striped progress-bar-animated" style="width:0%;"></div></div>
									</td>
									<td>
										{% if (!i && !o.options.autoUpload) { %}
											<button class="btn btn-uploader start">
												<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" y1="3" x2="12" y2="15"></line></svg>
											</button>
										{% } %}
										{% if (!i) { %}
											<button class="btn btn-uploader cancel">
												<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
											</button>
										{% } %}
									</td>
								</tr>
							{% } %}
						</script>
						<!-- The template to display files available for download -->
						<script id="template-download" type="text/x-tmpl">
							{% for (var i=0, file; file=o.files[i]; i++) { %}
								{% if (file.error) { %}
									<tr class="template-download table-danger">
								{% } else { %}
									<tr class="template-download table-success">
								{% } %}
									<td>
										<span class="preview">
											{% if (file.error) { %}
												<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
											{% } else { %}
												<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
											{% } %}
										</span>
									</td>
									<td>
										<p class="name">
											{% if (file.url) { %}
												<a href="{%=file.url%}" class="text-reset text-decoration-none" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
											{% } else { %}
												<span>{%=file.name%}</span>
											{% } %}
										</p>
										{% if (file.error) { %}
											<div><span class="text-error">Error</span> {%=file.error%}</div>
										{% } %}
									</td>
									<td>
										<span class="size">{%=o.formatFileSize(file.size)%}</span>
									</td>
									<td></td>
								</tr>
							{% } %}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<?php
		$class_ext = '';
		$src = '';
		if ($ftp) {
			try {
				$files = $ftp->scanDir($config['ftp_base_folder'] . $config['upload_dir'] . $rfm_subfolder . $subdir);
				if (!$ftp->isDir($config['ftp_base_folder'] . $config['ftp_thumbs_dir'] . $rfm_subfolder . $subdir)) {
					create_folder(
						false,
						$config['ftp_base_folder'] . $config['ftp_thumbs_dir'] . $rfm_subfolder . $subdir,
						$ftp,
						$config
					);
				}
			} catch (FtpClient\FtpException $e) {
				echo "Error: ";
				echo $e->getMessage();
				echo "<br/>Please check configurations";
				die();
			}
		} else {
			$files = scandir($config['current_path'] . $rfm_subfolder . $subdir);
		}

		$n_files = count($files);

		//php sorting
		$sorted = [];
		//$current_folder=array();
		//$prev_folder=array();
		$current_files_number = 0;
		$current_folders_number = 0;

		foreach ($files as $k => $file) {
			if ($ftp) {
				$date = strtotime($file['day'] . " " . $file['month'] . " " . date('Y') . " " . $file['time']);
				$size = $file['size'];
				if ($file['type'] == 'file') {
					$current_files_number++;
					$file_ext = substr(strrchr($file['name'], '.'), 1);
					$is_dir = false;
				} else {
					$current_folders_number++;
					$file_ext = trans('Type_dir');
					$is_dir = true;
				}
				$sorted[$k] = [
					'is_dir' => $is_dir,
					'file' => $file['name'],
					'file_lcase' => strtolower($file['name']),
					'date' => $date,
					'size' => $size,
					'permissions' => $file['permissions'],
					'extension' => fix_strtolower($file_ext)
				];
			} else {
				if ($file != "." && $file != "..") {
					if (is_dir($config['current_path'] . $rfm_subfolder . $subdir . $file)) {
						$date = filemtime($config['current_path'] . $rfm_subfolder . $subdir . $file);
						if (!($file == '.' || substr($file, 0, 1) == '.' ||
							(isset($file_array['extension']) && $file_array['extension'] == fix_strtolower(
								trans('Type_dir')
							)) ||
							(isset($file_array['extension']) && $file_array['extension'] != fix_strtolower(
								trans('Type_dir')
							)) ||
							($file == '..' && $subdir == '') ||
							in_array($file, $config['hidden_folders']) ||
							($filter != '' && $n_files > $config['file_number_limit_js'] && $file != ".." && stripos(
								$file,
								$filter
							) === false))) {
							$current_folders_number++;
						}
						if ($config['show_folder_size']) {
							list($size, $nfiles, $nfolders) = folder_info(
								$config['current_path'] . $rfm_subfolder . $subdir . $file,
								false
							);
						} else {
							$size = 0;
						}
						$file_ext = trans('Type_dir');
						$sorted[$k] = [
							'is_dir' => true,
							'file' => $file,
							'file_lcase' => strtolower($file),
							'date' => $date,
							'size' => $size,
							'permissions' => '',
							'extension' => fix_strtolower($file_ext)
						];

						if ($config['show_folder_size']) {
							$sorted[$k]['nfiles'] = $nfiles;
							$sorted[$k]['nfolders'] = $nfolders;
						}
					} else {
						$current_files_number++;
						$file_path = $config['current_path'] . $rfm_subfolder . $subdir . $file;
						$date = filemtime($file_path);
						$size = filesize($file_path);
						$file_ext = substr(strrchr($file, '.'), 1);
						$sorted[$k] = [
							'is_dir' => false,
							'file' => $file,
							'file_lcase' => strtolower($file),
							'date' => $date,
							'size' => $size,
							'permissions' => '',
							'extension' => strtolower($file_ext)
						];
					}
				}
			}
		}

		switch ($sort_by) {
			case 'date':
				//usort($sorted, 'dateSort');
				usort($sorted, function ($x, $y) use ($descending) {
					if ($x['is_dir'] !== $y['is_dir']) {
						return $y['is_dir'] ? 1 : -1;
					} else {
						return ($descending)
							?  $x['date'] <=> $y['date']
							:  $y['date'] <=> $x['date'];
					}
				});
				break;
			case 'size':
				//usort($sorted, 'sizeSort');
				usort($sorted, function ($x, $y) use ($descending) {
					if ($x['is_dir'] !== $y['is_dir']) {
						return $y['is_dir'] ? 1 : -1;
					} else {
						return ($descending)
							?  $x['size'] <=> $y['size']
							:  $y['size'] <=> $x['size'];
					}
				});
				break;
			case 'extension':
				//usort($sorted, 'extensionSort');
				usort($sorted, function ($x, $y) use ($descending) {
					if ($x['is_dir'] !== $y['is_dir']) {
						return $y['is_dir'] ? 1 : -1;
					} else {
						return ($descending)
							?  $x['extension'] <=> $y['extension']
							:  $y['extension'] <=> $x['extension'];
					}
				});
				break;
			default:
				// usort($sorted, 'filenameSort');
				usort($sorted, function ($x, $y) use ($descending) {
					if ($x['is_dir'] !== $y['is_dir']) {
						return $y['is_dir'] ? 1 : -1;
					} else {
						return ($descending)
							? ($x['file_lcase'] < $y['file_lcase'] ? 1 : ($x['file_lcase'] == $y['file_lcase'] ? 0 : -1))
							: ($x['file_lcase'] >= $y['file_lcase'] ? 1 : ($x['file_lcase'] == $y['file_lcase'] ? 0 : -1));
					}
				});
				break;
		}

		if ($subdir != "") {
			$sorted = array_merge([['file' => '..']], $sorted);
		}

		$files = $sorted;
		?>
		<!-- header div start -->
		<nav class="navbar navbar-expand-lg border-bottom">
			<div class="container-fluid">
				<span class="navbar-brand"></span>
				<button class="navbar-toggler mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="d-flex flex-column flex-md-row justify-content-between w-100 my-3 my-md-0">
						<div class="d-flex justify-content-start justify-content-md-between w-100">
							<div>
								<?php if ($config['upload_files']) : ?>
									<button type="button" class="btn btn-navbar btn-sm upload-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('Upload_file'); ?>">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload">
											<path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
											<polyline points="17 8 12 3 7 8"></polyline>
											<line x1="12" y1="3" x2="12" y2="15"></line>
										</svg>
									</button>
								<?php endif; ?>
								<?php if ($config['create_folders']) : ?>
									<button type="button" class="btn btn-navbar btn-sm new-folder" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('New_Folder'); ?>">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder-plus">
											<path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
											<line x1="12" y1="11" x2="12" y2="17"></line>
											<line x1="9" y1="14" x2="15" y2="14"></line>
										</svg>
									</button>
								<?php endif; ?>
								<?php if ($config['copy_cut_files'] || $config['copy_cut_dirs']) : ?>
									<button type="button" class="btn btn-navbar btn-sm paste-here-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('Paste_Here'); ?>">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard">
											<path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path>
											<rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
										</svg>
									</button>
									<button type="button" class="btn btn-navbar btn-sm me-1 clear-clipboard-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('Clear_Clipboard'); ?>">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-square">
											<rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
											<line x1="9" y1="9" x2="15" y2="15"></line>
											<line x1="15" y1="9" x2="9" y2="15"></line>
										</svg>
									</button>
								<?php endif; ?>
								<div id="multiple-selection" class="my-3" style="display:none;">
									<?php if ($config['multiple_selection']) : ?>
										<?php if ($config['delete_files']) : ?>
											<button type="button" class="btn btn-navbar btn-sm multiple-delete-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('Erase'); ?>" data-confirm="<?= trans('Confirm_del'); ?>">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">
													<polyline points="3 6 5 6 21 6"></polyline>
													<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
													<line x1="10" y1="11" x2="10" y2="17"></line>
													<line x1="14" y1="11" x2="14" y2="17"></line>
												</svg>
											</button>
										<?php endif; ?>
										<button type="button" class="btn btn-navbar btn-sm multiple-select-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('Select_All'); ?>">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square">
												<polyline points="9 11 12 14 22 4"></polyline>
												<path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path>
											</svg>
										</button>
										<button type="button" class="btn btn-navbar btn-sm multiple-deselect-btn" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('Deselect_All'); ?>">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-square">
												<rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
											</svg>
										</button>
										<?php if ($apply_type != "apply_none" && $config['multiple_selection_action_button']) : ?>
											<button class="btn btn-primary btn-sm multiple-action-btn" data-function="<?= $apply_type; ?>">
												<?= trans('Select'); ?>
											</button>
										<?php endif; ?>
									<?php endif; ?>
								</div>
							</div>
							<div class="view-controller mx-md-auto">
								<button type="button" class="btn btn-navbar btn-sm <?= $view == 0 ? ' active' : '' ?>" id="view0" data-value="0" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('View_boxes'); ?>">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid">
										<rect x="3" y="3" width="7" height="7"></rect>
										<rect x="14" y="3" width="7" height="7"></rect>
										<rect x="14" y="14" width="7" height="7"></rect>
										<rect x="3" y="14" width="7" height="7"></rect>
									</svg>
								</button>
								<button type="button" class="btn btn-navbar btn-sm <?= $view == 1 ? ' active' : '' ?>" id="view1" data-value="1" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('View_list'); ?>">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
										<line x1="8" y1="6" x2="21" y2="6"></line>
										<line x1="8" y1="12" x2="21" y2="12"></line>
										<line x1="8" y1="18" x2="21" y2="18"></line>
										<line x1="3" y1="6" x2="3.01" y2="6"></line>
										<line x1="3" y1="12" x2="3.01" y2="12"></line>
										<line x1="3" y1="18" x2="3.01" y2="18"></line>
									</svg>
								</button>
								<button type="button" class="btn btn-navbar btn-sm d-none d-sm-inline <?php if ($view == 2) {echo " active";} ?>" id="view2" data-value="2" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="<?= trans('View_columns_list'); ?>">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-columns">
										<path d="M12 3h7a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-7m0-18H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h7m0-18v18"></path>
									</svg>
								</button>
							</div>
						</div>
						<div class="mt-3 mt-md-0">
							<input accesskey="f" type="text" class="form-control filter-input <?php echo(($_GET['type'] != 1 && $_GET['type'] != 3) ? '' : 'filter-input-notype'); ?>" id="filter-input" name="filter" placeholder="<?php echo fix_strtolower(trans('Text_filter')); ?>..." value="<?php echo $filter; ?>"/>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- header div end -->

		<!-- breadcrumb div start -->
		<div class="d-flex justify-content-between align-items-center border-bottom mb-2">
			<nav aria-label="breadcrumb">
				<?php $link = "dialog.php?" . $get_params; ?>
				<ol class="breadcrumb ms-2 mt-3">
					<li class="breadcrumb-item">
						<a class="link-body-navs" href="<?= $link ?>/">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home bi">
								<path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
								<polyline points="9 22 9 12 15 12 15 22"></polyline>
							</svg>
						</a>
					</li>
					<?php
					$bc = explode("/", $subdir);
					$tmp_path = '';

					if (!empty($bc)) {
						foreach ($bc as $k => $b) {
							$tmp_path .= $b . "/";

							if ($k == count($bc) - 2) {
								echo '<li class="breadcrumb-item d-none d-sm-block active">' . htmlspecialchars($b) . '</li>';
							} elseif ($b != "") {
								echo '<li class="breadcrumb-item d-none d-sm-block"><a class="link-body-navs text-decoration-none" href="' . htmlspecialchars($link . $tmp_path) . '">' . htmlspecialchars($b) . '</a></li>';
							}
						}
					}
					?>
					 <li class="breadcrumb-item d-none d-sm-block active">
						<small class="hidden-phone">(<span id="files_number"><?= $current_files_number . "</span> " . trans('Files') . " - <span id='folders_number'>" . $current_folders_number . "</span> " . trans('Folders'); ?>)
						</small>
					</li>
					<?php if ($config['show_total_size']) : ?>
						<li class="breadcrumb-item d-none d-sm-block active">
							<small class="">
								<span title="<?= trans('total size') . $config['MaxSizeTotal']; ?>">
									<?= trans('total size') . ": " . makeSize($sizeCurrentFolder) . (($config['MaxSizeTotal'] !== false && is_int($config['MaxSizeTotal'])) ? '/' . $config['MaxSizeTotal'] . ' ' . trans('MB') : ''); ?>
								</span>
							</small>
						</li>
					<?php endif; ?>
				</ol>
			</nav>
			<div>
				<div class="btn-group" role="group">
					<button type="button" class="btn link-body-navs dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart bi">
							<line x1="12" y1="20" x2="12" y2="10"></line>
							<line x1="18" y1="20" x2="18" y2="4"></line>
							<line x1="6" y1="20" x2="6" y2="16"></line>
						</svg>
					</button>
					<ul class="dropdown-menu sorting">
						<li>
							<a class="dropdown-item sorter sort-name <?= ($sort_by === 'name') ? ($descending ? 'descending' : 'ascending') : '' ?>"
								href="javascript:void(0)" data-sort="name">
								<?= trans('Filename') ?>
							</a>
						</li>
						<li>
							<a class="dropdown-item sorter sort-date <?= ($sort_by === 'date') ? ($descending ? 'descending' : 'ascending') : '' ?>"
								href="javascript:void(0)" data-sort="date">
								<?= trans('Date') ?>
							</a>
						</li>
						<li>
							<a class="dropdown-item sorter sort-size <?= ($sort_by === 'size') ? ($descending ? 'descending' : 'ascending') : '' ?>"
								href="javascript:void(0)" data-sort="size">
								<?= trans('Size') ?>
							</a>
						</li>
						<li>
							<a class="dropdown-item sorter sort-extension <?= ($sort_by === 'extension') ? ($descending ? 'descending' : 'ascending') : '' ?>"
								href="javascript:void(0)" data-sort="extension">
								<?= trans('Type') ?>
							</a>
						</li>
					</ul>
				</div>
				<?php if ($config['show_language_selection']) : ?>
					<a class="btn btn-link link-body-navs" href="javascript:void('')" id="change_lang_btn">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe bi">
							<circle cx="12" cy="12" r="10"></circle>
							<line x1="2" y1="12" x2="22" y2="12"></line>
							<path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
						</svg>
					</a>
				<?php endif; ?>
				<a id="refresh" class="btn btn-link link-body-navs" href="dialog.php?<?= $get_params . $subdir . "&" . uniqid() ?>">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw bi">
						<polyline points="23 4 23 10 17 10"></polyline>
						<polyline points="1 20 1 14 7 14"></polyline>
						<path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
					</svg>
				</a>
			</div>
		</div>
		<!-- breadcrumb div end -->

		<!-- Content -->
		<div class="container-fluid ff-container">
			<div class="span12">
				<?php if( ($ftp && !$ftp->isDir($config['ftp_base_folder'] . $config['upload_dir'] . $rfm_subfolder . $subdir)) || (!$ftp && @opendir($config['current_path'] . $rfm_subfolder . $subdir) === false)){ ?>
            		<br/>
            		<div class="alert alert-error">There is an error! The upload folder there isn't. Check your config.php file.</div>
            	<?php }else{ ?>
            		<h4 id="help" class="d-none"><?php echo trans('Swipe_help'); ?></h4>
					<?php if(isset($config['folder_message'])){ ?>
					<div class="alert alert-block"><?php echo $config['folder_message']; ?></div>
				<?php } ?>
            	<?php if($config['show_sorting_bar']){ ?>
					<!-- sorter -->
					<div class="sorter-container <?php echo "list-view" . $view; ?>">
						<div class="file-name">
							<a class="sorter sort-name <?php if ($sort_by == "name") {echo ($descending) ? "descending" : "ascending";} ?>" href="javascript:void('')" data-sort="name">
								<?php echo trans('Filename'); ?>
							</a>
						</div>
						<div class="file-date">
							<a class="sorter sort-date <?php if ($sort_by == "date") {echo ($descending) ? "descending" : "ascending";} ?>" href="javascript:void('')" data-sort="date">
								<?php echo trans('Date'); ?>
							</a>
						</div>
						<div class="file-size">
							<a class="sorter sort-size <?php if ($sort_by == "size") {echo ($descending) ? "descending" : "ascending";} ?>" href="javascript:void('')" data-sort="size">
								<?php echo trans('Size'); ?>
							</a>
						</div>
						<div class='img-dimension'><?php echo trans('Dimension'); ?></div>
						<div class='file-extension'>
							<a class="sorter sort-extension <?php if ($sort_by == "extension") {echo ($descending) ? "descending" : "ascending";} ?>" href="javascript:void('')" data-sort="extension">
								<?php echo trans('Type'); ?>
							</a>
						</div>
						<div class='file-operations'><?php echo trans('Operations'); ?></div>
					</div>
				<?php } ?>
            	<input type="hidden" id="file_number" value="<?php echo $n_files; ?>"/>
            	
				<!--ul class="thumbnails ff-items"-->
           		<ul class="grid cs-style-2 <?php echo "list-view" . $view; ?>" id="main-item-container">
                <?php
                foreach ($files as $file_array) {
                    $file = $file_array['file'];
                    if ($file == '.' || (substr(
                                $file,
                                0,
                                1
                            ) == '.' && isset($file_array['extension']) && $file_array['extension'] == fix_strtolower(
                                trans('Type_dir')
                            )) || (isset($file_array['extension']) && $file_array['extension'] != fix_strtolower(
                                trans('Type_dir')
                            )) || ($file == '..' && $subdir == '') || in_array(
                            $file,
                            $config['hidden_folders']
                        ) || ($filter != '' && $n_files > $config['file_number_limit_js'] && $file != ".." && stripos(
                                $file,
                                $filter
                            ) === false)) {
                        continue;
                    }
                    $new_name = fix_filename($file, $config);
                    if ($ftp && $file != '..' && $file != $new_name) {
                        //rename
                        rename_folder($config['current_path'] . $subdir . $file, $new_name, $ftp, $config);
                        $file = $new_name;
                    }
                    //add in thumbs folder if not exist
                    if ($file != '..') {
                        if (!$ftp && !file_exists($thumbs_path . $file)) {
                            create_folder(false, $thumbs_path . $file, $ftp, $config);
                        }
                    }

                    $class_ext = 3;
                    if ($file == '..' && trim($subdir) != '') {
                        $src = explode("/", $subdir);
                        unset($src[count($src) - 2]);
                        $src = implode("/", $src);
                        if ($src == '') {
                            $src = "/";
                        }
                    } elseif ($file != '..') {
                        $src = $subdir . $file . "/";
                    }

                    ?>
                    <li data-name="<?php echo $file ?>" class="<?php if ($file == '..') {echo 'back';} else {echo 'dir';} ?>
					<?php if (!$config['multiple_selection']) { ?>no-selector<?php } ?>" <?php if (($filter != '' && stripos($file, $filter) === false)) {echo ' style="display:none;"';} ?>>
					<?php
                        $file_prevent_rename = false;
                        $file_prevent_delete = false;
                        if (isset($filePermissions[$file])) {
                            $file_prevent_rename = isset($filePermissions[$file]['prevent_rename']) && $filePermissions[$file]['prevent_rename'];
                            $file_prevent_delete = isset($filePermissions[$file]['prevent_delete']) && $filePermissions[$file]['prevent_delete'];
                        }
                        ?>
                        <figure data-name="<?php echo $file ?>" data-path="<?php echo $rfm_subfolder . $subdir . $file; ?>" class="<?php if ($file == "..") {echo "back-";} ?>directory" data-type="<?php if ($file != "..") {echo "dir";} ?>">
                            <?php
                            if ($file == "..") { ?>
                                <input type="hidden" class="path" value="<?php echo str_replace('.', '', dirname($rfm_subfolder . $subdir)); ?>"/>
                                <input type="hidden" class="path_thumb" value="<?php echo dirname($thumbs_path) . "/"; ?>"/>
                            <?php
                            } ?>
                            <a class="folder-link" href="dialog.php?<?php echo $get_params . rawurlencode($src) . "&" . ($callback ? 'callback=' . $callback . "&" : '') . uniqid() ?>">
                                <div class="img-precontainer">
									<div class="img-container directory">
										<?php if ($file == ".."): ?>
											<svg class="directory-img loaded" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><g><path d="M34.872 9h-16.49l-.94-1.88c-.436-.872-.634-1.17-.918-1.447a2.115 2.115 0 0 0-.807-.5c-.376-.13-.73-.173-1.705-.173H3.908c-.688 0-1.214.118-1.646.35a2.18 2.18 0 0 0-.913.912C1.12 6.694 1 7.22 1 7.908v22.964c0 1.475.108 2.034.416 2.61.255.478.624.847 1.102 1.102.576.308 1.135.416 2.61.416h29.744c1.475 0 2.034-.108 2.61-.416a2.635 2.635 0 0 0 1.102-1.102c.308-.576.416-1.135.416-2.61V13.128c0-1.475-.108-2.034-.416-2.61a2.635 2.635 0 0 0-1.102-1.102C36.906 9.108 36.347 9 34.872 9zM19 8h15.872c1.783 0 2.43.186 3.082.534.652.349 1.163.86 1.512 1.512.348.652.534 1.299.534 3.082v17.744c0 1.783-.186 2.43-.534 3.082a3.635 3.635 0 0 1-1.512 1.512c-.652.348-1.299.534-3.082.534H5.128c-1.783 0-2.43-.186-3.082-.534a3.635 3.635 0 0 1-1.512-1.512C.186 33.302 0 32.655 0 30.872V7.908c0-.866.162-1.547.467-2.117a3.18 3.18 0 0 1 1.324-1.324C2.36 4.162 3.042 4 3.908 4h10.104c1.163 0 1.582.073 2.032.229.45.156.838.395 1.179.728.34.333.593.675 1.113 1.716L19 8z"></path><path d="M22.293 19.707l-.005.005a1 1 0 0 1-1.415-.001L18 16.83V26h9a1 1 0 0 1 0 2H16V16.83l-2.873 2.88a1 1 0 0 1-1.415.002l-.005-.005a1 1 0 0 1 0-1.414L17 13l5.293 5.293a1 1 0 0 1 0 1.414z"></path></g></svg>
										<?php else: ?>
											<svg class="directory-img loaded" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><g fill-rule="evenodd"><path d="M3.908 4h10.104c1.163 0 1.582.073 2.032.229.45.156.838.395 1.179.728.34.333.593.675 1.113 1.716L19 8H0v-.092c0-.866.162-1.547.467-2.117a3.18 3.18 0 0 1 1.324-1.324C2.36 4.162 3.042 4 3.908 4zM0 8h34.872c1.783 0 2.43.186 3.082.534.652.349 1.163.86 1.512 1.512.348.652.534 1.299.534 3.082v17.744c0 1.783-.186 2.43-.534 3.082a3.635 3.635 0 0 1-1.512 1.512c-.652.348-1.299.534-3.082.534H5.128c-1.783 0-2.43-.186-3.082-.534a3.635 3.635 0 0 1-1.512-1.512C.186 33.302 0 32.655 0 30.872V8z"></path></g></svg>
										<?php endif; ?>
									</div>
                                </div>
                                <div class="img-precontainer-mini directory">
                                    <div class="img-container-mini">
										<?php if ($file == ".."): ?>
											<svg class="directory-img loaded" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><g><path d="M34.872 9h-16.49l-.94-1.88c-.436-.872-.634-1.17-.918-1.447a2.115 2.115 0 0 0-.807-.5c-.376-.13-.73-.173-1.705-.173H3.908c-.688 0-1.214.118-1.646.35a2.18 2.18 0 0 0-.913.912C1.12 6.694 1 7.22 1 7.908v22.964c0 1.475.108 2.034.416 2.61.255.478.624.847 1.102 1.102.576.308 1.135.416 2.61.416h29.744c1.475 0 2.034-.108 2.61-.416a2.635 2.635 0 0 0 1.102-1.102c.308-.576.416-1.135.416-2.61V13.128c0-1.475-.108-2.034-.416-2.61a2.635 2.635 0 0 0-1.102-1.102C36.906 9.108 36.347 9 34.872 9zM19 8h15.872c1.783 0 2.43.186 3.082.534.652.349 1.163.86 1.512 1.512.348.652.534 1.299.534 3.082v17.744c0 1.783-.186 2.43-.534 3.082a3.635 3.635 0 0 1-1.512 1.512c-.652.348-1.299.534-3.082.534H5.128c-1.783 0-2.43-.186-3.082-.534a3.635 3.635 0 0 1-1.512-1.512C.186 33.302 0 32.655 0 30.872V7.908c0-.866.162-1.547.467-2.117a3.18 3.18 0 0 1 1.324-1.324C2.36 4.162 3.042 4 3.908 4h10.104c1.163 0 1.582.073 2.032.229.45.156.838.395 1.179.728.34.333.593.675 1.113 1.716L19 8z"></path><path d="M22.293 19.707l-.005.005a1 1 0 0 1-1.415-.001L18 16.83V26h9a1 1 0 0 1 0 2H16V16.83l-2.873 2.88a1 1 0 0 1-1.415.002l-.005-.005a1 1 0 0 1 0-1.414L17 13l5.293 5.293a1 1 0 0 1 0 1.414z"></path></g></svg>
										<?php else: ?>
											<svg class="directory-img loaded" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><g fill-rule="evenodd"><path d="M3.908 4h10.104c1.163 0 1.582.073 2.032.229.45.156.838.395 1.179.728.34.333.593.675 1.113 1.716L19 8H0v-.092c0-.866.162-1.547.467-2.117a3.18 3.18 0 0 1 1.324-1.324C2.36 4.162 3.042 4 3.908 4zM0 8h34.872c1.783 0 2.43.186 3.082.534.652.349 1.163.86 1.512 1.512.348.652.534 1.299.534 3.082v17.744c0 1.783-.186 2.43-.534 3.082a3.635 3.635 0 0 1-1.512 1.512c-.652.348-1.299.534-3.082.534H5.128c-1.783 0-2.43-.186-3.082-.534a3.635 3.635 0 0 1-1.512-1.512C.186 33.302 0 32.655 0 30.872V8z"></path></g></svg>
										<?php endif; ?>
									</div>
                                </div>
                                <?php
                                if ($file == ".."){ ?>
                                <div class="box no-effect">
                                    <h4><?php echo trans('Back') ?></h4>
                                </div>
                            </a>
                        <?php
                        } else { ?>
                            </a>
                            <div class="box">
                                <h4 class="<?php if ($config['ellipsis_title_after_first_row']) {echo "ellipsis";} ?>">
									<a class="folder-link" data-file="<?php echo $file ?>" href="dialog.php?<?php echo $get_params . rawurlencode($src) . "&" . uniqid() ?>"><?php echo $file; ?></a>
								</h4>
                            </div>
                            <input type="hidden" class="name" value="<?php echo $file_array['file_lcase']; ?>"/>
                            <input type="hidden" class="date" value="<?php echo $file_array['date']; ?>"/>
                            <input type="hidden" class="size" value="<?php echo $file_array['size']; ?>"/>
                            <input type="hidden" class="extension" value="<?php echo fix_strtolower(trans('Type_dir')); ?>"/>
                            <div class="file-date"><?php echo date(trans('Date_type'), $file_array['date']); ?></div>
                            <?php
                            if ($config['show_folder_size']) { ?>
                                <div class="file-size"><?php echo makeSize($file_array['size']); ?></div>
                                <input type="hidden" class="nfiles" value="<?php echo $file_array['nfiles']; ?>"/>
                                <input type="hidden" class="nfolders" value="<?php echo $file_array['nfolders']; ?>"/>
                            <?php
                            } ?>
                            <div class='file-extension'><?php echo fix_strtolower(trans('Type_dir')); ?></div>
                            <figcaption>
                                <a href="javascript:void('')" class="text-decoration-none edit-button rename-file-paths <?php if ($config['rename_folders'] && !$file_prevent_rename) {echo "rename-folder";} ?>" data-folder="1" data-permissions="<?php echo $file_array['permissions']; ?>">
                                    <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Rename') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>   
                                </a>
                                <a href="javascript:void('')" class="text-decoration-none erase-button <?php if ($config['delete_folders'] && !$file_prevent_delete) {echo "delete-folder";} ?>" data-confirm="<?php echo trans('Confirm_Folder_del'); ?>">
                                    <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Erase') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                </a>
                            </figcaption>
                        <?php
                        } ?>
                        </figure>
                    </li>
                    <?php
                }

                $files_prevent_duplicate = [];
                foreach ($files

                as $nu => $file_array) {
                $file = $file_array['file'];

                if ($file == '.' || $file == '..' || $file_array['extension'] == fix_strtolower(
                        trans('Type_dir')
                    ) || !check_extension(
                        $file_array['extension'],
                        $config
                    ) || ($filter != '' && $n_files > $config['file_number_limit_js'] && stripos(
                            $file,
                            $filter
                        ) === false)) {
                    continue;
                }
                foreach ($config['hidden_files'] as $hidden_file) {
                    if (fnmatch($hidden_file, $file, FNM_PATHNAME)) {
                        continue 2;
                    }
                }
                $filename = substr($file, 0, '-' . (strlen($file_array['extension']) + 1));
                if (strlen($file_array['extension']) === 0) {
                    $filename = $file;
                }
                if (!$ftp) {
                    $file_path = $config['current_path'] . $rfm_subfolder . $subdir . $file;
                    //check if file have illegal caracter

                    if ($file != fix_filename($file, $config)) {
                        $file1 = fix_filename($file, $config);
                        $file_path1 = ($config['current_path'] . $rfm_subfolder . $subdir . $file1);
                        if (file_exists($file_path1)) {
                            $i = 1;
                            $info = pathinfo($file1);
                            while (file_exists(
                                $config['current_path'] . $rfm_subfolder . $subdir . $info['filename'] . ".[" . $i . "]." . $info['extension']
                            )) {
                                $i++;
                            }
                            $file1 = $info['filename'] . ".[" . $i . "]." . $info['extension'];
                            $file_path1 = ($config['current_path'] . $rfm_subfolder . $subdir . $file1);
                        }

                        $filename = substr($file1, 0, '-' . (strlen($file_array['extension']) + 1));
                        if (strlen($file_array['extension']) === 0) {
                            $filename = $file1;
                        }
                        rename_file($file_path1, fix_filename($filename, $config), $ftp, $config);
                        $file = $file1;
                        $file_array['extension'] = fix_filename($file_array['extension'], $config);
                        $file_path = $file_path1;
                    }
                } else {
                    $file_path = $config['ftp_base_url'] . $config['upload_dir'] . $rfm_subfolder . $subdir . $file;
                }

                $is_img = false;
                $is_video = false;
                $is_audio = false;
                $show_original = false;
                $show_original_mini = false;
                $mini_src = "";
                $src_thumb = "";
                if (in_array($file_array['extension'], $config['ext_img'])) {
                    $src = $file_path;
                    $is_img = true;

                    $img_width = $img_height = "";
                    if ($ftp) {
                        $mini_src = $src_thumb = $config['ftp_base_url'] . $config['ftp_thumbs_dir'] . $subdir . $file;
                        $creation_thumb_path = "/" . $config['ftp_base_folder'] . $config['ftp_thumbs_dir'] . $subdir . $file;
                    } else {
                        $creation_thumb_path = $mini_src = $src_thumb = $thumbs_path . $file;

                        if (!file_exists($src_thumb)) {
                            if (create_img($file_path, $creation_thumb_path, 122, 91, 'crop', $config) !== true) {
                                $src_thumb = $mini_src = "";
                            }
                        }
                        //check if is smaller than thumb
                        list($img_width, $img_height, $img_type, $attr) = @getimagesize($file_path);
                        if ($img_width < 122 && $img_height < 91) {
                            $src_thumb = $file_path;
                            $show_original = true;
                        }

                        if ($img_width < 45 && $img_height < 38) {
                            $mini_src = $config['current_path'] . $rfm_subfolder . $subdir . $file;
                            $show_original_mini = true;
                        }
                    }
                }
                $is_icon_thumb = false;
                $is_icon_thumb_mini = false;
                $no_thumb = false;
                if ($src_thumb == "") {
                    $no_thumb = true;
                    if (file_exists('img/' . $config['icon_theme'] . '/' . $file_array['extension'] . ".jpg")) {
                        $src_thumb = 'img/' . $config['icon_theme'] . '/' . $file_array['extension'] . ".jpg";
                    } else {
                        $src_thumb = "img/" . $config['icon_theme'] . "/default.jpg";
                    }
                    $is_icon_thumb = true;
                }
                if ($mini_src == "") {
                    $is_icon_thumb_mini = false;
                }

                $class_ext = 0;
                if (in_array($file_array['extension'], $config['ext_video'])) {
                    $class_ext = 4;
                    $is_video = true;
                } elseif (in_array($file_array['extension'], $config['ext_img'])) {
                    $class_ext = 2;
                } elseif (in_array($file_array['extension'], $config['ext_music'])) {
                    $class_ext = 5;
                    $is_audio = true;
                } elseif (in_array($file_array['extension'], $config['ext_misc'])) {
                    $class_ext = 3;
                } else {
                    $class_ext = 1;
                }
                if ((!($_GET['type'] == 1 && !$is_img) && !(($_GET['type'] == 3 && !$is_video) && ($_GET['type'] == 3 && !$is_audio))) && $class_ext > 0){
                ?>
                <li class="ff-item-type-<?php
                echo $class_ext; ?> file <?php
                if (!$config['multiple_selection']) { ?>no-selector<?php
                } ?>" data-name="<?php
                echo $file; ?>" <?php
                if (($filter != '' && stripos($file, $filter) === false)) {
                    echo ' style="display:none;"';
                } ?>><?php
                    $file_prevent_rename = false;
                    $file_prevent_delete = false;
                    if (isset($filePermissions[$file])) {
                        if (isset($filePermissions[$file]['prevent_duplicate']) && $filePermissions[$file]['prevent_duplicate']) {
                            $files_prevent_duplicate[] = $file;
                        }
                        $file_prevent_rename = isset($filePermissions[$file]['prevent_rename']) && $filePermissions[$file]['prevent_rename'];
                        $file_prevent_delete = isset($filePermissions[$file]['prevent_delete']) && $filePermissions[$file]['prevent_delete'];
                    }
                    ?>
                    <figure data-name="<?php echo $file ?>" data-path="<?php echo $rfm_subfolder . $subdir . $file; ?>" data-type="<?php if ($is_img) {echo "img";} else {echo "file";} ?>">
                        <?php
                        if ($config['multiple_selection']) { ?>
                            <div class="selector form-check">
								<label class="cont form-check-label">
									<input type="checkbox" class="selection form-check-input" name="selection[]" value="<?php echo $file; ?>">
									<span class="checkmark"></span>
								</label>
                            </div>
                        <?php
                        } ?>
                        <a href="javascript:void('')" class="link text-decoration-none" data-file="<?php echo $file; ?>" data-function="<?php echo $apply; ?>">
                            <div class="img-precontainer">
                                <?php
                                if ($is_icon_thumb) { ?>
                                    <div class="filetype"><?php
                                    echo $file_array['extension'] ?></div><?php
                                } ?>

                                <div class="img-container">
                                    <img class="<?php echo $show_original ? "original" : "" ?><?php echo $is_icon_thumb ? " icon" : "" ?>" data-src="<?php echo $src_thumb; ?>">
                                </div>
                            </div>
                            <div class="img-precontainer-mini <?php if ($is_img) echo 'original-thumb' ?>">
                                <?php if ($config['multiple_selection']) { ?>
                                <?php
                                } ?>
                                <div class="filetype <?php echo $file_array['extension'] ?> <?php if (in_array($file_array['extension'], $config['editable_text_file_exts'])) echo 'edit-text-file-allowed' ?> <?php if (!$is_icon_thumb) {echo "hide";} ?>">
									<?php echo $file_array['extension'] ?>
								</div>
                                <div class="img-container-mini">
                                    <?php if ($mini_src != "") { ?>
                                        <img class="<?php echo $show_original_mini ? "original" : "" ?><?php echo $is_icon_thumb_mini ? " icon" : "" ?>" data-src="<?php echo $mini_src; ?>">
                                    <?php
                                    } ?>
                                </div>
                            </div>
                            <?php
                            if ($is_icon_thumb) { ?>
                                <div class="cover"></div>
                            <?php
                            } ?>
                            <div class="box">
                                <h4 class="<?php if ($config['ellipsis_title_after_first_row']) {echo "ellipsis";} ?>">
                                    <?php echo $filename; ?>
								</h4>
                            </div>
                        </a>
                        <input type="hidden" class="date" value="<?php echo $file_array['date']; ?>"/>
                        <input type="hidden" class="size" value="<?php echo $file_array['size'] ?>"/>
                        <input type="hidden" class="extension" value="<?php echo $file_array['extension']; ?>"/>
                        <input type="hidden" class="name" value="<?php echo $file_array['file_lcase']; ?>"/>
                        <div class="file-date"><?php echo date(trans('Date_type'), $file_array['date']) ?></div>
                        <div class="file-size"><?php echo makeSize($file_array['size']) ?></div>
                        <div class='img-dimension'><?php if ($is_img) {echo $img_width . "x" . $img_height;} ?></div>
                        <div class='file-extension'><?php echo $file_array['extension']; ?></div>
                        <figcaption>
                            <form action="force_download.php" method="post" class="download-form" id="form<?php echo $nu; ?>">
                                <input type="hidden" name="path" value="<?php echo $rfm_subfolder . $subdir ?>"/>
                                <input type="hidden" class="name_download" name="name" value="<?php echo $file ?>"/>

                                <a class="text-decoration-none" href="javascript:void('')" <?php if ($config['download_files']) echo "onclick=\"$('#form" . $nu . "').submit();\"" ?>>
                                    <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Download') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="8 12 12 16 16 12"></polyline><line x1="12" y1="8" x2="12" y2="16"></line></svg>
                                </a>

                                <?php if ($is_img && $src_thumb != "") { ?>
                                    <a class="text-decoration-none" data-large-src="<?php echo $src; ?>" href="#galleryModal" data-bs-toggle="modal">
										<svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Preview') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
									</a>
                                <?php
                                } elseif (($is_video || $is_audio) && in_array($file_array['extension'], $config['jplayer_exts'])) { ?>
                                    <a class="text-decoration-none modalAV <?php if ($is_audio) {echo "audio";} else {echo "video";} ?>" data-url="ajax_calls.php?action=media_preview&title=<?php echo $filename; ?>&file=<?php echo $rfm_subfolder . $subdir . $file; ?>" href="javascript:void('');">
									   <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Preview') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
									</a>
                                <?php
                                } elseif (in_array($file_array['extension'], $config['cad_exts'])) { ?>
                                    <a class="text-decoration-none file-preview-btn" data-url="ajax_calls.php?action=cad_preview&title=<?php echo $filename; ?>&file=<?php echo $rfm_subfolder . $subdir . $file; ?>" href="javascript:void('');">
									   <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Preview') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
									</a>
                                <?php
                                } elseif ($config['preview_text_files'] && in_array($file_array['extension'], $config['previewable_text_file_exts'])) { ?>
                                    <a class="text-decoration-none file-preview-btn" data-url="ajax_calls.php?action=get_file&sub_action=preview&preview_mode=text&title=<?php echo $filename; ?>&file=<?php echo $rfm_subfolder . $subdir . $file; ?>" href="javascript:void('');">
									   <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Preview') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
									</a>
                                <?php
                                } elseif ($config['googledoc_enabled'] && in_array($file_array['extension'], $config['googledoc_file_exts'])) { ?>
                                    <a class="text-decoration-none file-preview-btn" data-url="ajax_calls.php?action=get_file&sub_action=preview&preview_mode=google&title=<?php echo $filename; ?>&file=<?php echo $rfm_subfolder . $subdir . $file; ?>" href="docs.google.com;">
										<svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Preview') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
									</a>
                                <?php
                                } else { ?>
                                    <a class="text-decoration-none preview disabled"><svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg></a>
                                <?php
                                } ?>

                                <a href="javascript:void('')" class="text-decoration-none edit-button rename-file-paths <?php if ($config['rename_files'] && !$file_prevent_rename) {echo "rename-file";} ?>" data-folder="0" data-permissions="<?php echo $file_array['permissions']; ?>">
                                    <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Rename') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                                </a>
                                <a href="javascript:void('')" class="text-decoration-none erase-button <?php if ($config['delete_files'] && !$file_prevent_delete) {echo "delete-file";} ?>" data-confirm="<?php echo trans('Confirm_del'); ?>">
                                    <svg class="svg-icon" data-bs-toggle="tooltip" data-bs-title="<?= trans('Erase') ?>" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
                                </a>
                            </form>
                        </figcaption>
                    </figure>
                </li>
            <?php
            }
            }
            ?></div>
        </ul>
        <?php
        } ?>
		</div>
	</div>
	</div>

	<script>
		var files_prevent_duplicate = [];
		<?php foreach ($files_prevent_duplicate as $key => $value): ?>
			files_prevent_duplicate[<?php echo $key; ?>] = '<?php echo $value; ?>';
		<?php endforeach; ?>
	</script>

	<!-- loading div start -->
	<div id="loading_container" style="display:none;">
		<div id="loading"
			style="background-color:#000; position:fixed; width:100%; height:100%; top:0px; left:0px;z-index:100000"></div>
		<img id="loading_animation" src="img/storing_animation.gif" alt="loading"
			style="z-index:10001; margin-left:-32px; margin-top:-32px; position:fixed; left:50%; top:50%">
	</div>
	<!-- loading div end -->

	<!-- player div start -->
	<div class="modal hide" id="previewAV">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3><?php
				echo trans('Preview'); ?></h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid body-preview">
			</div>
		</div>
	</div>

	<!-- player div end -->

	<div id="galleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-0 text-center bg-alt">
					<img src="//placehold.it/1200x700/222?text=..." id="galleryImage" class="loaded-image mx-auto img-fluid">
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" data-bs-dismiss="modal" aria-hidden="true"><?= trans('Cancel'); ?></button>
				</div>
			</div>
		</div>
	</div>

	<script>
		var ua = navigator.userAgent.toLowerCase();
		var isAndroid = ua.indexOf("android") > -1; //&& ua.indexOf("mobile");
		if (isAndroid) {
			$('li').draggable({
				disabled: true
			});
		}
	</script>
	<script>
		$('#galleryModal').on('show.bs.modal', function (e) {
			$('#galleryImage').attr("src",$(e.relatedTarget).data("large-src"));
		});
	</script>
</body>

</html>