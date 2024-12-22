{* JS Head *}

{literal}
	<script data-skip-moving="true">
		(function(w, d, n) {
			var cl = "tb-core";
			var ht = d.documentElement;
			var htc = ht ? ht.className : undefined;
			if (htc === undefined || htc.indexOf(cl) !== -1) {
				return;
			}
			var ua = n.userAgent;
			if (/(iPad;)|(iPhone;)/i.test(ua)) {
				cl += "tb-ios";
			} else if (/Windows/i.test(ua)) {
				cl += "tb-win";
			} else if (/Macintosh/i.test(ua)) {
				cl += "tb-mac";
			} else if (/Linux/i.test(ua) && !/Android/i.test(ua)) {
				cl += "tb-linux";
			} else if (/Android/i.test(ua)) {
				cl += "tb-android";
			}
			cl += /(ipad|iphone|android|mobile|touch)/i.test(ua) ? "tb-touch" : "tb-no-touch";
			cl += w.devicePixelRatio && w.devicePixelRatio >= 2 ? "tb-retina" : "tb-no-retina";
			var ieVersion = -1;
			if (/AppleWebKit/.test(ua)) {
				cl += "tb-chrome";
			} else if ((ieVersion = getIeVersion()) > 0) {
				cl += "tb-ie tb-ie" + ieVersion;
				if (ieVersion > 7 && ieVersion < 10 && !isDoctype()) {
					cl += "tb-quirks";
				}
			} else if (/Opera/.test(ua)) {
				cl += "tb-opera";
			} else if (/Gecko/.test(ua)) {
				cl += "tb-firefox";
			}
			ht.className = htc ? htc + " " + cl : cl;

			function isDoctype() {
				if (d.compatMode) {
					return d.compatMode == "CSS1Compat";
				}
				return d.documentElement && d.documentElement.clientHeight;
			}

			function getIeVersion() {
				if (/Opera/i.test(ua) || /Webkit/i.test(ua) || /Firefox/i.test(ua) || /Chrome/i.test(ua)) {
					return -1;
				}
				var rv = -1;
				if (!!w.MSStream && !w.ActiveXObject && "ActiveXObject" in w) {
					rv = 11;
				} else if (!!d.documentMode && d.documentMode >= 10) {
					rv = 10;
				} else if (!!d.documentMode && d.documentMode >= 9) {
					rv = 9;
				} else if (d.attachEvent && !/Opera/.test(ua)) {
					rv = 8;
				}
				if (rv == -1 || rv == 8) {
					var re;
					if (n.appName == "Microsoft Internet Explorer") {
						re = new RegExp("MSIE ([0-9]+[\.0-9]*)");
						if (re.exec(ua) != null) {
							rv = parseFloat(RegExp.$1);
						}
					} else if (n.appName == "Netscape") {
						rv = 11;
						re = new RegExp("Trident/.*rv:([0-9]+[\.0-9]*)");
						if (re.exec(ua) != null) {
							rv = parseFloat(RegExp.$1);
						}
					}
				}
				return rv;
			}
		})(window, document, navigator);
	</script>
{/literal}

{* JS *}
{js id="script" priority=99 include=[
	"design/{$settings->theme|escape}/js/jquery/jquery-3.6.0.min.js",
	"design/{$settings->theme|escape}/js/speed.js",
	"design/{$settings->theme|escape}/js/lazysizes.min.js",
	"design/{$settings->theme|escape}/js/ls.unveilhooks.min.js"
]}{/js}
{javascript minify=true}

{* Custom Scripts *}
{if $counters['head']}
	{foreach $counters['head'] as $counter}
		{$counter->code}
	{/foreach}
{/if}