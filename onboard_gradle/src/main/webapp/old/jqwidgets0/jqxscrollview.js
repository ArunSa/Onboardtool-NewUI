/*
jQWidgets v4.5.3 (2017-June)
Copyright (c) 2011-2017 jQWidgets.
License: http://jqwidgets.com/license/
*/
!function(a){var b=0;a.jqx.jqxWidget("jqxScrollView","",{}),a.extend(a.jqx._jqxScrollView.prototype,{defineInstance:function(){var b={width:320,height:320,buttonsOffset:[0,0],moveThreshold:.5,currentPage:0,animationDuration:300,showButtons:!0,bounceEnabled:!0,slideShow:!1,slideDuration:3e3,disabled:!1,_mouseDown:!1,_movePermited:!1,_startX:-1,_startOffset:-1,_lastOffset:-1,_events:["pageChanged"],_eventsMap:{mousedown:a.jqx.mobile.getTouchEventName("touchstart"),mouseup:a.jqx.mobile.getTouchEventName("touchend"),mousemove:a.jqx.mobile.getTouchEventName("touchmove")}};return this===a.jqx._jqxScrollView.prototype?b:(a.extend(!0,this,b),b)},createInstance:function(){b+=1,this._instanceId=b,this._isTouchDevice=a.jqx.mobile.isTouchDevice();var c=this;a.jqx.utilities.resize(this.host,function(){c.refresh()})},resize:function(a,b){this.width=a,this.height=b,this.refresh()},refresh:function(){if(this.host.width(this.width),this.host.height(this.height),this._render(),this._performLayout(),this.moveThreshold.toString().indexOf("%")>=0&&(this.moveThreshold=parseInt(this.moveThreshold,10)/100),this._refreshPages(),this._refreshButtons(),this._removeEventListeners(),this._addEventListeners(),this._changePage(this.currentPage,!1,0),this.slideShow){var a=this;this.slideShowTimer=setInterval(function(){a.currentPage>=a._pages.length-1?a._changePage(0,!0,a.animationDuration):a._changePage(a.currentPage+1,!0,a.animationDuration)},this.slideDuration)}else void 0!=this.slideShowTimer&&clearInterval(this.slideShowTimer)},destroy:function(){this.host.remove()},_getEvent:function(a){return this._isTouchDevice?this._eventsMap[a]:a},_eventNamespace:function(){return".scrollview"+this._instanceId},_removeEventListeners:function(){this.removeHandler(this._innerWrapper),this.removeHandler(this.host,this._getEvent("mousemove")+this._eventNamespace()),this.removeHandler(a(document),this._getEvent("mouseup")+this._eventNamespace())},_getCoordinate:function(b,c){if(this._isTouchDevice){var d=a.jqx.position(b);if("pageX"==c)return d.left;if("pageY"==c)return d.top;if(b.originalEvent.touches)return b.originalEvent.touches[0][c]}return b[c]},_draggedRight:function(){if(this.currentPage>0){var b=this.currentPage-1,c=a(this._pages[b]);if(c.offset().left+c.outerWidth()-this.host.offset().left>=this.host.width()*this.moveThreshold)return this.changePage(b),!0}return!1},_draggedLeft:function(){if(this.currentPage+1<this._pages.length){var b=this.currentPage+1,c=a(this._pages[b]);if(this.host.width()-(c.offset().left-this.host.offset().left)>=this.host.width()*this.moveThreshold)return this.changePage(b),!0}return!1},_dropTarget:function(){var a;(a=this._movedLeft?this._draggedLeft():this._draggedRight())||this.changePage(this.currentPage,!1)},_scrollEnabled:function(a){return!!this._mouseDown&&(this._movePermited||Math.abs(this._getCoordinate(a,"pageX")-this._startX)>=15&&(this._movePermited=!0),this._movePermited)},_setMoveDirection:function(a){this._lastOffset>a?this._movedLeft=!0:this._movedLeft=!1},_getBounceOffset:function(a){var b=-(this._innerWrapper.width()-this.host.width());return a>0?a=0:a<b&&(a=b),a},_addEventListeners:function(){var b=this;this.addHandler(this._innerWrapper,this._getEvent("mousedown")+this._eventNamespace(),function(a){b._mouseDown=!0,b._startX=b._getCoordinate(a,"pageX"),b._startOffset=b._lastOffset=parseInt(b._innerWrapper.css("margin-left"),10)}),this.addHandler(this.host,"dragstart",function(){return!1}),this.addHandler(this.host,this._getEvent("mousemove")+this._eventNamespace(),function(a){if(b._scrollEnabled(a)){var c=b._startOffset+b._getCoordinate(a,"pageX")-b._startX;return b.bounceEnabled||(c=b._getBounceOffset(c)),b._innerWrapper.css("margin-left",c),b._setMoveDirection(c),b._lastOffset=c,a.preventDefault(),!1}return!0}),this.addHandler(a(document),this._getEvent("mouseup")+this._eventNamespace(),function(a){b._movePermited&&b._dropTarget(),b._movePermited=!1,b._mouseDown=!1});try{if((""!=document.referrer||window.frameElement)&&(null!=window.top&&window.parent&&document.referrer&&(parentLocation=document.referrer),-1!=parentLocation.indexOf(document.location.host))){var c=function(a){b._movePermited&&b._dropTarget(),b._movePermited=!1,b._mouseDown=!1};window.top.document.addEventListener?window.top.document.addEventListener("mouseup",c,!1):window.top.document.attachEvent&&window.top.document.attachEvent("onmouseup",c)}}catch(a){}},_render:function(){this.host.addClass(this.toThemeProperty("jqx-scrollview")),this.host.css({overflow:"hidden",position:"relative"})},_performLayout:function(){this.host.css({width:this.width,height:this.height})},_renderPages:function(){this._innerWrapper||(this._innerWrapper=a("<div/>"),this.host.wrapInner(this._innerWrapper),this._innerWrapper=this.host.children().first()),this._innerWrapper.addClass(this.toThemeProperty("jqx-scrollview-inner-wrapper")),this._innerWrapper.height(this.host.height())},_refreshPage:function(a){a.addClass(this.toThemeProperty("jqx-scrollview-page")),this._performPageLayout(a)},_refreshPages:function(){var b=this,c=0;this._renderPages(),this._pages=this._innerWrapper.children(),this._pages.each(function(){b._refreshPage(a(this)),c+=a(this).outerWidth(!0)}),this._innerWrapper.width(c)},_performPageLayout:function(a){a.css("float","left"),a.width(this.host.width()),a.height(this.host.height())},_refreshButtons:function(){this._renderButtons(),this._removeButtonsEventListeners(),this._addButtonsEventListeners(),this._performButtonsLayout()},_removeButtonsEventListeners:function(){var b=this;this._buttonsContainer.children().each(function(){b.removeHandler(a(this))})},_addButtonsEventListeners:function(){var b=this;this._buttonsContainer.children().each(function(c){b.addHandler(a(this),"click",function(){b.changePage(c)})})},_performButtonsLayout:function(){var a=(this.host.width()-this._buttonsContainer.width())/2,b=0!=this._buttonsContainer.outerHeight()?this._buttonsContainer.outerHeight():14;this._buttonsContainer.css({position:"absolute",left:a+parseInt(this.buttonsOffset[0],10),top:this.host.height()-2*b+parseInt(this.buttonsOffset[1],10)-1})},_renderButtons:function(){this._buttonsContainer&&this._buttonsContainer.remove();var b;this._buttons=[],this._buttonsContainer=a("<span/>");for(var c=0;c<this._pages.length;c+=1)b=a('<span class="'+this.toThemeProperty("jqx-scrollview-button")+" "+this.toThemeProperty("jqx-fill-state-normal")+'"></span>'),this._buttonsContainer.append(b),this._buttons[c]=b;this._buttonsContainer.appendTo(this.host),this.showButtons||this._buttonsContainer.hide()},_raiseEvent:function(b,c){var d=new a.Event(this._events[b]);return d.args=c,this.host.trigger(d)},_swapButtons:function(a,b){this._buttons[a].removeClass(this.toThemeProperty("jqx-scrollview-button-selected")),this._buttons[a].removeClass(this.toThemeProperty("jqx-fill-state-pressed")),this._buttons[b].addClass(this.toThemeProperty("jqx-scrollview-button-selected")),this._buttons[b].addClass(this.toThemeProperty("jqx-fill-state-pressed"))},_changePage:function(b,c,d){if(!this.disabled){var e=a(this._pages[b]),f=(this.host.width()-e.width())/2,g=e.offset().left-this._innerWrapper.offset().left-f,h=this.currentPage,i=this;void 0===d&&(d=this.animationDuration),this._innerWrapper.stop(),this._swapButtons(this.currentPage,b),this.currentPage=b,this._innerWrapper.animate({marginLeft:-g},d,function(){c&&i._raiseEvent(0,{currentPage:b,oldPage:h})})}},propertyChangedHandler:function(a,b,c,d){if("currentPage"===b)a.currentPage=c,a.changePage(d);else if(/(buttonsOffset|width|height)/.test(b))a.refresh();else{if("showButtons"===b)return void(d?a._buttonsContainer.css("display","block"):a._buttonsContainer.css("display","none"));"slideShow"==b&&a.refresh()}},changePage:function(a){if(a>=this._pages.length||a<0)throw new Error("Invalid index!");this._changePage(a,!0)},forward:function(){this.currentPage+1<this._pages.length&&this.changePage(this.currentPage+1)},back:function(){this.currentPage-1>=0&&this.changePage(this.currentPage-1)}})}(jqxBaseFramework);

