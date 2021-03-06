<link href="turbo/design/js/admintooltip/css/admintooltip.css" rel="stylesheet">

{literal}
<script>
   $(function() {
	$("<a href='turbo/' class='admin_bookmark'><i class='custom-icon custom-icon-palette-settings'></i></a>").appendTo('body');
	tooltip = $("<div class='tooltips'><div class='tooltipHeader'></div><div class='tooltipBody'></div><div class='tooltipFooter'></div></div>").appendTo($('body'));		
	$('.tooltips').on('mouseleave', function(){tooltipcanclose=true;setTimeout("close_tooltip();", 300);});
	$('.tooltips').on('mouseover', function(){tooltipcanclose=false;});
	
	$('[data-page]').on('mouseover', show_tooltip);
	$('[data-category]').on('mouseover', show_tooltip);
	$('[data-brand]').on('mouseover', show_tooltip);
	$('[data-product]').on('mouseover', show_tooltip);
	$('[data-post]').on('mouseover', show_tooltip);
	$('[data-articles-category]').on('mouseover', show_tooltip);
    $('[data-article]').on('mouseover', show_tooltip);
	$('[data-feature]').on('mouseover', show_tooltip);
	});

	function show_tooltip()
	{
		tooltipcanclose=false;
		tooltip.show();
		$(this).on('mouseleave', function(){tooltipcanclose=true;setTimeout("close_tooltip();", 500);});

		flip = !($(this).offset().left+tooltip.width()+25 < $('body').width());

		tooltip.css('top',  $(this).height() + 5 + $(this).offset().top + 'px');
		tooltip.css('left', ($(this).offset().left + $(this).outerWidth()*0.5 - (flip ? tooltip.width()-40 : 0)  + 0) + 'px');
		tooltip.find('.tooltipHeader').addClass(flip ? 'tooltipHeaderFlip' : 'tooltipHeaderDirect').removeClass(flip ? 'tooltipHeaderDirect' : 'tooltipHeaderFlip');

		from = encodeURIComponent(window.location);
		tooltipcontent = '';
		
		var lang = '&lang_id={/literal}{$language->id}{literal}';
			if(typeof  lang_id != 'undefined') {
				lang = '&lang_id=' + lang_id;
			}
		
		if(id = $(this).attr('data-page'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=PageAdmin&id="+id+"&return="+from+lang+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_page}{literal}</a>";
			tooltipcontent += "<a href='turbo/index.php?module=PageAdmin&return="+from+lang+"' class=admin_tooltip_add>{/literal}{$btr->admintooltip_add_page}{literal}</a>";
		}
			
		if(id = $(this).attr('data-category'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=CategoryAdmin&id="+id+"&return="+from+lang+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_category}{literal}</a>";
			tooltipcontent += "<a href='turbo/index.php?module=ProductAdmin&category_id="+id+"&return="+from+lang+"' class=admin_tooltip_add>{/literal}{$btr->admintooltip_add_product}{literal}</a>";
		}
		
		if(id = $(this).attr('data-brand'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=BrandAdmin&id="+id+"&return="+from+lang+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_brand}{literal}</a>";
		}
		
		if(id = $(this).attr('data-product'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=ProductAdmin&id="+id+"&return="+from+lang+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_product}{literal}</a>";
		}
		
		if(id = $(this).attr('data-articles-category'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=ArticlesCategoryAdmin&id="+id+"&return="+from+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_category}{literal}</a>";
			tooltipcontent += "<a href='turbo/index.php?module=ArticleAdmin&return="+from+"' class=admin_tooltip_add>{/literal}{$btr->article_add}{literal}</a>";
		}
		
		if(id = $(this).attr('data-article'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=ArticleAdmin&id="+id+"&return="+from+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_post}{literal}</a>";
		}
		
		if(id = $(this).attr('data-post'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=PostAdmin&id="+id+"&return="+from+lang+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_post}{literal}</a>";
		}

		if(id = $(this).attr('data-feature'))
		{
			tooltipcontent = "<a href='turbo/index.php?module=FeatureAdmin&id="+id+"&return="+from+lang+"' class=admin_tooltip_edit>{/literal}{$btr->admintooltip_edit_feature}{literal}</a>";
		}
		
		$('.tooltipBody').html(tooltipcontent);
	}

	function close_tooltip()
	{
		if(tooltipcanclose)
		{
			tooltipcanclose=false;
			tooltip.hide();
		}
	}

	function ShowTooltip(i, content) {

		tooltip = document.getElementById('tooltip');

		document.getElementById('tooltipBody').innerHTML = content;
		tooltip.style.display = 'block';

		var xleft=0;
		var xtop=0;
		o = i;

		do {
			xleft += o.offsetLeft;
			xtop  += o.offsetTop;

		} while (o=o.offsetParent);

		xwidth  = i.offsetWidth  ? i.offsetWidth  : i.style.pixelWidth;
		xheight = i.offsetHeight ? i.offsetHeight : i.style.pixelHeight;

		bwidth =  tooltip.offsetWidth  ? tooltip.offsetWidth  : tooltip.style.pixelWidth;

		w = window;

		xbody  = document.compatMode=='CSS1Compat' ? w.document.documentElement : w.document.body;
		dwidth = xbody.clientWidth  ? xbody.clientWidth   : w.innerWidth;
		bwidth = tooltip.offsetWidth ? tooltip.offsetWidth  : tooltip.style.pixelWidth;

		flip = !( 25 + xleft + bwidth < dwidth);

		tooltip.style.top  = xheight - 3 + xtop + 'px';
		tooltip.style.left = (xleft - (flip ? bwidth : 0)  + 25) + 'px';

		document.getElementById('tooltipHeader').className = flip ? 'tooltipHeaderFlip' : 'tooltipHeaderDirect';

		return false;
	}
</script>
{/literal}