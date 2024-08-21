<script src="/turbo/design/js/tinymce/tinymce.min.js"></script>
<script>
	$(function() {
		const fetchApi = import("https://unpkg.com/@microsoft/fetch-event-source@2.0.1/lib/esm/index.js").then(module => module.fetchEventSource);
		const api_key = '{$settings->gpt_key|escape}';
		tinyMCE.init({literal}{{/literal}
		selector: "textarea.editor",
			license_key: 'gpl',
			{if $settings->admin_theme == "dark"}
				skin: "oxide-dark",
				content_css: "dark",
			{/if}
			min_height: 570,
			promotion: false,
			branding: false,
			plugins: [
				'advlist', 'ai', 'autolink', 'lists', 'link', 'image', 'editimage', 'charmap', 'preview', 'responsivefilemanager',
				'anchor', 'searchreplace', 'visualblocks', 'fullscreen', 'advcode',
				'insertdatetime', 'media', 'table', 'help', 'wordcount', 'emoticons', 'quickbars', 'save'
			],
			editimage_cors_hosts: ['picsum.photos'],
			toolbar_items_size: 'small',
			menubar: 'file edit insert view format table tools',
			toolbar: 'undo redo | blocks | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist | forecolor backcolor emoticons | link unlink  media image | removeformat preview fullscreen code translate | aidialog aishortcuts',
			quickbars_insert_toolbar: false,
			quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote image quicktable',
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
			save_onsavecallback: function() {literal}{{/literal}
			$("[type='submit']").trigger("click");
			{literal}}{/literal},
			language : "{if $settings->lang =='ua'}uk{else}{$settings->lang}{/if}",
				setup: function(editor) {
					{if !in_array($smarty.get.module, array('FAQAdmin','DeliveryAdmin','PaymentMethodAdmin'))}	
						editor.on('keyup change', (function() {
							set_meta();
						}));
					{/if}
					editor.ui.registry.addButton('translate', {
						icon: 'translate',
						tooltip: '{$btr->global_translation|escape}',
						onAction: function() {
							var targetLang = '{if $lang_label =='ua'}uk{else}{$lang_label}{/if}';
							var content = editor.getContent();
		
							if (content.trim() !== '') {
								$.post('ajax/translate.php', {
									'source_lang': 'auto',
									'target_lang': targetLang,
									'text': content
								}, function(data) {
									editor.setContent(data);
									set_meta();
								});
							}
						}
					});
			},
			{literal}
				ai_request: (request, respondWith) => {
					respondWith.stream((signal, streamMessage) => {
						// Adds each previous query and response as individual messages
						const conversation = request.thread.flatMap((event) => {
							if (event.response) {
								return [
									{ role: 'user', content: event.request.query },
									{ role: 'assistant', content: event.response.data }
								];
							} else {
								return [];
							}
						});

						// System messages provided by the plugin to format the output as HTML content.
						const pluginSystemMessages = request.system.map((content) => ({
							role: 'system',
							content
						}));

						const systemMessages = [
							...pluginSystemMessages,
							// Additional system messages to control the output of the AI
							{ role: 'system', content: 'Do not include html\`\`\` at the start or \`\`\` at the end.' },
							{ role: 'system', content: 'No explanation or boilerplate, just give the HTML response.' }
						];

						// Forms the new query sent to the API
						const content = request.context.length === 0 || conversation.length > 0 ?
							request.query
						: `Question: ${request.query} Context: """${request.context}"""`;

						const messages = [
							...conversation,
							...systemMessages,
							{ role: 'user', content }
						];

						const requestBody = {
							model: '{/literal}{$settings->model|escape}{literal}',
							temperature: {/literal}{$settings->temperature|escape}{literal},
							max_tokens: {/literal}{$settings->max_tokens|escape}{literal},
							messages,
							stream: true
						};

						const openAiOptions = {
							signal,
							method: 'POST',
							headers: {
								'Content-Type': 'application/json',
								'Authorization': `Bearer ${api_key}`
							},
							body: JSON.stringify(requestBody)
						};

						const onopen = async (response) => {
							if (response) {
								const contentType = response.headers.get('content-type');
								if (response.ok && contentType?.includes('text/event-stream')) {
									return;
								} else if (contentType?.includes('application/json')) {
									const data = await response.json();
									if (data.error) {
										throw new Error(`${data.error.type}: ${data.error.message}`);
									}
								}
							} else {
								throw new Error('Failed to communicate with the ChatGPT API');
							}
						};

						// This function passes each new message into the plugin via the `streamMessage` callback.
						const onmessage = (ev) => {
							const data = ev.data;
							if (data !== '[DONE]') {
								const parsedData = JSON.parse(data);
								const firstChoice = parsedData?.choices[0];
								const message = firstChoice?.delta?.content;
								if (message) {
									streamMessage(message);
								}
							}
						};

						const onerror = (error) => {
							// Stop operation and do not retry by the fetch-event-source
							throw error;
						};

						// Use microsoft's fetch-event-source library to work around the 2000 character limit
					// of the browser `EventSource` API, which requires query strings
					return fetchApi
						.then(fetchEventSource =>
							fetchEventSource('https://api.openai.com/v1/chat/completions', {
								...openAiOptions,
								openWhenHidden: true,
								onopen,
								onmessage,
								onerror
							})
						)
						.then(async (response) => {
							if (response && !response.ok) {
								const data = await response.json();
								if (data.error) {
									throw new Error(`${data.error.type}: ${data.error.message}`);
								}
							}
						})
						.catch(onerror);
				});
			},
			ai_shortcuts: [
				{ title: 'Summarize content', prompt: '{/literal}{$btr->summarize_content|escape}{literal}', selection: true },
				{ title: 'Improve writing', prompt: '{/literal}{$btr->improve_writing|escape}{literal}', selection: true },
				{ title: 'Simplify language', prompt: '{/literal}{$btr->simplify_language|escape}{literal}', selection: true },
				{ title: 'Expand upon', prompt: '{/literal}{$btr->expand_upon|escape}{literal}', selection: true },
				{ title: 'Trim content', prompt: '{/literal}{$btr->trim_content|escape}{literal}', selection: true },
				{
					title: 'Change tone',
					subprompts: [
						{ title: 'Professional', prompt: '{/literal}{$btr->prompt_professional|escape}{literal}', selection: true },
						{ title: 'Casual', prompt: '{/literal}{$btr->prompt_casual|escape}{literal}', selection: true },
						{ title: 'Direct', prompt: '{/literal}{$btr->prompt_direct|escape}{literal}', selection: true },
						{ title: 'Confident', prompt: '{/literal}{$btr->prompt_confident|escape}{literal}', selection: true },
						{ title: 'Friendly', prompt: '{/literal}{$btr->prompt_friendly|escape}{literal}', selection: true },
					]
				},
				{
					title: 'Change style',
					subprompts: [
						{ title: 'Business', prompt: '{/literal}{$btr->prompt_business|escape}{literal}', selection: true },
						{ title: 'Legal', prompt: '{/literal}{$btr->prompt_legal|escape}{literal}', selection: true },
						{ title: 'Journalism', prompt: '{/literal}{$btr->prompt_journalism|escape}{literal}', selection: true },
						{ title: 'Medical', prompt: '{/literal}{$btr->prompt_medical|escape}{literal}', selection: true },
						{ title: 'Poetic', prompt: '{/literal}{$btr->prompt_poetic|escape}{literal}', selection: true },
						]
					}
				]
		{/literal}
		{literal}}{/literal});
	});
</script>