<script src="/turbo/design/js/tinymce/tinymce.min.js"></script>
<script>
	$(function() {
		tinyMCE.init({literal}{{/literal}
		selector: "textarea.editor",
		{if $settings->admin_theme == "dark"}
			skin: "oxide-dark",
			content_css: "dark",
		{/if}
		min_height: 570,
		promotion: false,
		branding: false,
		plugins: [
			'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview', 'responsivefilemanager',
			'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
			'insertdatetime', 'media', 'table', 'help', 'wordcount', 'emoticons'
		],
		editimage_cors_hosts: ['picsum.photos'],
		toolbar_items_size: 'small',
		menubar: 'file edit insert view format table tools',
		toolbar: 'undo redo | blocks  | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist | forecolor backcolor emoticons | link unlink  media image | removeformat preview fullscreen code',
		{literal}
			image_class_list: [
				{title: 'None', value: ''},
				{title: 'img-fluid', value: 'img-fluid'},
				{title: 'image-zoom', value: 'img-zoom img-fluid'},
				{title: 'image-slider', value: 'img-slider img-fluid'},
				{title: 'image-gallery', value: 'img-gallery img-fluid'},
				{title: 'image-style', value: 'image-style img-fluid'}
			],
		{/literal}
		font_formats: "Andale Mono=andale mono,times;" +
			"Arial=arial,helvetica,sans-serif;" +
			"Arial Black=arial black,avant garde;" +
			"Book Antiqua=book antiqua,palatino;" +
			"Comic Sans MS=comic sans ms,sans-serif;" +
			"Courier New=courier new,courier;" +
			"Georgia=georgia,palatino;" +
			"Helvetica=helvetica;" +
			"Impact=impact,chicago;" +
			"Symbol=symbol;" +
			"Tahoma=tahoma,arial,helvetica,sans-serif;" +
			"Terminal=terminal,monaco;" +
			"Times New Roman=times new roman,times;" +
			"Trebuchet MS=trebuchet ms,geneva;" +
			"Verdana=verdana,geneva;" +
			"Webdings=webdings;" +
			"Wingdings=wingdings,zapf dingbats",
		image_advtab: true,
		image_caption: true,
		external_filemanager_path: "/turbo/design/js/filemanager/",
		filemanager_title:"{$btr->tinymce_init_filemanager|escape}" ,
		external_plugins: { "filemanager": "/turbo/design/js/filemanager/plugin.min.js" },
		save_enablewhendirty: true,
		save_title: "save",
		theme_advanced_buttons3_add: "save",
		save_onsavecallback: function() {literal}{{/literal}
		$("[type='submit']").trigger("click");
		{literal}}{/literal},
		language : "{$settings->lang}",
		{if !in_array($smarty.get.module, array('FAQAdmin','DeliveryAdmin','PaymentMethodAdmin'))}
			setup: function(ed) {
				ed.on('keyup change', (function() {
					set_meta();
				}));
			}
		{/if}
		{literal}}{/literal});
	});
</script>