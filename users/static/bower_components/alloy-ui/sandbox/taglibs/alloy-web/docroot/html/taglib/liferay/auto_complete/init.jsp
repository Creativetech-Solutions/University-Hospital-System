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
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("liferay:auto-complete:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("liferay:auto-complete:scopedAttributes");

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
java.lang.String alwaysShowContainer = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:alwaysShowContainer"));
java.lang.String test = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:test"));
boolean applyLocalFilter = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:applyLocalFilter")), true);
boolean autoHighlight = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:autoHighlight")), true);
boolean button = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:button")), true);
java.lang.String cssClass = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:cssClass"));
java.lang.Object dataSource = (java.lang.Object)request.getAttribute("liferay:auto-complete:dataSource");
java.lang.String dataSourceType = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:dataSourceType"));
java.lang.String delimChar = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:delimChar"));
boolean destroyed = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:destroyed")), false);
boolean disabled = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:disabled")), false);
boolean focused = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:focused")), false);
boolean forceSelection = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:forceSelection")), false);
java.lang.Object height = (java.lang.Object)request.getAttribute("liferay:auto-complete:height");
java.lang.String hideClass = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:hideClass"), "aui-helper-hidden");
java.lang.String autocompleteId = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:autocompleteId"));
boolean initialized = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:initialized")), false);
java.lang.String input = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:input"));
java.lang.Object matchKey = (java.lang.Object)request.getAttribute("liferay:auto-complete:matchKey");
java.lang.Number maxResultsDisplayed = GetterUtil.getNumber(String.valueOf(request.getAttribute("liferay:auto-complete:maxResultsDisplayed")), 10);
java.lang.Number minQueryLength = GetterUtil.getNumber(String.valueOf(request.getAttribute("liferay:auto-complete:minQueryLength")), 1);
java.lang.Number queryDelay = GetterUtil.getNumber(String.valueOf(request.getAttribute("liferay:auto-complete:queryDelay")), 0.2);
java.lang.Number queryInterval = GetterUtil.getNumber(String.valueOf(request.getAttribute("liferay:auto-complete:queryInterval")), 0.5);
boolean queryMatchCase = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:queryMatchCase")), false);
boolean queryMatchContains = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:queryMatchContains")), false);
boolean queryQuestionMark = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:queryQuestionMark")), true);
java.lang.Object render = (java.lang.Object)request.getAttribute("liferay:auto-complete:render");
boolean rendered = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:rendered")), false);
java.util.HashMap schema = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("liferay:auto-complete:schema")));
java.lang.String schemaType = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:schemaType"), "array");
java.util.HashMap strings = _toHashMap(GetterUtil.getObject((java.lang.Object)request.getAttribute("liferay:auto-complete:strings")));
boolean suppressInputUpdate = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:suppressInputUpdate")), false);
java.lang.Number tabIndex = GetterUtil.getNumber(String.valueOf(request.getAttribute("liferay:auto-complete:tabIndex")), 0);
boolean typeAhead = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:typeAhead")), false);
java.lang.Number typeAheadDelay = GetterUtil.getNumber(String.valueOf(request.getAttribute("liferay:auto-complete:typeAheadDelay")), 0.2);
java.lang.String uniqueName = GetterUtil.getString((java.lang.String)request.getAttribute("liferay:auto-complete:uniqueName"));
boolean useARIA = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:useARIA")), true);
boolean visible = GetterUtil.getBoolean(String.valueOf(request.getAttribute("liferay:auto-complete:visible")), true);
java.lang.Object width = (java.lang.Object)request.getAttribute("liferay:auto-complete:width");
java.lang.Object afterAlwaysShowContainerChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterAlwaysShowContainerChange");
java.lang.Object afterApplyLocalFilterChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterApplyLocalFilterChange");
java.lang.Object afterAutoHighlightChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterAutoHighlightChange");
java.lang.Object afterBoundingBoxChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterBoundingBoxChange");
java.lang.Object afterButtonChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterButtonChange");
java.lang.Object afterContainerCollapse = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterContainerCollapse");
java.lang.Object afterContainerExpand = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterContainerExpand");
java.lang.Object afterContainerPopulate = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterContainerPopulate");
java.lang.Object afterContentBoxChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterContentBoxChange");
java.lang.Object afterCssClassChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterCssClassChange");
java.lang.Object afterDataError = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDataError");
java.lang.Object afterDataRequest = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDataRequest");
java.lang.Object afterDataReturn = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDataReturn");
java.lang.Object afterDataSourceChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDataSourceChange");
java.lang.Object afterDataSourceTypeChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDataSourceTypeChange");
java.lang.Object afterDelimCharChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDelimCharChange");
java.lang.Object afterDestroy = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDestroy");
java.lang.Object afterDestroyedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDestroyedChange");
java.lang.Object afterDisabledChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterDisabledChange");
java.lang.Object afterFocusedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterFocusedChange");
java.lang.Object afterForceSelectionChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterForceSelectionChange");
java.lang.Object afterHeightChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterHeightChange");
java.lang.Object afterHideClassChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterHideClassChange");
java.lang.Object afterIdChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterIdChange");
java.lang.Object afterInit = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterInit");
java.lang.Object afterInitializedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterInitializedChange");
java.lang.Object afterInputChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterInputChange");
java.lang.Object afterItemArrowFrom = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterItemArrowFrom");
java.lang.Object afterItemArrowTo = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterItemArrowTo");
java.lang.Object afterItemMouseOut = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterItemMouseOut");
java.lang.Object afterItemMouseOver = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterItemMouseOver");
java.lang.Object afterItemSelect = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterItemSelect");
java.lang.Object afterMatchKeyChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterMatchKeyChange");
java.lang.Object afterMaxResultsDisplayedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterMaxResultsDisplayedChange");
java.lang.Object afterMinQueryLengthChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterMinQueryLengthChange");
java.lang.Object afterQueryDelayChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterQueryDelayChange");
java.lang.Object afterQueryIntervalChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterQueryIntervalChange");
java.lang.Object afterQueryMatchCaseChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterQueryMatchCaseChange");
java.lang.Object afterQueryMatchContainsChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterQueryMatchContainsChange");
java.lang.Object afterQueryQuestionMarkChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterQueryQuestionMarkChange");
java.lang.Object afterRenderChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterRenderChange");
java.lang.Object afterRenderedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterRenderedChange");
java.lang.Object afterSchemaChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterSchemaChange");
java.lang.Object afterSchemaTypeChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterSchemaTypeChange");
java.lang.Object afterSelectionEnforce = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterSelectionEnforce");
java.lang.Object afterSrcNodeChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterSrcNodeChange");
java.lang.Object afterStringsChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterStringsChange");
java.lang.Object afterSuppressInputUpdateChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterSuppressInputUpdateChange");
java.lang.Object afterTabIndexChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTabIndexChange");
java.lang.Object afterTextboxBlur = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTextboxBlur");
java.lang.Object afterTextboxChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTextboxChange");
java.lang.Object afterTextboxFocus = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTextboxFocus");
java.lang.Object afterTextboxKey = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTextboxKey");
java.lang.Object afterTypeAhead = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTypeAhead");
java.lang.Object afterTypeAheadChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTypeAheadChange");
java.lang.Object afterTypeAheadDelayChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterTypeAheadDelayChange");
java.lang.Object afterUniqueNameChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterUniqueNameChange");
java.lang.Object afterUnmatchedItemSelect = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterUnmatchedItemSelect");
java.lang.Object afterUseARIAChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterUseARIAChange");
java.lang.Object afterVisibleChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterVisibleChange");
java.lang.Object afterContentUpdate = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterContentUpdate");
java.lang.Object afterRender = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterRender");
java.lang.Object afterWidthChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:afterWidthChange");
java.lang.Object onAlwaysShowContainerChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onAlwaysShowContainerChange");
java.lang.Object onApplyLocalFilterChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onApplyLocalFilterChange");
java.lang.Object onAutoHighlightChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onAutoHighlightChange");
java.lang.Object onBoundingBoxChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onBoundingBoxChange");
java.lang.Object onButtonChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onButtonChange");
java.lang.Object onContainerCollapse = (java.lang.Object)request.getAttribute("liferay:auto-complete:onContainerCollapse");
java.lang.Object onContainerExpand = (java.lang.Object)request.getAttribute("liferay:auto-complete:onContainerExpand");
java.lang.Object onContainerPopulate = (java.lang.Object)request.getAttribute("liferay:auto-complete:onContainerPopulate");
java.lang.Object onContentBoxChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onContentBoxChange");
java.lang.Object onCssClassChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onCssClassChange");
java.lang.Object onDataError = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDataError");
java.lang.Object onDataRequest = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDataRequest");
java.lang.Object onDataReturn = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDataReturn");
java.lang.Object onDataSourceChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDataSourceChange");
java.lang.Object onDataSourceTypeChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDataSourceTypeChange");
java.lang.Object onDelimCharChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDelimCharChange");
java.lang.Object onDestroy = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDestroy");
java.lang.Object onDestroyedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDestroyedChange");
java.lang.Object onDisabledChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onDisabledChange");
java.lang.Object onFocusedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onFocusedChange");
java.lang.Object onForceSelectionChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onForceSelectionChange");
java.lang.Object onHeightChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onHeightChange");
java.lang.Object onHideClassChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onHideClassChange");
java.lang.Object onIdChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onIdChange");
java.lang.Object onInit = (java.lang.Object)request.getAttribute("liferay:auto-complete:onInit");
java.lang.Object onInitializedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onInitializedChange");
java.lang.Object onInputChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onInputChange");
java.lang.Object onItemArrowFrom = (java.lang.Object)request.getAttribute("liferay:auto-complete:onItemArrowFrom");
java.lang.Object onItemArrowTo = (java.lang.Object)request.getAttribute("liferay:auto-complete:onItemArrowTo");
java.lang.Object onItemMouseOut = (java.lang.Object)request.getAttribute("liferay:auto-complete:onItemMouseOut");
java.lang.Object onItemMouseOver = (java.lang.Object)request.getAttribute("liferay:auto-complete:onItemMouseOver");
java.lang.Object onItemSelect = (java.lang.Object)request.getAttribute("liferay:auto-complete:onItemSelect");
java.lang.Object onMatchKeyChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onMatchKeyChange");
java.lang.Object onMaxResultsDisplayedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onMaxResultsDisplayedChange");
java.lang.Object onMinQueryLengthChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onMinQueryLengthChange");
java.lang.Object onQueryDelayChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onQueryDelayChange");
java.lang.Object onQueryIntervalChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onQueryIntervalChange");
java.lang.Object onQueryMatchCaseChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onQueryMatchCaseChange");
java.lang.Object onQueryMatchContainsChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onQueryMatchContainsChange");
java.lang.Object onQueryQuestionMarkChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onQueryQuestionMarkChange");
java.lang.Object onRenderChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onRenderChange");
java.lang.Object onRenderedChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onRenderedChange");
java.lang.Object onSchemaChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onSchemaChange");
java.lang.Object onSchemaTypeChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onSchemaTypeChange");
java.lang.Object onSelectionEnforce = (java.lang.Object)request.getAttribute("liferay:auto-complete:onSelectionEnforce");
java.lang.Object onSrcNodeChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onSrcNodeChange");
java.lang.Object onStringsChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onStringsChange");
java.lang.Object onSuppressInputUpdateChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onSuppressInputUpdateChange");
java.lang.Object onTabIndexChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTabIndexChange");
java.lang.Object onTextboxBlur = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTextboxBlur");
java.lang.Object onTextboxChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTextboxChange");
java.lang.Object onTextboxFocus = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTextboxFocus");
java.lang.Object onTextboxKey = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTextboxKey");
java.lang.Object onTypeAhead = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTypeAhead");
java.lang.Object onTypeAheadChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTypeAheadChange");
java.lang.Object onTypeAheadDelayChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onTypeAheadDelayChange");
java.lang.Object onUniqueNameChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onUniqueNameChange");
java.lang.Object onUnmatchedItemSelect = (java.lang.Object)request.getAttribute("liferay:auto-complete:onUnmatchedItemSelect");
java.lang.Object onUseARIAChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onUseARIAChange");
java.lang.Object onVisibleChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onVisibleChange");
java.lang.Object onContentUpdate = (java.lang.Object)request.getAttribute("liferay:auto-complete:onContentUpdate");
java.lang.Object onRender = (java.lang.Object)request.getAttribute("liferay:auto-complete:onRender");
java.lang.Object onWidthChange = (java.lang.Object)request.getAttribute("liferay:auto-complete:onWidthChange");

