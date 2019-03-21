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
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("alloy:tree-node-task:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("alloy:tree-node-task:scopedAttributes");

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
boolean alwaysShowHitArea = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:alwaysShowHitArea")), true);
boolean cache = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:cache")), true);
java.lang.String checkContainerEl = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:checkContainerEl"));
java.lang.String checkEl = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:checkEl"));
java.lang.String checkName = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:checkName"), "tree-node-check");
boolean checked = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:checked")), false);
java.util.ArrayList children = _toArrayList(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:tree-node-task:children"), "[]"));
java.lang.String container = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:container"));
boolean destroyed = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:destroyed")), false);
boolean draggable = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:draggable")), true);
boolean expanded = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:expanded")), false);
java.lang.String hitAreaEl = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:hitAreaEl"));
java.lang.String iconEl = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:iconEl"));
java.lang.String treenodetaskId = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:treenodetaskId"));
java.util.HashMap index = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:tree-node-task:index"), "{}"));
boolean initialized = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:initialized")), false);
java.util.HashMap io = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("alloy:tree-node-task:io")));
java.lang.String label = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:label"));
java.lang.String labelEl = GetterUtil.getString((java.lang.String)request.getAttribute("alloy:tree-node-task:labelEl"));
boolean leaf = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:leaf")), true);
boolean loaded = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:loaded")), false);
boolean loading = GetterUtil.getBoolean(String.valueOf(request.getAttribute("alloy:tree-node-task:loading")), false);
java.lang.Object nextSibling = (java.lang.Object)request.getAttribute("alloy:tree-node-task:nextSibling");
java.lang.Object ownerTree = (java.lang.Object)request.getAttribute("alloy:tree-node-task:ownerTree");
java.lang.Object parentNode = (java.lang.Object)request.getAttribute("alloy:tree-node-task:parentNode");
java.lang.Object prevSibling = (java.lang.Object)request.getAttribute("alloy:tree-node-task:prevSibling");
java.lang.Object afterAlwaysShowHitAreaChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterAlwaysShowHitAreaChange");
java.lang.Object afterCacheChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterCacheChange");
java.lang.Object afterCheckContainerElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterCheckContainerElChange");
java.lang.Object afterCheckElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterCheckElChange");
java.lang.Object afterCheckNameChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterCheckNameChange");
java.lang.Object afterCheckedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterCheckedChange");
java.lang.Object afterChildrenChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterChildrenChange");
java.lang.Object afterContainerChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterContainerChange");
java.lang.Object afterDestroy = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterDestroy");
java.lang.Object afterDestroyedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterDestroyedChange");
java.lang.Object afterDraggableChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterDraggableChange");
java.lang.Object afterExpandedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterExpandedChange");
java.lang.Object afterHitAreaElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterHitAreaElChange");
java.lang.Object afterIconElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterIconElChange");
java.lang.Object afterIdChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterIdChange");
java.lang.Object afterIndexChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterIndexChange");
java.lang.Object afterInit = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterInit");
java.lang.Object afterInitializedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterInitializedChange");
java.lang.Object afterIoChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterIoChange");
java.lang.Object afterLabelChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterLabelChange");
java.lang.Object afterLabelElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterLabelElChange");
java.lang.Object afterLeafChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterLeafChange");
java.lang.Object afterLoadedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterLoadedChange");
java.lang.Object afterLoadingChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterLoadingChange");
java.lang.Object afterNextSiblingChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterNextSiblingChange");
java.lang.Object afterOwnerTreeChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterOwnerTreeChange");
java.lang.Object afterParentNodeChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterParentNodeChange");
java.lang.Object afterPrevSiblingChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:afterPrevSiblingChange");
java.lang.Object onAlwaysShowHitAreaChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onAlwaysShowHitAreaChange");
java.lang.Object onCacheChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onCacheChange");
java.lang.Object onCheckContainerElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onCheckContainerElChange");
java.lang.Object onCheckElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onCheckElChange");
java.lang.Object onCheckNameChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onCheckNameChange");
java.lang.Object onCheckedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onCheckedChange");
java.lang.Object onChildrenChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onChildrenChange");
java.lang.Object onContainerChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onContainerChange");
java.lang.Object onDestroy = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onDestroy");
java.lang.Object onDestroyedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onDestroyedChange");
java.lang.Object onDraggableChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onDraggableChange");
java.lang.Object onExpandedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onExpandedChange");
java.lang.Object onHitAreaElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onHitAreaElChange");
java.lang.Object onIconElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onIconElChange");
java.lang.Object onIdChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onIdChange");
java.lang.Object onIndexChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onIndexChange");
java.lang.Object onInit = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onInit");
java.lang.Object onInitializedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onInitializedChange");
java.lang.Object onIoChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onIoChange");
java.lang.Object onLabelChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onLabelChange");
java.lang.Object onLabelElChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onLabelElChange");
java.lang.Object onLeafChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onLeafChange");
java.lang.Object onLoadedChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onLoadedChange");
java.lang.Object onLoadingChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onLoadingChange");
java.lang.Object onNextSiblingChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onNextSiblingChange");
java.lang.Object onOwnerTreeChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onOwnerTreeChange");
java.lang.Object onParentNodeChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onParentNodeChange");
java.lang.Object onPrevSiblingChange = (java.lang.Object)request.getAttribute("alloy:tree-node-task:onPrevSiblingChange");

