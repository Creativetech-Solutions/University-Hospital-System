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

package com.liferay.alloy.taglib.alloy_util.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

/**
 * @author Eduardo Lundgren
 * @author Bruno Basto
 * @author Nathan Cavanaugh
 * @generated
 */
public class BaseComponentTag extends com.liferay.taglib.util.IncludeTag {

	@Override
	public int doStartTag() throws JspException {
		setAttributeNamespace(_ATTRIBUTE_NAMESPACE);

		return super.doStartTag();
	}

	public boolean getDefineVar() {
		return _defineVar;
	}

	public java.lang.String getExcludeAttributes() {
		return _excludeAttributes;
	}

	public java.lang.String getJavaScriptAttributes() {
		return _javaScriptAttributes;
	}

	public java.lang.Object getTagPageContext() {
		return _tagPageContext;
	}

	public java.lang.String getVar() {
		return _var;
	}

	public java.lang.String getModule() {
		return _module;
	}

	public java.lang.String getName() {
		return _name;
	}

	public java.util.Map getOptions() {
		return _options;
	}

	public void setDefineVar(boolean defineVar) {
		_defineVar = defineVar;

		setScopedAttribute("defineVar", defineVar);
	}

	public void setExcludeAttributes(java.lang.String excludeAttributes) {
		_excludeAttributes = excludeAttributes;

		setScopedAttribute("excludeAttributes", excludeAttributes);
	}

	public void setJavaScriptAttributes(java.lang.String javaScriptAttributes) {
		_javaScriptAttributes = javaScriptAttributes;

		setScopedAttribute("javaScriptAttributes", javaScriptAttributes);
	}

	public void setTagPageContext(java.lang.Object tagPageContext) {
		_tagPageContext = tagPageContext;

		setScopedAttribute("tagPageContext", tagPageContext);
	}

	public void setVar(java.lang.String var) {
		_var = var;

		setScopedAttribute("var", var);
	}

	public void setModule(java.lang.String module) {
		_module = module;

		setScopedAttribute("module", module);
	}

	public void setName(java.lang.String name) {
		_name = name;

		setScopedAttribute("name", name);
	}

	public void setOptions(java.util.Map options) {
		_options = options;

		setScopedAttribute("options", options);
	}

	@Override
	protected void cleanUp() {
		_defineVar = true;
		_excludeAttributes = null;
		_javaScriptAttributes = null;
		_tagPageContext = null;
		_var = null;
		_module = null;
		_name = null;
		_options = null;
	}

	@Override
	protected String getPage() {
		return _PAGE;
	}

	@Override
	protected void setAttributes(HttpServletRequest request) {
		setNamespacedAttribute(request, "defineVar", _defineVar);
		setNamespacedAttribute(request, "excludeAttributes", _excludeAttributes);
		setNamespacedAttribute(request, "javaScriptAttributes", _javaScriptAttributes);
		setNamespacedAttribute(request, "tagPageContext", _tagPageContext);
		setNamespacedAttribute(request, "var", _var);
		setNamespacedAttribute(request, "module", _module);
		setNamespacedAttribute(request, "name", _name);
		setNamespacedAttribute(request, "options", _options);
	}

	protected static final String _ATTRIBUTE_NAMESPACE = "alloy_util:component:";

	private static final String _PAGE =
		"/html/taglib/alloy_util/component/page.jsp";

	private boolean _defineVar = true;
	private java.lang.String _excludeAttributes = null;
	private java.lang.String _javaScriptAttributes = null;
	private java.lang.Object _tagPageContext = null;
	private java.lang.String _var = null;
	private java.lang.String _module = null;
	private java.lang.String _name = null;
	private java.util.Map _options = null;

}