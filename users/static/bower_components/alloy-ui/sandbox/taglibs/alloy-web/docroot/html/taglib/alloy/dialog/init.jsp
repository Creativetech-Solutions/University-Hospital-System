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
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("alloy:dialog:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("alloy:dialog:scopedAttributes");

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
java.util.HashMap align = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:align")));
java.util.ArrayList alignOn = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:alignOn")));
java.lang.String dialogBodyContent = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:dialog:dialogBodyContent"));
java.util.ArrayList buttons = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:buttons"), "[]"));
java.lang.Object centered = (java.lang.Object)request.getAttribute("alloy:dialog:centered");
boolean close = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:close")), true);
boolean collapsed = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:collapsed")), false);
boolean collapsible = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:collapsible")), false);
java.lang.Object constrain = (java.lang.Object)request.getAttribute("alloy:dialog:constrain");
java.util.HashMap constrain2view = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:constrain2view")));
boolean destroyOnClose = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:destroyOnClose")), false);
boolean destroyed = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:destroyed")), false);
boolean disabled = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:disabled")), false);
java.util.HashMap dragConfig = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:dragConfig")));
java.lang.Object dragInstance = (java.lang.Object)request.getAttribute("alloy:dialog:dragInstance");
boolean draggable = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:draggable")), true);
java.lang.Object fillHeight = (java.lang.Object)request.getAttribute("alloy:dialog:fillHeight");
boolean focused = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:focused")), false);
java.lang.Object footerContent = (java.lang.Object)request.getAttribute("alloy:dialog:footerContent");
java.lang.Object headerContent = (java.lang.Object)request.getAttribute("alloy:dialog:headerContent");
java.lang.Object height = (java.lang.Object)request.getAttribute("alloy:dialog:height");
java.util.ArrayList icons = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:icons"), "[]"));
java.lang.String dialogId = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:dialog:dialogId"));
boolean initialized = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:initialized")), false);
boolean modal = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:modal")), false);
boolean preventOverlap = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:preventOverlap")), false);
java.lang.Object render = (java.lang.Object)request.getAttribute("alloy:dialog:render");
boolean rendered = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:rendered")), false);
boolean resizable = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:resizable")), true);
java.util.HashMap resizableConfig = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:resizableConfig")));
java.lang.Object resizableInstance = (java.lang.Object)request.getAttribute("alloy:dialog:resizableInstance");
boolean shim = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:shim")), false);
boolean stack = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:stack")), true);
java.util.HashMap strings = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:strings")));
java.lang.Number tabIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:dialog:tabIndex")), 0);
java.lang.Object title = (java.lang.Object)request.getAttribute("alloy:dialog:title");
boolean useARIA = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:useARIA")), true);
boolean visible = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:dialog:visible")), true);
java.lang.Object width = (java.lang.Object)request.getAttribute("alloy:dialog:width");
java.lang.Number x = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:dialog:x")), 0);
java.util.ArrayList xy = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:dialog:xy"), "[0,0]"));
java.lang.Number y = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:dialog:y")), 0);
java.lang.Number zIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("alloy:dialog:zIndex")), 0);
java.lang.Object afterAlignChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterAlignChange");
java.lang.Object afterAlignOnChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterAlignOnChange");
java.lang.Object afterBodyContentChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterBodyContentChange");
java.lang.Object afterBoundingBoxChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterBoundingBoxChange");
java.lang.Object afterButtonsChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterButtonsChange");
java.lang.Object afterCenteredChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterCenteredChange");
java.lang.Object afterCloseChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterCloseChange");
java.lang.Object afterCollapsedChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterCollapsedChange");
java.lang.Object afterCollapsibleChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterCollapsibleChange");
java.lang.Object afterConstrain2viewChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterConstrain2viewChange");
java.lang.Object afterConstrainChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterConstrainChange");
java.lang.Object afterContentBoxChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterContentBoxChange");
java.lang.Object afterDestroy = (java.lang.Object)request.getAttribute("alloy:dialog:afterDestroy");
java.lang.Object afterDestroyOnCloseChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterDestroyOnCloseChange");
java.lang.Object afterDestroyedChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterDestroyedChange");
java.lang.Object afterDisabledChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterDisabledChange");
java.lang.Object afterDragConfigChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterDragConfigChange");
java.lang.Object afterDragInstanceChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterDragInstanceChange");
java.lang.Object afterDraggableChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterDraggableChange");
java.lang.Object afterFillHeightChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterFillHeightChange");
java.lang.Object afterFocusedChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterFocusedChange");
java.lang.Object afterFooterContentChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterFooterContentChange");
java.lang.Object afterHeaderContentChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterHeaderContentChange");
java.lang.Object afterHeightChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterHeightChange");
java.lang.Object afterIconsChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterIconsChange");
java.lang.Object afterIdChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterIdChange");
java.lang.Object afterInit = (java.lang.Object)request.getAttribute("alloy:dialog:afterInit");
java.lang.Object afterInitializedChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterInitializedChange");
java.lang.Object afterModalChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterModalChange");
java.lang.Object afterPreventOverlapChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterPreventOverlapChange");
java.lang.Object afterRenderChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterRenderChange");
java.lang.Object afterRenderedChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterRenderedChange");
java.lang.Object afterResizableChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterResizableChange");
java.lang.Object afterResizableConfigChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterResizableConfigChange");
java.lang.Object afterResizableInstanceChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterResizableInstanceChange");
java.lang.Object afterShimChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterShimChange");
java.lang.Object afterSrcNodeChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterSrcNodeChange");
java.lang.Object afterStackChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterStackChange");
java.lang.Object afterStringsChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterStringsChange");
java.lang.Object afterTabIndexChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterTabIndexChange");
java.lang.Object afterTitleChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterTitleChange");
java.lang.Object afterUseARIAChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterUseARIAChange");
java.lang.Object afterVisibleChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterVisibleChange");
java.lang.Object afterContentUpdate = (java.lang.Object)request.getAttribute("alloy:dialog:afterContentUpdate");
java.lang.Object afterRender = (java.lang.Object)request.getAttribute("alloy:dialog:afterRender");
java.lang.Object afterWidthChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterWidthChange");
java.lang.Object afterXChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterXChange");
java.lang.Object afterXyChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterXyChange");
java.lang.Object afterYChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterYChange");
java.lang.Object afterZIndexChange = (java.lang.Object)request.getAttribute("alloy:dialog:afterZIndexChange");
java.lang.Object onAlignChange = (java.lang.Object)request.getAttribute("alloy:dialog:onAlignChange");
java.lang.Object onAlignOnChange = (java.lang.Object)request.getAttribute("alloy:dialog:onAlignOnChange");
java.lang.Object onBodyContentChange = (java.lang.Object)request.getAttribute("alloy:dialog:onBodyContentChange");
java.lang.Object onBoundingBoxChange = (java.lang.Object)request.getAttribute("alloy:dialog:onBoundingBoxChange");
java.lang.Object onButtonsChange = (java.lang.Object)request.getAttribute("alloy:dialog:onButtonsChange");
java.lang.Object onCenteredChange = (java.lang.Object)request.getAttribute("alloy:dialog:onCenteredChange");
java.lang.Object onCloseChange = (java.lang.Object)request.getAttribute("alloy:dialog:onCloseChange");
java.lang.Object onCollapsedChange = (java.lang.Object)request.getAttribute("alloy:dialog:onCollapsedChange");
java.lang.Object onCollapsibleChange = (java.lang.Object)request.getAttribute("alloy:dialog:onCollapsibleChange");
java.lang.Object onConstrain2viewChange = (java.lang.Object)request.getAttribute("alloy:dialog:onConstrain2viewChange");
java.lang.Object onConstrainChange = (java.lang.Object)request.getAttribute("alloy:dialog:onConstrainChange");
java.lang.Object onContentBoxChange = (java.lang.Object)request.getAttribute("alloy:dialog:onContentBoxChange");
java.lang.Object onDestroy = (java.lang.Object)request.getAttribute("alloy:dialog:onDestroy");
java.lang.Object onDestroyOnCloseChange = (java.lang.Object)request.getAttribute("alloy:dialog:onDestroyOnCloseChange");
java.lang.Object onDestroyedChange = (java.lang.Object)request.getAttribute("alloy:dialog:onDestroyedChange");
java.lang.Object onDisabledChange = (java.lang.Object)request.getAttribute("alloy:dialog:onDisabledChange");
java.lang.Object onDragConfigChange = (java.lang.Object)request.getAttribute("alloy:dialog:onDragConfigChange");
java.lang.Object onDragInstanceChange = (java.lang.Object)request.getAttribute("alloy:dialog:onDragInstanceChange");
java.lang.Object onDraggableChange = (java.lang.Object)request.getAttribute("alloy:dialog:onDraggableChange");
java.lang.Object onFillHeightChange = (java.lang.Object)request.getAttribute("alloy:dialog:onFillHeightChange");
java.lang.Object onFocusedChange = (java.lang.Object)request.getAttribute("alloy:dialog:onFocusedChange");
java.lang.Object onFooterContentChange = (java.lang.Object)request.getAttribute("alloy:dialog:onFooterContentChange");
java.lang.Object onHeaderContentChange = (java.lang.Object)request.getAttribute("alloy:dialog:onHeaderContentChange");
java.lang.Object onHeightChange = (java.lang.Object)request.getAttribute("alloy:dialog:onHeightChange");
java.lang.Object onIconsChange = (java.lang.Object)request.getAttribute("alloy:dialog:onIconsChange");
java.lang.Object onIdChange = (java.lang.Object)request.getAttribute("alloy:dialog:onIdChange");
java.lang.Object onInit = (java.lang.Object)request.getAttribute("alloy:dialog:onInit");
java.lang.Object onInitializedChange = (java.lang.Object)request.getAttribute("alloy:dialog:onInitializedChange");
java.lang.Object onModalChange = (java.lang.Object)request.getAttribute("alloy:dialog:onModalChange");
java.lang.Object onPreventOverlapChange = (java.lang.Object)request.getAttribute("alloy:dialog:onPreventOverlapChange");
java.lang.Object onRenderChange = (java.lang.Object)request.getAttribute("alloy:dialog:onRenderChange");
java.lang.Object onRenderedChange = (java.lang.Object)request.getAttribute("alloy:dialog:onRenderedChange");
java.lang.Object onResizableChange = (java.lang.Object)request.getAttribute("alloy:dialog:onResizableChange");
java.lang.Object onResizableConfigChange = (java.lang.Object)request.getAttribute("alloy:dialog:onResizableConfigChange");
java.lang.Object onResizableInstanceChange = (java.lang.Object)request.getAttribute("alloy:dialog:onResizableInstanceChange");
java.lang.Object onShimChange = (java.lang.Object)request.getAttribute("alloy:dialog:onShimChange");
java.lang.Object onSrcNodeChange = (java.lang.Object)request.getAttribute("alloy:dialog:onSrcNodeChange");
java.lang.Object onStackChange = (java.lang.Object)request.getAttribute("alloy:dialog:onStackChange");
java.lang.Object onStringsChange = (java.lang.Object)request.getAttribute("alloy:dialog:onStringsChange");
java.lang.Object onTabIndexChange = (java.lang.Object)request.getAttribute("alloy:dialog:onTabIndexChange");
java.lang.Object onTitleChange = (java.lang.Object)request.getAttribute("alloy:dialog:onTitleChange");
java.lang.Object onUseARIAChange = (java.lang.Object)request.getAttribute("alloy:dialog:onUseARIAChange");
java.lang.Object onVisibleChange = (java.lang.Object)request.getAttribute("alloy:dialog:onVisibleChange");
java.lang.Object onContentUpdate = (java.lang.Object)request.getAttribute("alloy:dialog:onContentUpdate");
java.lang.Object onRender = (java.lang.Object)request.getAttribute("alloy:dialog:onRender");
java.lang.Object onWidthChange = (java.lang.Object)request.getAttribute("alloy:dialog:onWidthChange");
java.lang.Object onXChange = (java.lang.Object)request.getAttribute("alloy:dialog:onXChange");
java.lang.Object onXyChange = (java.lang.Object)request.getAttribute("alloy:dialog:onXyChange");
java.lang.Object onYChange = (java.lang.Object)request.getAttribute("alloy:dialog:onYChange");
java.lang.Object onZIndexChange = (java.lang.Object)request.getAttribute("alloy:dialog:onZIndexChange");