_updateOptions(_options, "alwaysShowHitArea", alwaysShowHitArea);
_updateOptions(_options, "cache", cache);
_updateOptions(_options, "checkContainerEl", checkContainerEl);
_updateOptions(_options, "checkEl", checkEl);
_updateOptions(_options, "checkName", checkName);
_updateOptions(_options, "checked", checked);
_updateOptions(_options, "children", children);
_updateOptions(_options, "container", container);
_updateOptions(_options, "destroyed", destroyed);
_updateOptions(_options, "draggable", draggable);
_updateOptions(_options, "expanded", expanded);
_updateOptions(_options, "hitAreaEl", hitAreaEl);
_updateOptions(_options, "iconEl", iconEl);
_updateOptions(_options, "treenodetaskId", treenodetaskId);
_updateOptions(_options, "index", index);
_updateOptions(_options, "initialized", initialized);
_updateOptions(_options, "io", io);
_updateOptions(_options, "label", label);
_updateOptions(_options, "labelEl", labelEl);
_updateOptions(_options, "leaf", leaf);
_updateOptions(_options, "loaded", loaded);
_updateOptions(_options, "loading", loading);
_updateOptions(_options, "nextSibling", nextSibling);
_updateOptions(_options, "ownerTree", ownerTree);
_updateOptions(_options, "parentNode", parentNode);
_updateOptions(_options, "prevSibling", prevSibling);
_updateOptions(_options, "afterAlwaysShowHitAreaChange", afterAlwaysShowHitAreaChange);
_updateOptions(_options, "afterCacheChange", afterCacheChange);
_updateOptions(_options, "afterCheckContainerElChange", afterCheckContainerElChange);
_updateOptions(_options, "afterCheckElChange", afterCheckElChange);
_updateOptions(_options, "afterCheckNameChange", afterCheckNameChange);
_updateOptions(_options, "afterCheckedChange", afterCheckedChange);
_updateOptions(_options, "afterChildrenChange", afterChildrenChange);
_updateOptions(_options, "afterContainerChange", afterContainerChange);
_updateOptions(_options, "afterDestroy", afterDestroy);
_updateOptions(_options, "afterDestroyedChange", afterDestroyedChange);
_updateOptions(_options, "afterDraggableChange", afterDraggableChange);
_updateOptions(_options, "afterExpandedChange", afterExpandedChange);
_updateOptions(_options, "afterHitAreaElChange", afterHitAreaElChange);
_updateOptions(_options, "afterIconElChange", afterIconElChange);
_updateOptions(_options, "afterIdChange", afterIdChange);
_updateOptions(_options, "afterIndexChange", afterIndexChange);
_updateOptions(_options, "afterInit", afterInit);
_updateOptions(_options, "afterInitializedChange", afterInitializedChange);
_updateOptions(_options, "afterIoChange", afterIoChange);
_updateOptions(_options, "afterLabelChange", afterLabelChange);
_updateOptions(_options, "afterLabelElChange", afterLabelElChange);
_updateOptions(_options, "afterLeafChange", afterLeafChange);
_updateOptions(_options, "afterLoadedChange", afterLoadedChange);
_updateOptions(_options, "afterLoadingChange", afterLoadingChange);
_updateOptions(_options, "afterNextSiblingChange", afterNextSiblingChange);
_updateOptions(_options, "afterOwnerTreeChange", afterOwnerTreeChange);
_updateOptions(_options, "afterParentNodeChange", afterParentNodeChange);
_updateOptions(_options, "afterPrevSiblingChange", afterPrevSiblingChange);
_updateOptions(_options, "onAlwaysShowHitAreaChange", onAlwaysShowHitAreaChange);
_updateOptions(_options, "onCacheChange", onCacheChange);
_updateOptions(_options, "onCheckContainerElChange", onCheckContainerElChange);
_updateOptions(_options, "onCheckElChange", onCheckElChange);
_updateOptions(_options, "onCheckNameChange", onCheckNameChange);
_updateOptions(_options, "onCheckedChange", onCheckedChange);
_updateOptions(_options, "onChildrenChange", onChildrenChange);
_updateOptions(_options, "onContainerChange", onContainerChange);
_updateOptions(_options, "onDestroy", onDestroy);
_updateOptions(_options, "onDestroyedChange", onDestroyedChange);
_updateOptions(_options, "onDraggableChange", onDraggableChange);
_updateOptions(_options, "onExpandedChange", onExpandedChange);
_updateOptions(_options, "onHitAreaElChange", onHitAreaElChange);
_updateOptions(_options, "onIconElChange", onIconElChange);
_updateOptions(_options, "onIdChange", onIdChange);
_updateOptions(_options, "onIndexChange", onIndexChange);
_updateOptions(_options, "onInit", onInit);
_updateOptions(_options, "onInitializedChange", onInitializedChange);
_updateOptions(_options, "onIoChange", onIoChange);
_updateOptions(_options, "onLabelChange", onLabelChange);
_updateOptions(_options, "onLabelElChange", onLabelElChange);
_updateOptions(_options, "onLeafChange", onLeafChange);
_updateOptions(_options, "onLoadedChange", onLoadedChange);
_updateOptions(_options, "onLoadingChange", onLoadingChange);
_updateOptions(_options, "onNextSiblingChange", onNextSiblingChange);
_updateOptions(_options, "onOwnerTreeChange", onOwnerTreeChange);
_updateOptions(_options, "onParentNodeChange", onParentNodeChange);
_updateOptions(_options, "onPrevSiblingChange", onPrevSiblingChange);
%>

<%@ include file="/html/taglib/alloy/tree_node_task/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "alloy:tree-node-task:";
%>