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
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("alloy:image-viewer:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("alloy:image-viewer:scopedAttributes");

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
java.util.HashMap align = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:image-viewer:align")));
java.util.ArrayList alignOn = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:image-viewer:alignOn")));
boolean anim = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:anim")), true);
java.lang.Object arrowLeftEl = (java.lang.Object)request.getAttribute("alloy:image-viewer:arrowLeftEl");
java.lang.Object arrowRightEl = (java.lang.Object)request.getAttribute("alloy:image-viewer:arrowRightEl");
java.lang.Object imageviewerBodyContent = (java.lang.Object)request.getAttribute("alloy:image-viewer:imageviewerBodyContent");
java.lang.String caption = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:image-viewer:caption"));
java.lang.Object captionEl = (java.lang.Object)request.getAttribute("alloy:image-viewer:captionEl");
boolean captionFromTitle = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:captionFromTitle")), true);
boolean centered = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:centered")), true);
java.lang.Object closeEl = (java.lang.Object)request.getAttribute("alloy:image-viewer:closeEl");
java.lang.Object constrain = (java.lang.Object)request.getAttribute("alloy:image-viewer:constrain");
java.lang.String cssClass = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:image-viewer:cssClass"));
java.lang.Number currentIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:currentIndex")), 0);
boolean destroyed = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:destroyed")), false);
boolean disabled = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:disabled")), false);
java.lang.Object fillHeight = (java.lang.Object)request.getAttribute("alloy:image-viewer:fillHeight");
boolean focused = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:focused")), false);
java.lang.Object footerContent = (java.lang.Object)request.getAttribute("alloy:image-viewer:footerContent");
java.lang.Object headerContent = (java.lang.Object)request.getAttribute("alloy:image-viewer:headerContent");
java.lang.Object height = (java.lang.Object)request.getAttribute("alloy:image-viewer:height");
java.lang.String hideClass = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:image-viewer:hideClass"), "aui-helper-hidden");
java.lang.String imageviewerId = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:image-viewer:imageviewerId"));
java.lang.Object image = (java.lang.Object)request.getAttribute("alloy:image-viewer:image");
java.util.HashMap imageAnim = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:image-viewer:imageAnim")));
java.lang.Object infoEl = (java.lang.Object)request.getAttribute("alloy:image-viewer:infoEl");
java.lang.String infoTemplate = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:image-viewer:infoTemplate"), "Image {current} of {total}");
boolean initialized = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:initialized")), false);
java.lang.Object links = (java.lang.Object)request.getAttribute("alloy:image-viewer:links");
java.lang.Object loader = (java.lang.Object)request.getAttribute("alloy:image-viewer:loader");
boolean loading = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:loading")), false);
java.lang.Object loadingEl = (java.lang.Object)request.getAttribute("alloy:image-viewer:loadingEl");
java.lang.Number maxHeight = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:maxHeight")), 2147483647);
java.lang.Number maxWidth = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:maxWidth")), 2147483647);
java.lang.Object modal = (java.lang.Object)request.getAttribute("alloy:image-viewer:modal");
boolean preloadAllImages = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:preloadAllImages")), false);
boolean preventOverlap = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:preventOverlap")), false);
java.lang.Object render = (java.lang.Object)request.getAttribute("alloy:image-viewer:render");
boolean rendered = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:rendered")), false);
boolean shim = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:shim")), false);
boolean showArrows = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:showArrows")), true);
boolean showClose = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:showClose")), true);
java.util.HashMap strings = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:image-viewer:strings")));
java.lang.Number tabIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:tabIndex")), 0);
boolean totalLinks = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:totalLinks")), true);
boolean useARIA = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:useARIA")), true);
boolean visible = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:image-viewer:visible")), true);
java.lang.Object width = (java.lang.Object)request.getAttribute("alloy:image-viewer:width");
java.lang.Number x = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:x")), 0);
java.util.ArrayList xy = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:image-viewer:xy"), "[0,0]"));
java.lang.Number y = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:y")), 0);
java.lang.Number zIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:image-viewer:zIndex")), 0);
java.lang.Object afterAlignChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterAlignChange");
java.lang.Object afterAlignOnChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterAlignOnChange");
java.lang.Object afterAnim = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterAnim");
java.lang.Object afterAnimChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterAnimChange");
java.lang.Object afterArrowLeftElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterArrowLeftElChange");
java.lang.Object afterArrowRightElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterArrowRightElChange");
java.lang.Object afterBodyContentChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterBodyContentChange");
java.lang.Object afterBoundingBoxChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterBoundingBoxChange");
java.lang.Object afterCaptionChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCaptionChange");
java.lang.Object afterCaptionElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCaptionElChange");
java.lang.Object afterCaptionFromTitleChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCaptionFromTitleChange");
java.lang.Object afterCenteredChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCenteredChange");
java.lang.Object afterCloseElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCloseElChange");
java.lang.Object afterConstrainChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterConstrainChange");
java.lang.Object afterContentBoxChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterContentBoxChange");
java.lang.Object afterCssClassChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCssClassChange");
java.lang.Object afterCurrentIndexChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterCurrentIndexChange");
java.lang.Object afterDestroy = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterDestroy");
java.lang.Object afterDestroyedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterDestroyedChange");
java.lang.Object afterDisabledChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterDisabledChange");
java.lang.Object afterFillHeightChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterFillHeightChange");
java.lang.Object afterFocusedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterFocusedChange");
java.lang.Object afterFooterContentChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterFooterContentChange");
java.lang.Object afterHeaderContentChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterHeaderContentChange");
java.lang.Object afterHeightChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterHeightChange");
java.lang.Object afterHideClassChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterHideClassChange");
java.lang.Object afterIdChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterIdChange");
java.lang.Object afterImageAnimChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterImageAnimChange");
java.lang.Object afterImageChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterImageChange");
java.lang.Object afterInfoElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterInfoElChange");
java.lang.Object afterInfoTemplateChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterInfoTemplateChange");
java.lang.Object afterInit = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterInit");
java.lang.Object afterInitializedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterInitializedChange");
java.lang.Object afterLinksChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterLinksChange");
java.lang.Object afterLoad = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterLoad");
java.lang.Object afterLoaderChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterLoaderChange");
java.lang.Object afterLoadingChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterLoadingChange");
java.lang.Object afterLoadingElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterLoadingElChange");
java.lang.Object afterMaxHeightChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterMaxHeightChange");
java.lang.Object afterMaxWidthChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterMaxWidthChange");
java.lang.Object afterModalChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterModalChange");
java.lang.Object afterPreloadAllImagesChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterPreloadAllImagesChange");
java.lang.Object afterPreventOverlapChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterPreventOverlapChange");
java.lang.Object afterRenderChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterRenderChange");
java.lang.Object afterRenderedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterRenderedChange");
java.lang.Object afterRequest = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterRequest");
java.lang.Object afterShimChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterShimChange");
java.lang.Object afterShowArrowsChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterShowArrowsChange");
java.lang.Object afterShowCloseChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterShowCloseChange");
java.lang.Object afterSrcNodeChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterSrcNodeChange");
java.lang.Object afterStringsChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterStringsChange");
java.lang.Object afterTabIndexChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterTabIndexChange");
java.lang.Object afterTotalLinksChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterTotalLinksChange");
java.lang.Object afterUseARIAChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterUseARIAChange");
java.lang.Object afterVisibleChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterVisibleChange");
java.lang.Object afterContentUpdate = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterContentUpdate");
java.lang.Object afterRender = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterRender");
java.lang.Object afterWidthChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterWidthChange");
java.lang.Object afterXChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterXChange");
java.lang.Object afterXyChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterXyChange");
java.lang.Object afterYChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterYChange");
java.lang.Object afterZIndexChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:afterZIndexChange");
java.lang.Object onAlignChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onAlignChange");
java.lang.Object onAlignOnChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onAlignOnChange");
java.lang.Object onAnim = (java.lang.Object)request.getAttribute("alloy:image-viewer:onAnim");
java.lang.Object onAnimChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onAnimChange");
java.lang.Object onArrowLeftElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onArrowLeftElChange");
java.lang.Object onArrowRightElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onArrowRightElChange");
java.lang.Object onBodyContentChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onBodyContentChange");
java.lang.Object onBoundingBoxChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onBoundingBoxChange");
java.lang.Object onCaptionChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCaptionChange");
java.lang.Object onCaptionElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCaptionElChange");
java.lang.Object onCaptionFromTitleChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCaptionFromTitleChange");
java.lang.Object onCenteredChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCenteredChange");
java.lang.Object onCloseElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCloseElChange");
java.lang.Object onConstrainChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onConstrainChange");
java.lang.Object onContentBoxChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onContentBoxChange");
java.lang.Object onCssClassChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCssClassChange");
java.lang.Object onCurrentIndexChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onCurrentIndexChange");
java.lang.Object onDestroy = (java.lang.Object)request.getAttribute("alloy:image-viewer:onDestroy");
java.lang.Object onDestroyedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onDestroyedChange");
java.lang.Object onDisabledChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onDisabledChange");
java.lang.Object onFillHeightChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onFillHeightChange");
java.lang.Object onFocusedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onFocusedChange");
java.lang.Object onFooterContentChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onFooterContentChange");
java.lang.Object onHeaderContentChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onHeaderContentChange");
java.lang.Object onHeightChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onHeightChange");
java.lang.Object onHideClassChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onHideClassChange");
java.lang.Object onIdChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onIdChange");
java.lang.Object onImageAnimChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onImageAnimChange");
java.lang.Object onImageChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onImageChange");
java.lang.Object onInfoElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onInfoElChange");
java.lang.Object onInfoTemplateChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onInfoTemplateChange");
java.lang.Object onInit = (java.lang.Object)request.getAttribute("alloy:image-viewer:onInit");
java.lang.Object onInitializedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onInitializedChange");
java.lang.Object onLinksChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onLinksChange");
java.lang.Object onLoad = (java.lang.Object)request.getAttribute("alloy:image-viewer:onLoad");
java.lang.Object onLoaderChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onLoaderChange");
java.lang.Object onLoadingChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onLoadingChange");
java.lang.Object onLoadingElChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onLoadingElChange");
java.lang.Object onMaxHeightChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onMaxHeightChange");
java.lang.Object onMaxWidthChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onMaxWidthChange");
java.lang.Object onModalChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onModalChange");
java.lang.Object onPreloadAllImagesChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onPreloadAllImagesChange");
java.lang.Object onPreventOverlapChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onPreventOverlapChange");
java.lang.Object onRenderChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onRenderChange");
java.lang.Object onRenderedChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onRenderedChange");
java.lang.Object onRequest = (java.lang.Object)request.getAttribute("alloy:image-viewer:onRequest");
java.lang.Object onShimChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onShimChange");
java.lang.Object onShowArrowsChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onShowArrowsChange");
java.lang.Object onShowCloseChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onShowCloseChange");
java.lang.Object onSrcNodeChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onSrcNodeChange");
java.lang.Object onStringsChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onStringsChange");
java.lang.Object onTabIndexChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onTabIndexChange");
java.lang.Object onTotalLinksChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onTotalLinksChange");
java.lang.Object onUseARIAChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onUseARIAChange");
java.lang.Object onVisibleChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onVisibleChange");
java.lang.Object onContentUpdate = (java.lang.Object)request.getAttribute("alloy:image-viewer:onContentUpdate");
java.lang.Object onRender = (java.lang.Object)request.getAttribute("alloy:image-viewer:onRender");
java.lang.Object onWidthChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onWidthChange");
java.lang.Object onXChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onXChange");
java.lang.Object onXyChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onXyChange");
java.lang.Object onYChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onYChange");
java.lang.Object onZIndexChange = (java.lang.Object)request.getAttribute("alloy:image-viewer:onZIndexChange");

_updateOptions(_options, "align", align);
_updateOptions(_options, "alignOn", alignOn);
_updateOptions(_options, "anim", anim);
_updateOptions(_options, "arrowLeftEl", arrowLeftEl);
_updateOptions(_options, "arrowRightEl", arrowRightEl);
_updateOptions(_options, "imageviewerBodyContent", imageviewerBodyContent);
_updateOptions(_options, "boundingBox", boundingBox);
_updateOptions(_options, "caption", caption);
_updateOptions(_options, "captionEl", captionEl);
_updateOptions(_options, "captionFromTitle", captionFromTitle);
_updateOptions(_options, "centered", centered);
_updateOptions(_options, "closeEl", closeEl);
_updateOptions(_options, "constrain", constrain);
_updateOptions(_options, "contentBox", contentBox);
_updateOptions(_options, "cssClass", cssClass);
_updateOptions(_options, "currentIndex", currentIndex);
_updateOptions(_options, "destroyed", destroyed);
_updateOptions(_options, "disabled", disabled);
_updateOptions(_options, "fillHeight", fillHeight);
_updateOptions(_options, "focused", focused);
_updateOptions(_options, "footerContent", footerContent);
_updateOptions(_options, "headerContent", headerContent);
_updateOptions(_options, "height", height);
_updateOptions(_options, "hideClass", hideClass);
_updateOptions(_options, "imageviewerId", imageviewerId);
_updateOptions(_options, "image", image);
_updateOptions(_options, "imageAnim", imageAnim);
_updateOptions(_options, "infoEl", infoEl);
_updateOptions(_options, "infoTemplate", infoTemplate);
_updateOptions(_options, "initialized", initialized);
_updateOptions(_options, "links", links);
_updateOptions(_options, "loader", loader);
_updateOptions(_options, "loading", loading);
_updateOptions(_options, "loadingEl", loadingEl);
_updateOptions(_options, "maxHeight", maxHeight);
_updateOptions(_options, "maxWidth", maxWidth);
_updateOptions(_options, "modal", modal);
_updateOptions(_options, "preloadAllImages", preloadAllImages);
_updateOptions(_options, "preventOverlap", preventOverlap);
_updateOptions(_options, "render", render);
_updateOptions(_options, "rendered", rendered);
_updateOptions(_options, "shim", shim);
_updateOptions(_options, "showArrows", showArrows);
_updateOptions(_options, "showClose", showClose);
_updateOptions(_options, "srcNode", srcNode);
_updateOptions(_options, "strings", strings);
_updateOptions(_options, "tabIndex", tabIndex);
_updateOptions(_options, "totalLinks", totalLinks);
_updateOptions(_options, "useARIA", useARIA);
_updateOptions(_options, "visible", visible);
_updateOptions(_options, "width", width);
_updateOptions(_options, "x", x);
_updateOptions(_options, "xy", xy);
_updateOptions(_options, "y", y);
_updateOptions(_options, "zIndex", zIndex);
_updateOptions(_options, "afterAlignChange", afterAlignChange);
_updateOptions(_options, "afterAlignOnChange", afterAlignOnChange);
_updateOptions(_options, "afterAnim", afterAnim);
_updateOptions(_options, "afterAnimChange", afterAnimChange);
_updateOptions(_options, "afterArrowLeftElChange", afterArrowLeftElChange);
_updateOptions(_options, "afterArrowRightElChange", afterArrowRightElChange);
_updateOptions(_options, "afterBodyContentChange", afterBodyContentChange);
_updateOptions(_options, "afterBoundingBoxChange", afterBoundingBoxChange);
_updateOptions(_options, "afterCaptionChange", afterCaptionChange);
_updateOptions(_options, "afterCaptionElChange", afterCaptionElChange);
_updateOptions(_options, "afterCaptionFromTitleChange", afterCaptionFromTitleChange);
_updateOptions(_options, "afterCenteredChange", afterCenteredChange);
_updateOptions(_options, "afterCloseElChange", afterCloseElChange);
_updateOptions(_options, "afterConstrainChange", afterConstrainChange);
_updateOptions(_options, "afterContentBoxChange", afterContentBoxChange);
_updateOptions(_options, "afterCssClassChange", afterCssClassChange);
_updateOptions(_options, "afterCurrentIndexChange", afterCurrentIndexChange);
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
_updateOptions(_options, "afterImageAnimChange", afterImageAnimChange);
_updateOptions(_options, "afterImageChange", afterImageChange);
_updateOptions(_options, "afterInfoElChange", afterInfoElChange);
_updateOptions(_options, "afterInfoTemplateChange", afterInfoTemplateChange);
_updateOptions(_options, "afterInit", afterInit);
_updateOptions(_options, "afterInitializedChange", afterInitializedChange);
_updateOptions(_options, "afterLinksChange", afterLinksChange);
_updateOptions(_options, "afterLoad", afterLoad);
_updateOptions(_options, "afterLoaderChange", afterLoaderChange);
_updateOptions(_options, "afterLoadingChange", afterLoadingChange);
_updateOptions(_options, "afterLoadingElChange", afterLoadingElChange);
_updateOptions(_options, "afterMaxHeightChange", afterMaxHeightChange);
_updateOptions(_options, "afterMaxWidthChange", afterMaxWidthChange);
_updateOptions(_options, "afterModalChange", afterModalChange);
_updateOptions(_options, "afterPreloadAllImagesChange", afterPreloadAllImagesChange);
_updateOptions(_options, "afterPreventOverlapChange", afterPreventOverlapChange);
_updateOptions(_options, "afterRenderChange", afterRenderChange);
_updateOptions(_options, "afterRenderedChange", afterRenderedChange);
_updateOptions(_options, "afterRequest", afterRequest);
_updateOptions(_options, "afterShimChange", afterShimChange);
_updateOptions(_options, "afterShowArrowsChange", afterShowArrowsChange);
_updateOptions(_options, "afterShowCloseChange", afterShowCloseChange);
_updateOptions(_options, "afterSrcNodeChange", afterSrcNodeChange);
_updateOptions(_options, "afterStringsChange", afterStringsChange);
_updateOptions(_options, "afterTabIndexChange", afterTabIndexChange);
_updateOptions(_options, "afterTotalLinksChange", afterTotalLinksChange);
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
_updateOptions(_options, "onAnim", onAnim);
_updateOptions(_options, "onAnimChange", onAnimChange);
_updateOptions(_options, "onArrowLeftElChange", onArrowLeftElChange);
_updateOptions(_options, "onArrowRightElChange", onArrowRightElChange);
_updateOptions(_options, "onBodyContentChange", onBodyContentChange);
_updateOptions(_options, "onBoundingBoxChange", onBoundingBoxChange);
_updateOptions(_options, "onCaptionChange", onCaptionChange);
_updateOptions(_options, "onCaptionElChange", onCaptionElChange);
_updateOptions(_options, "onCaptionFromTitleChange", onCaptionFromTitleChange);
_updateOptions(_options, "onCenteredChange", onCenteredChange);
_updateOptions(_options, "onCloseElChange", onCloseElChange);
_updateOptions(_options, "onConstrainChange", onConstrainChange);
_updateOptions(_options, "onContentBoxChange", onContentBoxChange);
_updateOptions(_options, "onCssClassChange", onCssClassChange);
_updateOptions(_options, "onCurrentIndexChange", onCurrentIndexChange);
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
_updateOptions(_options, "onImageAnimChange", onImageAnimChange);
_updateOptions(_options, "onImageChange", onImageChange);
_updateOptions(_options, "onInfoElChange", onInfoElChange);
_updateOptions(_options, "onInfoTemplateChange", onInfoTemplateChange);
_updateOptions(_options, "onInit", onInit);
_updateOptions(_options, "onInitializedChange", onInitializedChange);
_updateOptions(_options, "onLinksChange", onLinksChange);
_updateOptions(_options, "onLoad", onLoad);
_updateOptions(_options, "onLoaderChange", onLoaderChange);
_updateOptions(_options, "onLoadingChange", onLoadingChange);
_updateOptions(_options, "onLoadingElChange", onLoadingElChange);
_updateOptions(_options, "onMaxHeightChange", onMaxHeightChange);
_updateOptions(_options, "onMaxWidthChange", onMaxWidthChange);
_updateOptions(_options, "onModalChange", onModalChange);
_updateOptions(_options, "onPreloadAllImagesChange", onPreloadAllImagesChange);
_updateOptions(_options, "onPreventOverlapChange", onPreventOverlapChange);
_updateOptions(_options, "onRenderChange", onRenderChange);
_updateOptions(_options, "onRenderedChange", onRenderedChange);
_updateOptions(_options, "onRequest", onRequest);
_updateOptions(_options, "onShimChange", onShimChange);
_updateOptions(_options, "onShowArrowsChange", onShowArrowsChange);
_updateOptions(_options, "onShowCloseChange", onShowCloseChange);
_updateOptions(_options, "onSrcNodeChange", onSrcNodeChange);
_updateOptions(_options, "onStringsChange", onStringsChange);
_updateOptions(_options, "onTabIndexChange", onTabIndexChange);
_updateOptions(_options, "onTotalLinksChange", onTotalLinksChange);
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

<%@ include file="/html/taglib/alloy/image_viewer/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "alloy:image-viewer:";
%>