_updateOptions(_options, "align", align);
_updateOptions(_options, "alignOn", alignOn);
_updateOptions(_options, "dialogBodyContent", dialogBodyContent);
_updateOptions(_options, "boundingBox", boundingBox);
_updateOptions(_options, "buttons", buttons);
_updateOptions(_options, "centered", centered);
_updateOptions(_options, "close", close);
_updateOptions(_options, "collapsed", collapsed);
_updateOptions(_options, "collapsible", collapsible);
_updateOptions(_options, "constrain", constrain);
_updateOptions(_options, "constrain2view", constrain2view);
_updateOptions(_options, "contentBox", contentBox);
_updateOptions(_options, "destroyOnClose", destroyOnClose);
_updateOptions(_options, "destroyed", destroyed);
_updateOptions(_options, "disabled", disabled);
_updateOptions(_options, "dragConfig", dragConfig);
_updateOptions(_options, "dragInstance", dragInstance);
_updateOptions(_options, "draggable", draggable);
_updateOptions(_options, "fillHeight", fillHeight);
_updateOptions(_options, "focused", focused);
_updateOptions(_options, "footerContent", footerContent);
_updateOptions(_options, "headerContent", headerContent);
_updateOptions(_options, "height", height);
_updateOptions(_options, "icons", icons);
_updateOptions(_options, "dialogId", dialogId);
_updateOptions(_options, "initialized", initialized);
_updateOptions(_options, "modal", modal);
_updateOptions(_options, "preventOverlap", preventOverlap);
_updateOptions(_options, "render", render);
_updateOptions(_options, "rendered", rendered);
_updateOptions(_options, "resizable", resizable);
_updateOptions(_options, "resizableConfig", resizableConfig);
_updateOptions(_options, "resizableInstance", resizableInstance);
_updateOptions(_options, "shim", shim);
_updateOptions(_options, "srcNode", srcNode);
_updateOptions(_options, "stack", stack);
_updateOptions(_options, "strings", strings);
_updateOptions(_options, "tabIndex", tabIndex);
_updateOptions(_options, "title", title);
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
_updateOptions(_options, "afterButtonsChange", afterButtonsChange);
_updateOptions(_options, "afterCenteredChange", afterCenteredChange);
_updateOptions(_options, "afterCloseChange", afterCloseChange);
_updateOptions(_options, "afterCollapsedChange", afterCollapsedChange);
_updateOptions(_options, "afterCollapsibleChange", afterCollapsibleChange);
_updateOptions(_options, "afterConstrain2viewChange", afterConstrain2viewChange);
_updateOptions(_options, "afterConstrainChange", afterConstrainChange);
_updateOptions(_options, "afterContentBoxChange", afterContentBoxChange);
_updateOptions(_options, "afterDestroy", afterDestroy);
_updateOptions(_options, "afterDestroyOnCloseChange", afterDestroyOnCloseChange);
_updateOptions(_options, "afterDestroyedChange", afterDestroyedChange);
_updateOptions(_options, "afterDisabledChange", afterDisabledChange);
_updateOptions(_options, "afterDragConfigChange", afterDragConfigChange);
_updateOptions(_options, "afterDragInstanceChange", afterDragInstanceChange);
_updateOptions(_options, "afterDraggableChange", afterDraggableChange);
_updateOptions(_options, "afterFillHeightChange", afterFillHeightChange);
_updateOptions(_options, "afterFocusedChange", afterFocusedChange);
_updateOptions(_options, "afterFooterContentChange", afterFooterContentChange);
_updateOptions(_options, "afterHeaderContentChange", afterHeaderContentChange);
_updateOptions(_options, "afterHeightChange", afterHeightChange);
_updateOptions(_options, "afterIconsChange", afterIconsChange);
_updateOptions(_options, "afterIdChange", afterIdChange);
_updateOptions(_options, "afterInit", afterInit);
_updateOptions(_options, "afterInitializedChange", afterInitializedChange);
_updateOptions(_options, "afterModalChange", afterModalChange);
_updateOptions(_options, "afterPreventOverlapChange", afterPreventOverlapChange);
_updateOptions(_options, "afterRenderChange", afterRenderChange);
_updateOptions(_options, "afterRenderedChange", afterRenderedChange);
_updateOptions(_options, "afterResizableChange", afterResizableChange);
_updateOptions(_options, "afterResizableConfigChange", afterResizableConfigChange);
_updateOptions(_options, "afterResizableInstanceChange", afterResizableInstanceChange);
_updateOptions(_options, "afterShimChange", afterShimChange);
_updateOptions(_options, "afterSrcNodeChange", afterSrcNodeChange);
_updateOptions(_options, "afterStackChange", afterStackChange);
_updateOptions(_options, "afterStringsChange", afterStringsChange);
_updateOptions(_options, "afterTabIndexChange", afterTabIndexChange);
_updateOptions(_options, "afterTitleChange", afterTitleChange);
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
_updateOptions(_options, "onButtonsChange", onButtonsChange);
_updateOptions(_options, "onCenteredChange", onCenteredChange);
_updateOptions(_options, "onCloseChange", onCloseChange);
_updateOptions(_options, "onCollapsedChange", onCollapsedChange);
_updateOptions(_options, "onCollapsibleChange", onCollapsibleChange);
_updateOptions(_options, "onConstrain2viewChange", onConstrain2viewChange);
_updateOptions(_options, "onConstrainChange", onConstrainChange);
_updateOptions(_options, "onContentBoxChange", onContentBoxChange);
_updateOptions(_options, "onDestroy", onDestroy);
_updateOptions(_options, "onDestroyOnCloseChange", onDestroyOnCloseChange);
_updateOptions(_options, "onDestroyedChange", onDestroyedChange);
_updateOptions(_options, "onDisabledChange", onDisabledChange);
_updateOptions(_options, "onDragConfigChange", onDragConfigChange);
_updateOptions(_options, "onDragInstanceChange", onDragInstanceChange);
_updateOptions(_options, "onDraggableChange", onDraggableChange);
_updateOptions(_options, "onFillHeightChange", onFillHeightChange);
_updateOptions(_options, "onFocusedChange", onFocusedChange);
_updateOptions(_options, "onFooterContentChange", onFooterContentChange);
_updateOptions(_options, "onHeaderContentChange", onHeaderContentChange);
_updateOptions(_options, "onHeightChange", onHeightChange);
_updateOptions(_options, "onIconsChange", onIconsChange);
_updateOptions(_options, "onIdChange", onIdChange);
_updateOptions(_options, "onInit", onInit);
_updateOptions(_options, "onInitializedChange", onInitializedChange);
_updateOptions(_options, "onModalChange", onModalChange);
_updateOptions(_options, "onPreventOverlapChange", onPreventOverlapChange);
_updateOptions(_options, "onRenderChange", onRenderChange);
_updateOptions(_options, "onRenderedChange", onRenderedChange);
_updateOptions(_options, "onResizableChange", onResizableChange);
_updateOptions(_options, "onResizableConfigChange", onResizableConfigChange);
_updateOptions(_options, "onResizableInstanceChange", onResizableInstanceChange);
_updateOptions(_options, "onShimChange", onShimChange);
_updateOptions(_options, "onSrcNodeChange", onSrcNodeChange);
_updateOptions(_options, "onStackChange", onStackChange);
_updateOptions(_options, "onStringsChange", onStringsChange);
_updateOptions(_options, "onTabIndexChange", onTabIndexChange);
_updateOptions(_options, "onTitleChange", onTitleChange);
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

<%@ include file="/html/taglib/alloy/dialog/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "alloy:dialog:";
%>