_updateOptions(_options, "alwaysShowContainer", alwaysShowContainer);
_updateOptions(_options, "test", test);
_updateOptions(_options, "applyLocalFilter", applyLocalFilter);
_updateOptions(_options, "autoHighlight", autoHighlight);
_updateOptions(_options, "boundingBox", boundingBox);
_updateOptions(_options, "button", button);
_updateOptions(_options, "contentBox", contentBox);
_updateOptions(_options, "cssClass", cssClass);
_updateOptions(_options, "dataSource", dataSource);
_updateOptions(_options, "dataSourceType", dataSourceType);
_updateOptions(_options, "delimChar", delimChar);
_updateOptions(_options, "destroyed", destroyed);
_updateOptions(_options, "disabled", disabled);
_updateOptions(_options, "focused", focused);
_updateOptions(_options, "forceSelection", forceSelection);
_updateOptions(_options, "height", height);
_updateOptions(_options, "hideClass", hideClass);
_updateOptions(_options, "autocompleteId", autocompleteId);
_updateOptions(_options, "initialized", initialized);
_updateOptions(_options, "input", input);
_updateOptions(_options, "matchKey", matchKey);
_updateOptions(_options, "maxResultsDisplayed", maxResultsDisplayed);
_updateOptions(_options, "minQueryLength", minQueryLength);
_updateOptions(_options, "queryDelay", queryDelay);
_updateOptions(_options, "queryInterval", queryInterval);
_updateOptions(_options, "queryMatchCase", queryMatchCase);
_updateOptions(_options, "queryMatchContains", queryMatchContains);
_updateOptions(_options, "queryQuestionMark", queryQuestionMark);
_updateOptions(_options, "render", render);
_updateOptions(_options, "rendered", rendered);
_updateOptions(_options, "schema", schema);
_updateOptions(_options, "schemaType", schemaType);
_updateOptions(_options, "srcNode", srcNode);
_updateOptions(_options, "strings", strings);
_updateOptions(_options, "suppressInputUpdate", suppressInputUpdate);
_updateOptions(_options, "tabIndex", tabIndex);
_updateOptions(_options, "typeAhead", typeAhead);
_updateOptions(_options, "typeAheadDelay", typeAheadDelay);
_updateOptions(_options, "uniqueName", uniqueName);
_updateOptions(_options, "useARIA", useARIA);
_updateOptions(_options, "visible", visible);
_updateOptions(_options, "width", width);
_updateOptions(_options, "afterAlwaysShowContainerChange", afterAlwaysShowContainerChange);
_updateOptions(_options, "afterApplyLocalFilterChange", afterApplyLocalFilterChange);
_updateOptions(_options, "afterAutoHighlightChange", afterAutoHighlightChange);
_updateOptions(_options, "afterBoundingBoxChange", afterBoundingBoxChange);
_updateOptions(_options, "afterButtonChange", afterButtonChange);
_updateOptions(_options, "afterContainerCollapse", afterContainerCollapse);
_updateOptions(_options, "afterContainerExpand", afterContainerExpand);
_updateOptions(_options, "afterContainerPopulate", afterContainerPopulate);
_updateOptions(_options, "afterContentBoxChange", afterContentBoxChange);
_updateOptions(_options, "afterCssClassChange", afterCssClassChange);
_updateOptions(_options, "afterDataError", afterDataError);
_updateOptions(_options, "afterDataRequest", afterDataRequest);
_updateOptions(_options, "afterDataReturn", afterDataReturn);
_updateOptions(_options, "afterDataSourceChange", afterDataSourceChange);
_updateOptions(_options, "afterDataSourceTypeChange", afterDataSourceTypeChange);
_updateOptions(_options, "afterDelimCharChange", afterDelimCharChange);
_updateOptions(_options, "afterDestroy", afterDestroy);
_updateOptions(_options, "afterDestroyedChange", afterDestroyedChange);
_updateOptions(_options, "afterDisabledChange", afterDisabledChange);
_updateOptions(_options, "afterFocusedChange", afterFocusedChange);
_updateOptions(_options, "afterForceSelectionChange", afterForceSelectionChange);
_updateOptions(_options, "afterHeightChange", afterHeightChange);
_updateOptions(_options, "afterHideClassChange", afterHideClassChange);
_updateOptions(_options, "afterIdChange", afterIdChange);
_updateOptions(_options, "afterInit", afterInit);
_updateOptions(_options, "afterInitializedChange", afterInitializedChange);
_updateOptions(_options, "afterInputChange", afterInputChange);
_updateOptions(_options, "afterItemArrowFrom", afterItemArrowFrom);
_updateOptions(_options, "afterItemArrowTo", afterItemArrowTo);
_updateOptions(_options, "afterItemMouseOut", afterItemMouseOut);
_updateOptions(_options, "afterItemMouseOver", afterItemMouseOver);
_updateOptions(_options, "afterItemSelect", afterItemSelect);
_updateOptions(_options, "afterMatchKeyChange", afterMatchKeyChange);
_updateOptions(_options, "afterMaxResultsDisplayedChange", afterMaxResultsDisplayedChange);
_updateOptions(_options, "afterMinQueryLengthChange", afterMinQueryLengthChange);
_updateOptions(_options, "afterQueryDelayChange", afterQueryDelayChange);
_updateOptions(_options, "afterQueryIntervalChange", afterQueryIntervalChange);
_updateOptions(_options, "afterQueryMatchCaseChange", afterQueryMatchCaseChange);
_updateOptions(_options, "afterQueryMatchContainsChange", afterQueryMatchContainsChange);
_updateOptions(_options, "afterQueryQuestionMarkChange", afterQueryQuestionMarkChange);
_updateOptions(_options, "afterRenderChange", afterRenderChange);
_updateOptions(_options, "afterRenderedChange", afterRenderedChange);
_updateOptions(_options, "afterSchemaChange", afterSchemaChange);
_updateOptions(_options, "afterSchemaTypeChange", afterSchemaTypeChange);
_updateOptions(_options, "afterSelectionEnforce", afterSelectionEnforce);
_updateOptions(_options, "afterSrcNodeChange", afterSrcNodeChange);
_updateOptions(_options, "afterStringsChange", afterStringsChange);
_updateOptions(_options, "afterSuppressInputUpdateChange", afterSuppressInputUpdateChange);
_updateOptions(_options, "afterTabIndexChange", afterTabIndexChange);
_updateOptions(_options, "afterTextboxBlur", afterTextboxBlur);
_updateOptions(_options, "afterTextboxChange", afterTextboxChange);
_updateOptions(_options, "afterTextboxFocus", afterTextboxFocus);
_updateOptions(_options, "afterTextboxKey", afterTextboxKey);
_updateOptions(_options, "afterTypeAhead", afterTypeAhead);
_updateOptions(_options, "afterTypeAheadChange", afterTypeAheadChange);
_updateOptions(_options, "afterTypeAheadDelayChange", afterTypeAheadDelayChange);
_updateOptions(_options, "afterUniqueNameChange", afterUniqueNameChange);
_updateOptions(_options, "afterUnmatchedItemSelect", afterUnmatchedItemSelect);
_updateOptions(_options, "afterUseARIAChange", afterUseARIAChange);
_updateOptions(_options, "afterVisibleChange", afterVisibleChange);
_updateOptions(_options, "afterContentUpdate", afterContentUpdate);
_updateOptions(_options, "afterRender", afterRender);
_updateOptions(_options, "afterWidthChange", afterWidthChange);
_updateOptions(_options, "onAlwaysShowContainerChange", onAlwaysShowContainerChange);
_updateOptions(_options, "onApplyLocalFilterChange", onApplyLocalFilterChange);
_updateOptions(_options, "onAutoHighlightChange", onAutoHighlightChange);
_updateOptions(_options, "onBoundingBoxChange", onBoundingBoxChange);
_updateOptions(_options, "onButtonChange", onButtonChange);
_updateOptions(_options, "onContainerCollapse", onContainerCollapse);
_updateOptions(_options, "onContainerExpand", onContainerExpand);
_updateOptions(_options, "onContainerPopulate", onContainerPopulate);
_updateOptions(_options, "onContentBoxChange", onContentBoxChange);
_updateOptions(_options, "onCssClassChange", onCssClassChange);
_updateOptions(_options, "onDataError", onDataError);
_updateOptions(_options, "onDataRequest", onDataRequest);
_updateOptions(_options, "onDataReturn", onDataReturn);
_updateOptions(_options, "onDataSourceChange", onDataSourceChange);
_updateOptions(_options, "onDataSourceTypeChange", onDataSourceTypeChange);
_updateOptions(_options, "onDelimCharChange", onDelimCharChange);
_updateOptions(_options, "onDestroy", onDestroy);
_updateOptions(_options, "onDestroyedChange", onDestroyedChange);
_updateOptions(_options, "onDisabledChange", onDisabledChange);
_updateOptions(_options, "onFocusedChange", onFocusedChange);
_updateOptions(_options, "onForceSelectionChange", onForceSelectionChange);
_updateOptions(_options, "onHeightChange", onHeightChange);
_updateOptions(_options, "onHideClassChange", onHideClassChange);
_updateOptions(_options, "onIdChange", onIdChange);
_updateOptions(_options, "onInit", onInit);
_updateOptions(_options, "onInitializedChange", onInitializedChange);
_updateOptions(_options, "onInputChange", onInputChange);
_updateOptions(_options, "onItemArrowFrom", onItemArrowFrom);
_updateOptions(_options, "onItemArrowTo", onItemArrowTo);
_updateOptions(_options, "onItemMouseOut", onItemMouseOut);
_updateOptions(_options, "onItemMouseOver", onItemMouseOver);
_updateOptions(_options, "onItemSelect", onItemSelect);
_updateOptions(_options, "onMatchKeyChange", onMatchKeyChange);
_updateOptions(_options, "onMaxResultsDisplayedChange", onMaxResultsDisplayedChange);
_updateOptions(_options, "onMinQueryLengthChange", onMinQueryLengthChange);
_updateOptions(_options, "onQueryDelayChange", onQueryDelayChange);
_updateOptions(_options, "onQueryIntervalChange", onQueryIntervalChange);
_updateOptions(_options, "onQueryMatchCaseChange", onQueryMatchCaseChange);
_updateOptions(_options, "onQueryMatchContainsChange", onQueryMatchContainsChange);
_updateOptions(_options, "onQueryQuestionMarkChange", onQueryQuestionMarkChange);
_updateOptions(_options, "onRenderChange", onRenderChange);
_updateOptions(_options, "onRenderedChange", onRenderedChange);
_updateOptions(_options, "onSchemaChange", onSchemaChange);
_updateOptions(_options, "onSchemaTypeChange", onSchemaTypeChange);
_updateOptions(_options, "onSelectionEnforce", onSelectionEnforce);
_updateOptions(_options, "onSrcNodeChange", onSrcNodeChange);
_updateOptions(_options, "onStringsChange", onStringsChange);
_updateOptions(_options, "onSuppressInputUpdateChange", onSuppressInputUpdateChange);
_updateOptions(_options, "onTabIndexChange", onTabIndexChange);
_updateOptions(_options, "onTextboxBlur", onTextboxBlur);
_updateOptions(_options, "onTextboxChange", onTextboxChange);
_updateOptions(_options, "onTextboxFocus", onTextboxFocus);
_updateOptions(_options, "onTextboxKey", onTextboxKey);
_updateOptions(_options, "onTypeAhead", onTypeAhead);
_updateOptions(_options, "onTypeAheadChange", onTypeAheadChange);
_updateOptions(_options, "onTypeAheadDelayChange", onTypeAheadDelayChange);
_updateOptions(_options, "onUniqueNameChange", onUniqueNameChange);
_updateOptions(_options, "onUnmatchedItemSelect", onUnmatchedItemSelect);
_updateOptions(_options, "onUseARIAChange", onUseARIAChange);
_updateOptions(_options, "onVisibleChange", onVisibleChange);
_updateOptions(_options, "onContentUpdate", onContentUpdate);
_updateOptions(_options, "onRender", onRender);
_updateOptions(_options, "onWidthChange", onWidthChange);
%>

<%@ include file="/html/taglib/liferay/auto_complete/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "liferay:auto-complete:";
%>