/*!
 * jQuery Raty - A Star Rating Plugin
 *
 * The MIT License
 *
 * @author  : Washington Botelho
 * @doc     : http://wbotelhos.com/raty
 * @version : 2.7.0
 *
 */

(function(e){"use strict";var t={init:function(n){return this.each(function(){this.self=e(this);t.destroy.call(this.self);this.opt=e.extend(true,{},e.fn.raty.defaults,n);t._adjustCallback.call(this);t._adjustNumber.call(this);t._adjustHints.call(this);this.opt.score=t._adjustedScore.call(this,this.opt.score);if(this.opt.starType!=="img"){t._adjustStarType.call(this)}t._adjustPath.call(this);t._createStars.call(this);if(this.opt.cancel){t._createCancel.call(this)}if(this.opt.precision){t._adjustPrecision.call(this)}t._createScore.call(this);t._apply.call(this,this.opt.score);t._setTitle.call(this,this.opt.score);t._target.call(this,this.opt.score);if(this.opt.readOnly){t._lock.call(this)}else{this.style.cursor="pointer";t._binds.call(this)}})},_adjustCallback:function(){var e=["number","readOnly","score","scoreName","target"];for(var t=0;t<e.length;t++){if(typeof this.opt[e[t]]==="function"){this.opt[e[t]]=this.opt[e[t]].call(this)}}},_adjustedScore:function(e){if(!e){return e}return t._between(e,0,this.opt.number)},_adjustHints:function(){if(!this.opt.hints){this.opt.hints=[]}if(!this.opt.halfShow&&!this.opt.half){return}var e=this.opt.precision?10:2;for(var t=0;t<this.opt.number;t++){var n=this.opt.hints[t];if(Object.prototype.toString.call(n)!=="[object Array]"){n=[n]}this.opt.hints[t]=[];for(var r=0;r<e;r++){var i=n[r],s=n[n.length-1];if(s===undefined){s=null}this.opt.hints[t][r]=i===undefined?s:i}}},_adjustNumber:function(){this.opt.number=t._between(this.opt.number,1,this.opt.numberMax)},_adjustPath:function(){this.opt.path=this.opt.path||"";if(this.opt.path&&this.opt.path.charAt(this.opt.path.length-1)!=="/"){this.opt.path+="/"}},_adjustPrecision:function(){this.opt.half=true},_adjustStarType:function(){var e=["cancelOff","cancelOn","starHalf","starOff","starOn"];this.opt.path="";for(var t=0;t<e.length;t++){this.opt[e[t]]=this.opt[e[t]].replace(".","-")}},_apply:function(e){t._fill.call(this,e);if(e){if(e>0){this.score.val(e)}t._roundStars.call(this,e)}},_between:function(e,t,n){return Math.min(Math.max(parseFloat(e),t),n)},_binds:function(){if(this.cancel){t._bindOverCancel.call(this);t._bindClickCancel.call(this);t._bindOutCancel.call(this)}t._bindOver.call(this);t._bindClick.call(this);t._bindOut.call(this)},_bindClick:function(){var n=this;n.stars.on("click.raty",function(r){var i=true,s=n.opt.half||n.opt.precision?n.self.data("score"):this.alt||e(this).data("alt");if(n.opt.click){i=n.opt.click.call(n,+s,r)}if(i||i===undefined){if(n.opt.half&&!n.opt.precision){s=t._roundHalfScore.call(n,s)}t._apply.call(n,s)}})},_bindClickCancel:function(){var e=this;e.cancel.on("click.raty",function(t){e.score.removeAttr("value");if(e.opt.click){e.opt.click.call(e,null,t)}})},_bindOut:function(){var e=this;e.self.on("mouseleave.raty",function(n){var r=+e.score.val()||undefined;t._apply.call(e,r);t._target.call(e,r,n);t._resetTitle.call(e);if(e.opt.mouseout){e.opt.mouseout.call(e,r,n)}})},_bindOutCancel:function(){var e=this;e.cancel.on("mouseleave.raty",function(n){var r=e.opt.cancelOff;if(e.opt.starType!=="img"){r=e.opt.cancelClass+" "+r}t._setIcon.call(e,this,r);if(e.opt.mouseout){var i=+e.score.val()||undefined;e.opt.mouseout.call(e,i,n)}})},_bindOver:function(){var e=this,n=e.opt.half?"mousemove.raty":"mouseover.raty";e.stars.on(n,function(n){var r=t._getScoreByPosition.call(e,n,this);t._fill.call(e,r);if(e.opt.half){t._roundStars.call(e,r,n);t._setTitle.call(e,r,n);e.self.data("score",r)}t._target.call(e,r,n);if(e.opt.mouseover){e.opt.mouseover.call(e,r,n)}})},_bindOverCancel:function(){var e=this;e.cancel.on("mouseover.raty",function(n){var r=e.opt.path+e.opt.starOff,i=e.opt.cancelOn;if(e.opt.starType==="img"){e.stars.attr("src",r)}else{i=e.opt.cancelClass+" "+i;e.stars.attr("class",r)}t._setIcon.call(e,this,i);t._target.call(e,null,n);if(e.opt.mouseover){e.opt.mouseover.call(e,null)}})},_buildScoreField:function(){return e("<input />",{name:this.opt.scoreName,type:"hidden"}).appendTo(this)},_createCancel:function(){var t=this.opt.path+this.opt.cancelOff,n=e("<"+this.opt.starType+" />",{title:this.opt.cancelHint,"class":this.opt.cancelClass});if(this.opt.starType==="img"){n.attr({src:t,alt:"x"})}else{n.attr("data-alt","x").addClass(t)}if(this.opt.cancelPlace==="left"){this.self.prepend("&#160;").prepend(n)}else{this.self.append("&#160;").append(n)}this.cancel=n},_createScore:function(){var n=e(this.opt.targetScore);this.score=n.length?n:t._buildScoreField.call(this)},_createStars:function(){for(var n=1;n<=this.opt.number;n++){var r=t._nameForIndex.call(this,n),i={alt:n,src:this.opt.path+this.opt[r]};if(this.opt.starType!=="img"){i={"data-alt":n,"class":i.src}}i.title=t._getHint.call(this,n);e("<"+this.opt.starType+" />",i).appendTo(this);if(this.opt.space){this.self.append(n<this.opt.number?"&#160;":"")}}this.stars=this.self.children(this.opt.starType)},_error:function(t){e(this).text(t);e.error(t)},_fill:function(e){var n=0;for(var r=1;r<=this.stars.length;r++){var i,s=this.stars[r-1],o=t._turnOn.call(this,r,e);if(this.opt.iconRange&&this.opt.iconRange.length>n){var u=this.opt.iconRange[n];i=t._getRangeIcon.call(this,u,o);if(r<=u.range){t._setIcon.call(this,s,i)}if(r===u.range){n++}}else{i=this.opt[o?"starOn":"starOff"];t._setIcon.call(this,s,i)}}},_getFirstDecimal:function(e){var t=e.toString().split(".")[1],n=0;if(t){n=parseInt(t.charAt(0),10);if(t.slice(1,5)==="9999"){n++}}return n},_getRangeIcon:function(e,t){return t?e.on||this.opt.starOn:e.off||this.opt.starOff},_getScoreByPosition:function(n,r){var i=parseInt(r.alt||r.getAttribute("data-alt"),10);if(this.opt.half){var s=t._getWidth.call(this),o=parseFloat((n.pageX-e(r).offset().left)/s);i=i-1+o}return i},_getHint:function(e,n){if(e!==0&&!e){return this.opt.noRatedMsg}var r=t._getFirstDecimal.call(this,e),i=Math.ceil(e),s=this.opt.hints[(i||1)-1],o=s,u=!n||this.move;if(this.opt.precision){if(u){r=r===0?9:r-1}o=s[r]}else if(this.opt.halfShow||this.opt.half){r=u&&r===0?1:r>5?1:0;o=s[r]}return o===""?"":o||e},_getWidth:function(){var e=this.stars[0].width||parseFloat(this.stars.eq(0).css("font-size"));if(!e){t._error.call(this,"Could not get the icon width!")}return e},_lock:function(){var e=t._getHint.call(this,this.score.val());this.style.cursor="";this.title=e;this.score.prop("readonly",true);this.stars.prop("title",e);if(this.cancel){this.cancel.hide()}this.self.data("readonly",true)},_nameForIndex:function(e){return this.opt.score&&this.opt.score>=e?"starOn":"starOff"},_resetTitle:function(e){for(var n=0;n<this.opt.number;n++){this.stars[n].title=t._getHint.call(this,n+1)}},_roundHalfScore:function(e){var n=parseInt(e,10),r=t._getFirstDecimal.call(this,e);if(r!==0){r=r>5?1:.5}return n+r},_roundStars:function(e,n){var r=(e%1).toFixed(2),i;if(n||this.move){i=r>.5?"starOn":"starHalf"}else if(r>this.opt.round.down){i="starOn";if(this.opt.halfShow&&r<this.opt.round.up){i="starHalf"}else if(r<this.opt.round.full){i="starOff"}}if(i){var s=this.opt[i],o=this.stars[Math.ceil(e)-1];t._setIcon.call(this,o,s)}},_setIcon:function(e,t){e[this.opt.starType==="img"?"src":"className"]=this.opt.path+t},_setTarget:function(e,t){if(t){t=this.opt.targetFormat.toString().replace("{score}",t)}if(e.is(":input")){e.val(t)}else{e.html(t)}},_setTitle:function(e,n){if(e){var r=parseInt(Math.ceil(e),10),i=this.stars[r-1];i.title=t._getHint.call(this,e,n)}},_target:function(n,r){if(this.opt.target){var i=e(this.opt.target);if(!i.length){t._error.call(this,"Target selector invalid or missing!")}var s=r&&r.type==="mouseover";if(n===undefined){n=this.opt.targetText}else if(n===null){n=s?this.opt.cancelHint:this.opt.targetText}else{if(this.opt.targetType==="hint"){n=t._getHint.call(this,n,r)}else if(this.opt.precision){n=parseFloat(n).toFixed(1)}var o=r&&r.type==="mousemove";if(!s&&!o&&!this.opt.targetKeep){n=this.opt.targetText}}t._setTarget.call(this,i,n)}},_turnOn:function(e,t){return this.opt.single?e===t:e<=t},_unlock:function(){this.style.cursor="pointer";this.removeAttribute("title");this.score.removeAttr("readonly");this.self.data("readonly",false);for(var e=0;e<this.opt.number;e++){this.stars[e].title=t._getHint.call(this,e+1)}if(this.cancel){this.cancel.css("display","")}},cancel:function(n){return this.each(function(){var r=e(this);if(r.data("readonly")!==true){t[n?"click":"score"].call(r,null);this.score.removeAttr("value")}})},click:function(n){return this.each(function(){if(e(this).data("readonly")!==true){n=t._adjustedScore.call(this,n);t._apply.call(this,n);if(this.opt.click){this.opt.click.call(this,n,e.Event("click"))}t._target.call(this,n)}})},destroy:function(){return this.each(function(){var t=e(this),n=t.data("raw");if(n){t.off(".raty").empty().css({cursor:n.style.cursor}).removeData("readonly")}else{t.data("raw",t.clone()[0])}})},getScore:function(){var e=[],t;this.each(function(){t=this.score.val();e.push(t?+t:undefined)});return e.length>1?e:e[0]},move:function(n){return this.each(function(){var r=parseInt(n,10),i=t._getFirstDecimal.call(this,n);if(r>=this.opt.number){r=this.opt.number-1;i=10}var s=t._getWidth.call(this),o=s/10,u=e(this.stars[r]),a=u.offset().left+o*i,f=e.Event("mousemove",{pageX:a});this.move=true;u.trigger(f);this.move=false})},readOnly:function(n){return this.each(function(){var r=e(this);if(r.data("readonly")!==n){if(n){r.off(".raty").children("img").off(".raty");t._lock.call(this)}else{t._binds.call(this);t._unlock.call(this)}r.data("readonly",n)}})},reload:function(){return t.set.call(this,{})},score:function(){var n=e(this);return arguments.length?t.setScore.apply(n,arguments):t.getScore.call(n)},set:function(t){return this.each(function(){e(this).raty(e.extend({},this.opt,t))})},setScore:function(n){return this.each(function(){if(e(this).data("readonly")!==true){n=t._adjustedScore.call(this,n);t._apply.call(this,n);t._target.call(this,n)}})}};e.fn.raty=function(n){if(t[n]){return t[n].apply(this,Array.prototype.slice.call(arguments,1))}else if(typeof n==="object"||!n){return t.init.apply(this,arguments)}else{e.error("Method "+n+" does not exist!")}};e.fn.raty.defaults={cancel:false,cancelClass:"raty-cancel",cancelHint:"Cancel this rating!",cancelOff:"cancel-off.png",cancelOn:"cancel-on.png",cancelPlace:"left",click:undefined,half:false,halfShow:true,hints:["bad","poor","regular","good","gorgeous"],iconRange:undefined,mouseout:undefined,mouseover:undefined,noRatedMsg:"Not rated yet!",number:5,numberMax:20,path:undefined,precision:false,readOnly:false,round:{down:.25,full:.6,up:.76},score:undefined,scoreName:"score",single:false,space:true,starHalf:"star-half.png",starOff:"star-off.png",starOn:"star-on.png",starType:"img",target:undefined,targetFormat:"{score}",targetKeep:false,targetScore:undefined,targetText:"",targetType:"hint"}})(jQuery);


// RATING
if ($('.raty.raty-read').length > 0){
	$('.raty.raty-read').raty({
		half: true,
		starType: 'i',
		readOnly   : function() {
			return $(this).data('readonly');
		},
		score: function() {
			return $(this).data('score');
		},
		starOff: 'far fa-star',
		starOn: 'fa fa-star',
		starHalf: 'fas fa-star-half-alt'
	});
}

if ($('.raty.raty-write').length > 0){
	$('.raty.raty-write').raty({
		half: false,
		starType: 'i',
		click: function(score, evt) {
			$.ajax({
				url: "ajax/rating.php",
				data: {'id': $(this).data('id'), 'rating': score},
				success: function(data) {
					$('.raty.raty-write').raty({ 
						half: false,
						starType: 'i',
						readOnly: true, 
						score: score,
						starOff: 'far fa-star',
						starOn: 'fa fa-star',
						starHalf: 'fas fa-star-half-alt'
					});
					$('#rate').toast('show');
				}
			});
		},
		score: function() {
			return $(this).data('score');
		},
		starOff: 'far fa-star',
		starOn: 'fa fa-star',
		starHalf: 'fas fa-star-half-alt'
	});
}