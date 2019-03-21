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

package com.liferay.alloy.taglib.liferay.base;

import javax.servlet.jsp.JspException;

/**
 * @author Eduardo Lundgren
 * @author Bruno Basto
 * @author Nathan Cavanaugh
 * @generated
 */
public class BaseNoJSPTag extends com.liferay.portal.kernel.servlet.taglib.TagSupport {

	@Override
	public int doStartTag() throws JspException {
		return super.doStartTag();
	}

	public java.lang.String getTest() {
		return _test;
	}

	public void setTest(java.lang.String test) {
		_test = test;
	}

	protected void cleanUp() {
		_test = null;
	}

	protected String getEndPage() {
		return _END_PAGE;
	}

	protected String getStartPage() {
		return _START_PAGE;
	}

	private static final String _END_PAGE =
		"/html/taglib/liferay/no_jsp/end.jsp";

	private static final String _START_PAGE =
		"/html/taglib/liferay/no_jsp/start.jsp";

	private java.lang.String _test = null;

}