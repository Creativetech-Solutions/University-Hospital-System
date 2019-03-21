<%--
/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

@generated
--%>

<%@ include file="/html/taglib/taglib-init.jsp" %>

<%
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("alloy:overlay-base:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("alloy:overlay-base:scopedAttributes");

Map<String, Object> _options = new HashMap<String, Object>();

if ((scopedAttributes != null) && !scopedAttributes.isEmpty()) {
	_options.putAll(scopedAttributes);
}

if ((dynamicAttributes != null) && !dynamicAttributes.isEmpty()) {
	_options.putAll(dynamicAttributes);
}

%>

<%@ include file="/html/taglib/aui/init-alloy.jspf" %>

<%
java.util.HashMap align = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:overlay-base:align")));
java.util.ArrayList alignOn = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:overlay-base:alignOn")));
java.lang.Object overlaybaseBodyContent = (java.lang.Object)request.getAttribute("alloy:overlay-base:overlaybaseBodyContent");
java.lang.Object centered = (java.lang.Object)request.getAttribute("alloy:overlay-base:centered");
java.lang.Object constrain = (java.lang.Object)request.getAttribute("alloy:overlay-base:constrain");
java.lang.String cssClass = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:overlay-base:cssClass"));
boolean destroyed = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:destroyed")), false);
boolean disabled = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:disabled")), false);
java.lang.Object fillHeight = (java.lang.Object)request.getAttribute("alloy:overlay-base:fillHeight");
boolean focused = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:focused")), false);
java.lang.Object footerContent = (java.lang.Object)request.getAttribute("alloy:overlay-base:footerContent");
java.lang.Object headerContent = (java.lang.Object)request.getAttribute("alloy:overlay-base:headerContent");
java.lang.Object height = (java.lang.Object)request.getAttribute("alloy:overlay-base:height");
java.lang.String hideClass = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:overlay-base:hideClass"), "aui-helper-hidden");
java.lang.String overlaybaseId = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:overlay-base:overlaybaseId"));
boolean initialized = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:initialized")), false);
boolean preventOverlap = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:preventOverlap")), false);
java.lang.Object render = (java.lang.Object)request.getAttribute("alloy:overlay-base:render");
boolean rendered = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:rendered")), false);
boolean shim = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:shim")), false);
java.util.HashMap strings = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:overlay-base:strings")));
java.lang.Number tabIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:overlay-base:tabIndex")), 0);
boolean useARIA = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:useARIA")), true);
boolean visible = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:overlay-base:visible")), true);
java.lang.Object width = (java.lang.Object)request.getAttribute("alloy:overlay-base:width");
java.lang.Number x = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:overlay-base:x")), 0);
java.util.ArrayList xy = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:overlay-base:xy"), "[0,0]"));
java.lang.Number y = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:overlay-base:y")), 0);
java.lang.Number zIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:overlay-base:zIndex")), 0);
java.lang.Object afterAlignChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterAlignChange");
java.lang.Object afterAlignOnChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterAlignOnChange");
java.lang.Object afterBodyContentChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterBodyContentChange");
java.lang.Object afterBoundingBoxChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterBoundingBoxChange");
java.lang.Object afterCenteredChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterCenteredChange");
java.lang.Object afterConstrainChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterConstrainChange");
java.lang.Object afterContentBoxChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterContentBoxChange");
java.lang.Object afterCssClassChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterCssClassChange");
java.lang.Object afterDestroy = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterDestroy");
java.lang.Object afterDestroyedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterDestroyedChange");
java.lang.Object afterDisabledChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterDisabledChange");
java.lang.Object afterFillHeightChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterFillHeightChange");
java.lang.Object afterFocusedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterFocusedChange");
java.lang.Object afterFooterContentChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterFooterContentChange");
java.lang.Object afterHeaderContentChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterHeaderContentChange");
java.lang.Object afterHeightChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterHeightChange");
java.lang.Object afterHideClassChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterHideClassChange");
java.lang.Object afterIdChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterIdChange");
java.lang.Object afterInit = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterInit");
java.lang.Object afterInitializedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterInitializedChange");
java.lang.Object afterPreventOverlapChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterPreventOverlapChange");
java.lang.Object afterRenderChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterRenderChange");
java.lang.Object afterRenderedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterRenderedChange");
java.lang.Object afterShimChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterShimChange");
java.lang.Object afterSrcNodeChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterSrcNodeChange");
java.lang.Object afterStringsChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterStringsChange");
java.lang.Object afterTabIndexChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterTabIndexChange");
java.lang.Object afterUseARIAChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterUseARIAChange");
java.lang.Object afterVisibleChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterVisibleChange");
java.lang.Object afterContentUpdate = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterContentUpdate");
java.lang.Object afterRender = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterRender");
java.lang.Object afterWidthChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterWidthChange");
java.lang.Object afterXChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterXChange");
java.lang.Object afterXyChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterXyChange");
java.lang.Object afterYChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterYChange");
java.lang.Object afterZIndexChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:afterZIndexChange");
java.lang.Object onAlignChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onAlignChange");
java.lang.Object onAlignOnChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onAlignOnChange");
java.lang.Object onBodyContentChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onBodyContentChange");
java.lang.Object onBoundingBoxChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onBoundingBoxChange");
java.lang.Object onCenteredChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onCenteredChange");
java.lang.Object onConstrainChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onConstrainChange");
java.lang.Object onContentBoxChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onContentBoxChange");
java.lang.Object onCssClassChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onCssClassChange");
java.lang.Object onDestroy = (java.lang.Object)request.getAttribute("alloy:overlay-base:onDestroy");
java.lang.Object onDestroyedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onDestroyedChange");
java.lang.Object onDisabledChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onDisabledChange");
java.lang.Object onFillHeightChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onFillHeightChange");
java.lang.Object onFocusedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onFocusedChange");
java.lang.Object onFooterContentChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onFooterContentChange");
java.lang.Object onHeaderContentChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onHeaderContentChange");
java.lang.Object onHeightChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onHeightChange");
java.lang.Object onHideClassChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onHideClassChange");
java.lang.Object onIdChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onIdChange");
java.lang.Object onInit = (java.lang.Object)request.getAttribute("alloy:overlay-base:onInit");
java.lang.Object onInitializedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onInitializedChange");
java.lang.Object onPreventOverlapChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onPreventOverlapChange");
java.lang.Object onRenderChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onRenderChange");
java.lang.Object onRenderedChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onRenderedChange");
java.lang.Object onShimChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onShimChange");
java.lang.Object onSrcNodeChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onSrcNodeChange");
java.lang.Object onStringsChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onStringsChange");
java.lang.Object onTabIndexChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onTabIndexChange");
java.lang.Object onUseARIAChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onUseARIAChange");
java.lang.Object onVisibleChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onVisibleChange");
java.lang.Object onContentUpdate = (java.lang.Object)request.getAttribute("alloy:overlay-base:onContentUpdate");
java.lang.Object onRender = (java.lang.Object)request.getAttribute("alloy:overlay-base:onRender");
java.lang.Object onWidthChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onWidthChange");
java.lang.Object onXChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onXChange");
java.lang.Object onXyChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onXyChange");
java.lang.Object onYChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onYChange");
java.lang.Object onZIndexChange = (java.lang.Object)request.getAttribute("alloy:overlay-base:onZIndexChange");

_updateOptions(_options, "align", align);
_updateOptions(_options, "alignOn", alignOn);
_updateOptions(_options, "overlaybaseBodyContent", overlaybaseBodyContent);
_updateOptions(_options, "boundingBox", boundingBox);
_updateOptions(_options, "centered", centered);
_updateOptions(_options, "constrain", constrain);
_updateOptions(_options, "contentBox", contentBox);
_updateOptions(_options, "cssClass", cssClass);
_updateOptions(_options, "destroyed", destroyed);
_updateOptions(_options, "disabled", disabled);
_updateOptions(_options, "fillHeight", fillHeight);
_updateOptions(_options, "focused", focused);
_updateOptions(_options, "footerContent", footerContent);
_updateOptions(_options, "headerContent", headerContent);
_updateOptions(_options, "height", height);
_updateOptions(_options, "hideClass", hideClass);
_updateOptions(_options, "overlaybaseId", overlaybaseId);
_updateOptions(_options, "initialized", initialized);
_updateOptions(_options, "preventOverlap", preventOverlap);
_updateOptions(_options, "render", render);
_updateOptions(_options, "rendered", rendered);
_updateOptions(_options, "shim", shim);
_updateOptions(_options, "srcNode", srcNode);
_updateOptions(_options, "strings", strings);
_updateOptions(_options, "tabIndex", tabIndex);
_updateOptions(_options, "useARIA", useARIA);
_updateOptions(_options, "visible", visible);
_updateOptions(_options, "width", width);
_updateOptions(_options, "x", x);
_updateOptions(_options, "xy", xy);
_updateOptions(_options, "y", y);
_updateOptions(_options, "zIndex", zIndex);
_updateOptions(_options, "afterAlignChange", afterAlignChange);
_updateOptions(_options, "afterAlignOnChange", afterAlignOnChange);
_updateOptions(_options, "afterBodyContentChange", afterBodyContentChange);
_updateOptions(_options, "afterBoundingBoxChange", afterBoundingBoxChange);
_updateOptions(_options, "afterCenteredChange", afterCenteredChange);
_updateOptions(_options, "afterConstrainChange", afterConstrainChange);
_updateOptions(_options, "afterContentBoxChange", afterContentBoxChange);
_updateOptions(_options, "afterCssClassChange", afterCssClassChange);
_updateOptions(_options, "afterDestroy", afterDestroy);
_updateOptions(_options, "afterDestroyedChange", afterDestroyedChange);
_updateOptions(_options, "afterDisabledChange", afterDisabledChange);
_updateOptions(_options, "afterFillHeightChange", afterFillHeightChange);
_updateOptions(_options, "afterFocusedChange", afterFocusedChange);
_updateOptions(_options, "afterFooterContentChange", afterFooterContentChange);
_updateOptions(_options, "afterHeaderContentChange", afterHeaderContentChange);
_updateOptions(_options, "afterHeightChange", afterHeightChange);
_updateOptions(_options, "afterHideClassChange", afterHideClassChange);
_updateOptions(_options, "afterIdChange", afterIdChange);
_updateOptions(_options, "afterInit", afterInit);
_updateOptions(_options, "afterInitializedChange", afterInitializedChange);
_updateOptions(_options, "afterPreventOverlapChange", afterPreventOverlapChange);
_updateOptions(_options, "afterRenderChange", afterRenderChange);
_updateOptions(_options, "afterRenderedChange", afterRenderedChange);
_updateOptions(_options, "afterShimChange", afterShimChange);
_updateOptions(_options, "afterSrcNodeChange", afterSrcNodeChange);
_updateOptions(_options, "afterStringsChange", afterStringsChange);
_updateOptions(_options, "afterTabIndexChange", afterTabIndexChange);
_updateOptions(_options, "afterUseARIAChange", afterUseARIAChange);
_updateOptions(_options, "afterVisibleChange", afterVisibleChange);
_updateOptions(_options, "afterContentUpdate", afterContentUpdate);
_updateOptions(_options, "afterRender", afterRender);
_updateOptions(_options, "afterWidthChange", afterWidthChange);
_updateOptions(_options, "afterXChange", afterXChange);
_updateOptions(_options, "afterXyChange", afterXyChange);
_updateOptions(_options, "afterYChange", afterYChange);
_updateOptions(_options, "afterZIndexChange", afterZIndexChange);
_updateOptions(_options, "onAlignChange", onAlignChange);
_updateOptions(_options, "onAlignOnChange", onAlignOnChange);
_updateOptions(_options, "onBodyContentChange", onBodyContentChange);
_updateOptions(_options, "onBoundingBoxChange", onBoundingBoxChange);
_updateOptions(_options, "onCenteredChange", onCenteredChange);
_updateOptions(_options, "onConstrainChange", onConstrainChange);
_updateOptions(_options, "onContentBoxChange", onContentBoxChange);
_updateOptions(_options, "onCssClassChange", onCssClassChange);
_updateOptions(_options, "onDestroy", onDestroy);
_updateOptions(_options, "onDestroyedChange", onDestroyedChange);
_updateOptions(_options, "onDisabledChange", onDisabledChange);
_updateOptions(_options, "onFillHeightChange", onFillHeightChange);
_updateOptions(_options, "onFocusedChange", onFocusedChange);
_updateOptions(_options, "onFooterContentChange", onFooterContentChange);
_updateOptions(_options, "onHeaderContentChange", onHeaderContentChange);
_updateOptions(_options, "onHeightChange", onHeightChange);
_updateOptions(_options, "onHideClassChange", onHideClassChange);
_updateOptions(_options, "onIdChange", onIdChange);
_updateOptions(_options, "onInit", onInit);
_updateOptions(_options, "onInitializedChange", onInitializedChange);
_updateOptions(_options, "onPreventOverlapChange", onPreventOverlapChange);
_updateOptions(_options, "onRenderChange", onRenderChange);
_updateOptions(_options, "onRenderedChange", onRenderedChange);
_updateOptions(_options, "onShimChange", onShimChange);
_updateOptions(_options, "onSrcNodeChange", onSrcNodeChange);
_updateOptions(_options, "onStringsChange", onStringsChange);
_updateOptions(_options, "onTabIndexChange", onTabIndexChange);
_updateOptions(_options, "onUseARIAChange", onUseARIAChange);
_updateOptions(_options, "onVisibleChange", onVisibleChange);
_updateOptions(_options, "onContentUpdate", onContentUpdate);
_updateOptions(_options, "onRender", onRender);
_updateOptions(_options, "onWidthChange", onWidthChange);
_updateOptions(_options, "onXChange", onXChange);
_updateOptions(_options, "onXyChange", onXyChange);
_updateOptions(_options, "onYChange", onYChange);
_updateOptions(_options, "onZIndexChange", onZIndexChange);
%>

<%@ include file="/html/taglib/alloy/overlay_base/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "alloy:overlay-base:";
%>