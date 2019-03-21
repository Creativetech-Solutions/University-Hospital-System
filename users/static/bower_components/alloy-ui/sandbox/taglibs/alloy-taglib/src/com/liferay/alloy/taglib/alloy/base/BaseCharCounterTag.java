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

package com.liferay.alloy.taglib.alloy.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;

/**
 * @author Eduardo Lundgren
 * @author Bruno Basto
 * @author Nathan Cavanaugh
 * @generated
 */
public class BaseCharCounterTag extends com.liferay.taglib.util.IncludeTag {

	@Override
	public int doStartTag() throws JspException {
		setAttributeNamespace(_ATTRIBUTE_NAMESPACE);

		return super.doStartTag();
	}

	public java.lang.Object getCounter() {
		return _counter;
	}

	public boolean getDestroyed() {
		return _destroyed;
	}

	public boolean getInitialized() {
		return _initialized;
	}

	public java.lang.Object getInput() {
		return _input;
	}

	public java.lang.Object getMaxLength() {
		return _maxLength;
	}

	public java.lang.Object getAfterCounterChange() {
		return _afterCounterChange;
	}

	public java.lang.Object getAfterDestroy() {
		return _afterDestroy;
	}

	public java.lang.Object getAfterDestroyedChange() {
		return _afterDestroyedChange;
	}

	public java.lang.Object getAfterInit() {
		return _afterInit;
	}

	public java.lang.Object getAfterInitializedChange() {
		return _afterInitializedChange;
	}

	public java.lang.Object getAfterInputChange() {
		return _afterInputChange;
	}

	public java.lang.Object getAfterMaxLengthChange() {
		return _afterMaxLengthChange;
	}

	public java.lang.Object getOnCounterChange() {
		return _onCounterChange;
	}

	public java.lang.Object getOnDestroy() {
		return _onDestroy;
	}

	public java.lang.Object getOnDestroyedChange() {
		return _onDestroyedChange;
	}

	public java.lang.Object getOnInit() {
		return _onInit;
	}

	public java.lang.Object getOnInitializedChange() {
		return _onInitializedChange;
	}

	public java.lang.Object getOnInputChange() {
		return _onInputChange;
	}

	public java.lang.Object getOnMaxLengthChange() {
		return _onMaxLengthChange;
	}

	public void setCounter(java.lang.Object counter) {
		_counter = counter;

		setScopedAttribute("counter", counter);
	}

	public void setDestroyed(boolean destroyed) {
		_destroyed = destroyed;

		setScopedAttribute("destroyed", destroyed);
	}

	public void setInitialized(boolean initialized) {
		_initialized = initialized;

		setScopedAttribute("initialized", initialized);
	}

	public void setInput(java.lang.Object input) {
		_input = input;

		setScopedAttribute("input", input);
	}

	public void setMaxLength(java.lang.Object maxLength) {
		_maxLength = maxLength;

		setScopedAttribute("maxLength", maxLength);
	}

	public void setAfterCounterChange(java.lang.Object afterCounterChange) {
		_afterCounterChange = afterCounterChange;

		setScopedAttribute("afterCounterChange", afterCounterChange);
	}

	public void setAfterDestroy(java.lang.Object afterDestroy) {
		_afterDestroy = afterDestroy;

		setScopedAttribute("afterDestroy", afterDestroy);
	}

	public void setAfterDestroyedChange(java.lang.Object afterDestroyedChange) {
		_afterDestroyedChange = afterDestroyedChange;

		setScopedAttribute("afterDestroyedChange", afterDestroyedChange);
	}

	public void setAfterInit(java.lang.Object afterInit) {
		_afterInit = afterInit;

		setScopedAttribute("afterInit", afterInit);
	}

	public void setAfterInitializedChange(java.lang.Object afterInitializedChange) {
		_afterInitializedChange = afterInitializedChange;

		setScopedAttribute("afterInitializedChange", afterInitializedChange);
	}

	public void setAfterInputChange(java.lang.Object afterInputChange) {
		_afterInputChange = afterInputChange;

		setScopedAttribute("afterInputChange", afterInputChange);
	}

	public void setAfterMaxLengthChange(java.lang.Object afterMaxLengthChange) {
		_afterMaxLengthChange = afterMaxLengthChange;

		setScopedAttribute("afterMaxLengthChange", afterMaxLengthChange);
	}

	public void setOnCounterChange(java.lang.Object onCounterChange) {
		_onCounterChange = onCounterChange;

		setScopedAttribute("onCounterChange", onCounterChange);
	}

