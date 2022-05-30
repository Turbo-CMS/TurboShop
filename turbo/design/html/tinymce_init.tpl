{if $config->subfolder !='/'}
    <script type="text/javascript" src="/{$config->subfolder}turbo/design/js/tinymce/tinymce.min.js"></script>
{else}
    <script type="text/javascript" src="/turbo/design/js/tinymce/tinymce.min.js"></script>
{/if}

<script>
    $(function() {
        tinyMCE.init({literal}{{/literal}
        selector: "textarea.editor_large, textarea.editor_small",
        min_height: 560,
        plugins: [
            'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
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

        file_picker_types: 'file image media',
        file_picker_callback: (callback, value, meta) => {

            var width = window.innerWidth - 30;
            var height = window.innerHeight - 60;
            if (width > 1800) width = 1800;
            if (height > 1200) height = 1200;
            if (width > 600) {
                var width_reduce = (width - 20) % 138;
                width = width - width_reduce + 10;
            }

            var akey = "## ACCESS_KEY ##";
            var sort_by = "";
            var descending = 0;
            var fldr = "";
            var crossdomain = "";
            var language="{$settings->lang}";

            urltype = 2;
            if (meta.filetype === 'image' || meta.mediaType === 'image') { urltype = 1; }
            if (meta.filetype === 'media' || meta.mediaType === 'media') { urltype = 3; }

            tinymce.activeEditor.windowManager.openUrl({
                title: '{$btr->tinymce_init_filemanager|escape}',
                {if $config->subfolder !='/'}
                    url: '/{$config->subfolder}turbo/design/js/filemanager/dialog.php?type='+urltype+'&descending='+descending+sort_by+fldr+crossdomain+'&lang='+language+'&akey='+akey,
                {else}
                    url: '/turbo/design/js/filemanager/dialog.php?type=' + urltype + '&descending=' + descending + sort_by + fldr + crossdomain + '&lang=' + language + '&akey=' + akey,
                {/if}
                width: width,
                height: height
            });

            window.addEventListener('message', function receiveMessage(event) {
                window.removeEventListener('message', receiveMessage, false);
                if (event.data.sender === 'responsivefilemanager') {
                    callback(event.data.url);
                }
            }, false);

        },

        save_enablewhendirty: true,
        save_title: "save",
        theme_advanced_buttons3_add: "save",
        save_onsavecallback: function() {literal}{{/literal}
        $("[type='submit']").trigger("click");
        {literal}}{/literal},

        language : "{$settings->lang}",

        setup: function(ed) {
            ed.on('keyup change', (function() {
                set_meta();
            }));
        }

        {literal}}{/literal});
    });
</script>