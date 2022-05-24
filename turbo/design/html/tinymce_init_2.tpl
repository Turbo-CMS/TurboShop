{if $config->subfolder !='/'}
    <script type="text/javascript" src="/{$config->subfolder}turbo/design/js/tinymce/tinymce.min.js"></script>
{else}
    <script type="text/javascript" src="/turbo/design/js/tinymce/tinymce.min.js"></script>
{/if}

<script>
    $(function() {
        tinyMCE.init({literal}{{/literal}
        selector: "textarea.editor_large, textarea.editor_small",
		theme: 'silver',
        min_height: 560,
        plugins: [
            "advlist autolink lists link image preview anchor responsivefilemanager",
            "codesample code fullscreen save textcolor colorpicker charmap nonbreaking",
            "insertdatetime media table contextmenu paste imagetools emoticons"
        ],
        toolbar_items_size: 'small',
        menubar: 'file edit insert view format table tools',
        toolbar: 'undo redo | formatselect | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist | forecolor backcolor emoticons | link unlink  media image | removeformat preview fullscreen codesample code',

        {literal}
            image_class_list: [
                {title: 'None', value: ''},
                {title: 'image_zoom', value: 'fn_img_zoom img-fluid'},
                {title: 'image_slider', value: 'fn_img_slider img-fluid'},
                {title: 'image_gallery', value: 'fn_img_gallery img-fluid'},
                {title: 'image_style', value: 'fn_image_style img-fluid'}
            ],
        {/literal}

        statusbar: false,
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
        {if $config->subfolder !='/'}
            external_filemanager_path:"/{$config->subfolder}turbo/design/js/filemanager/",
            filemanager_title:"{$btr->tinymce_init_filemanager|escape}" ,
            external_plugins: { "filemanager" : "/{$config->subfolder}turbo/design/js/filemanager/plugin.min.js"},
        {else}
            external_filemanager_path: "/turbo/design/js/filemanager/",
            filemanager_title:"{$btr->tinymce_init_filemanager|escape}" ,
            external_plugins: { "filemanager": "/turbo/design/js/filemanager/plugin.min.js" },
        {/if}

        save_enablewhendirty: true,
        save_title: "save",
        theme_advanced_buttons3_add: "save",
        save_onsavecallback: function() {literal}{{/literal}
        $("[type='submit']").trigger("click");
        {literal}}{/literal},

        language : "{$settings->lang}",

        {literal}}{/literal});
    });
</script>