	public void setOnDestroy(java.lang.Object onDestroy) {
		_onDestroy = onDestroy;

		setScopedAttribute("onDestroy", onDestroy);
	}

	public void setOnDestroyedChange(java.lang.Object onDestroyedChange) {
		_onDestroyedChange = onDestroyedChange;

		setScopedAttribute("onDestroyedChange", onDestroyedChange);
	}

	public void setOnInit(java.lang.Object onInit) {
		_onInit = onInit;

		setScopedAttribute("onInit", onInit);
	}

	public void setOnInitializedChange(java.lang.Object onInitializedChange) {
		_onInitializedChange = onInitializedChange;

		setScopedAttribute("onInitializedChange", onInitializedChange);
	}

	public void setOnInputChange(java.lang.Object onInputChange) {
		_onInputChange = onInputChange;

		setScopedAttribute("onInputChange", onInputChange);
	}

	public void setOnMaxLengthChange(java.lang.Object onMaxLengthChange) {
		_onMaxLengthChange = onMaxLengthChange;

		setScopedAttribute("onMaxLengthChange", onMaxLengthChange);
	}

	@Override
	protected void cleanUp() {
		_counter = null;
		_destroyed = false;
		_initialized = false;
		_input = null;
		_maxLength = 2147483647;
		_afterCounterChange = null;
		_afterDestroy = null;
		_afterDestroyedChange = null;
		_afterInit = null;
		_afterInitializedChange = null;
		_afterInputChange = null;
		_afterMaxLengthChange = null;
		_onCounterChange = null;
		_onDestroy = null;
		_onDestroyedChange = null;
		_onInit = null;
		_onInitializedChange = null;
		_onInputChange = null;
		_onMaxLengthChange = null;
	}

	@Override
	protected String getPage() {
		return _PAGE;
	}

	@Override
	protected void setAttributes(HttpServletRequest request) {
		setNamespacedAttribute(request, "counter", _counter);
		setNamespacedAttribute(request, "destroyed", _destroyed);
		setNamespacedAttribute(request, "initialized", _initialized);
		setNamespacedAttribute(request, "input", _input);
		setNamespacedAttribute(request, "maxLength", _maxLength);
		setNamespacedAttribute(request, "afterCounterChange", _afterCounterChange);
		setNamespacedAttribute(request, "afterDestroy", _afterDestroy);
		setNamespacedAttribute(request, "afterDestroyedChange", _afterDestroyedChange);
		setNamespacedAttribute(request, "afterInit", _afterInit);
		setNamespacedAttribute(request, "afterInitializedChange", _afterInitializedChange);
		setNamespacedAttribute(request, "afterInputChange", _afterInputChange);
		setNamespacedAttribute(request, "afterMaxLengthChange", _afterMaxLengthChange);
		setNamespacedAttribute(request, "onCounterChange", _onCounterChange);
		setNamespacedAttribute(request, "onDestroy", _onDestroy);
		setNamespacedAttribute(request, "onDestroyedChange", _onDestroyedChange);
		setNamespacedAttribute(request, "onInit", _onInit);
		setNamespacedAttribute(request, "onInitializedChange", _onInitializedChange);
		setNamespacedAttribute(request, "onInputChange", _onInputChange);
		setNamespacedAttribute(request, "onMaxLengthChange", _onMaxLengthChange);
	}

	protected static final String _ATTRIBUTE_NAMESPACE = "alloy:char-counter:";

	private static final String _PAGE =
		"/html/taglib/alloy/char_counter/page.jsp";

	private java.lang.Object _counter = null;
	private boolean _destroyed = false;
	private boolean _initialized = false;
	private java.lang.Object _input = null;
	private java.lang.Object _maxLength = 2147483647;
	private java.lang.Object _afterCounterChange = null;
	private java.lang.Object _afterDestroy = null;
	private java.lang.Object _afterDestroyedChange = null;
	private java.lang.Object _afterInit = null;
	private java.lang.Object _afterInitializedChange = null;
	private java.lang.Object _afterInputChange = null;
	private java.lang.Object _afterMaxLengthChange = null;
	private java.lang.Object _onCounterChange = null;
	private java.lang.Object _onDestroy = null;
	private java.lang.Object _onDestroyedChange = null;
	private java.lang.Object _onInit = null;
	private java.lang.Object _onInitializedChange = null;
	private java.lang.Object _onInputChange = null;
	private java.lang.Object _onMaxLengthChange = null;

}