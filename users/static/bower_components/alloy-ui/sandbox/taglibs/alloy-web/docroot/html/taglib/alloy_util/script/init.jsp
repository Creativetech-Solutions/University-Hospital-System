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
Map<String, Object> dynamicAttributes = (Map<String, Object>)request.getAttribute("alloy_util:script:dynamicAttributes");
Map<String, Object> scopedAttributes = (Map<String, Object>)request.getAttribute("alloy_util:script:scopedAttributes");

Map<String, Object> _options = new HashMap<String, Object>();

if ((scopedAttributes != null) && !scopedAttributes.isEmpty()) {
	_options.putAll(scopedAttributes);
}

if ((dynamicAttributes != null) && !dynamicAttributes.isEmpty()) {
	_options.putAll(dynamicAttributes);
}

java.lang.String position = GetterUtil.getString((java.lang.String)request.getAttribute("alloy_util:script:position"));
java.lang.Boolean printBuffer = GetterUtil.getBoolean((java.lang.Boolean)request.getAttribute("alloy_util:script:printBuffer"));
java.lang.String use = GetterUtil.getString((java.lang.String)request.getAttribute("alloy_util:script:use"));

_updateOptions(_options, "position", position);
_updateOptions(_options, "printBuffer", printBuffer);
_updateOptions(_options, "use", use);
%>

<%@ include file="/html/taglib/alloy_util/script/init-ext.jspf" %>

<%!
private static final String _NAMESPACE = "alloy_util:script:";
%>