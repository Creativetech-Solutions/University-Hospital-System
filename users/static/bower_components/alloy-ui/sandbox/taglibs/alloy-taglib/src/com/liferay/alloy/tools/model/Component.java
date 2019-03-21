package com.liferay.alloy.tools.model;

import com.liferay.portal.kernel.util.PortalClassLoaderUtil;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.TextFormatter;
import com.liferay.portal.kernel.util.Validator;

import java.util.ArrayList;
import java.util.List;

public class Component extends BaseModel {

	public String getAttributeNamespace() {
		StringBuilder sb = new StringBuilder();

		sb.append(_package);
		sb.append(StringPool.COLON);
		sb.append(getUncamelizedName());
		sb.append(StringPool.COLON);

		return sb.toString().toLowerCase();
	}

	public List<Attribute> getAttributes() {
		return _attributes;
	}

	public List<Attribute> getAttributesAndEvents() {
		ArrayList<Attribute> attributes = new ArrayList<Attribute>();

		attributes.addAll(_attributes);
		attributes.addAll(_events);

		return attributes;
	}

	public String[] getAuthors() {
		return _authors;
	}

	public String getCamelizedName() {
		return TextFormatter.format(getName(), TextFormatter.M);
	}

	public String getClassName() {
		String className = _className;

		if (Validator.isNull(className)) {
			className = getSafeName().concat(_CLASS_NAME_SUFFIX);
		}

		return className;
	}

	public List<Attribute> getEvents() {
		return _events;
	}

	public String getModule() {
		return _module;
	}

	public String getPackage() {
		return _package;
	}

	public String getParentClass() {
		return _parentClass;
	}

	public String getSafeName() {
		return StringUtil.replace(
			getName(), StringPool.PERIOD, StringPool.BLANK);
	}

	public String getUncamelizedName() {
		String name = getName().replaceAll("\\.", StringPool.DASH);

		return TextFormatter.format(name, TextFormatter.P);
	}

	public String getUncamelizedName(String delimiter) {
		return getUncamelizedName().replaceAll("\\-", delimiter);
	}

	public boolean getWriteJSP() {
		return _writeJSP;
	}

	public boolean isAlloyComponent() {
		return _alloyComponent;
	}

	public boolean isBodyContent() {
		return _bodyContent;
	}

	public boolean isChildClassOf(String className) {
		try {
			String parentClassName = getParentClass();

			if (Validator.isNotNull(parentClassName)) {
				Thread currentThread = Thread.currentThread();

				ClassLoader contextClassLoader =
					currentThread.getContextClassLoader();

				PortalClassLoaderUtil.setClassLoader(contextClassLoader);

				Class<?> parentClass = Class.forName(parentClassName);

				Class<?> clazz = Class.forName(className);

				return clazz.isAssignableFrom(parentClass);
			}
		}
		catch (Exception e) {
		}

		return false;
	}

	public boolean isDynamicAttributes() {
		return _dynamicAttributes;
	}

	public void setAlloyComponent(boolean alloyComponent) {
		_alloyComponent = alloyComponent;
	}

	public void setAttributes(List<Attribute> attributes) {
		_attributes = attributes;

		for (Attribute attribute : attributes) {
			attribute.setComponent(this);
		}
	}

	public void setAuthors(String[] authors) {
		_authors = authors;
	}

	public void setBodyContent(boolean bodyContent) {
		_bodyContent = bodyContent;
	}

	public void setClassName(String className) {
		_className = className;
	}

	public void setDynamicAttributes(boolean dynamicAttributes) {
		_dynamicAttributes = dynamicAttributes;
	}

	public void setEvents(List<Attribute> events) {
		_events = events;

		for (Attribute event : events) {
			event.setComponent(this);
		}
	}

	public void setModule(String type) {
		_module = type;
	}

	public void setPackage(String componentPackage) {
		_package = componentPackage;
	}

	public void setParentClass(String parentClass) {
		_parentClass = parentClass;
	}

	public void setWriteJSP(boolean writeJSP) {
		_writeJSP = writeJSP;
	}

	private final static String _CLASS_NAME_SUFFIX = "Tag";

	private boolean _alloyComponent;
	private List<Attribute> _attributes;
	private String[] _authors;
	private boolean _bodyContent;
	private String _className;
	private boolean _dynamicAttributes;
	private List<Attribute> _events;
	private String _module;
	private String _package;
	private String _parentClass;
	private boolean _writeJSP;

}