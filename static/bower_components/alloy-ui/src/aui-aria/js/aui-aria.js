var Lang = A.Lang,
	isBoolean = Lang.isBoolean,
	isFunction = Lang.isFunction,
	isObject = Lang.isObject,
	isString = Lang.isString,

	ATTRIBUTE_VALUE_FORMAT = 'attributeValueFormat',
	ATTRIBUTES = 'attributes',
	ARIA = 'aria',
	ARIA_PREFIX = 'aria-',
	ATTRIBUTE_NODE = 'attributeNode',
	BOUNDING_BOX = 'boundingBox',
	HOST = 'host',
	ROLE = 'role',
	ROLE_NAME = 'roleName',
	ROLE_NODE = 'roleNode',
	VALIDATE_W3C = 'validateW3C',
	CHANGE_PREFIX = 'Change',

	EMPTY_STR = '',
	STR_REGEX = /([^a-z])/ig,

	EV_PROCESS_ATTRIBUTE = 'aria:processAttribute',

	_toAriaRole = A.cached(
		function(str) {
			return str.replace(STR_REGEX, function() {
				return EMPTY_STR;
			})
			.toLowerCase();
		}
	);

var Aria = A.Component.create({
	NAME: ARIA,

	NS: ARIA,

	ATTRS: {
		attributes: {
			value: {},
			validator: isObject
		},

		attributeValueFormat: {
			value: function(val) {
				return val;
			},
			validator: isFunction
		},

		attributeNode: {
			writeOnce: true,
			setter: A.one,
			valueFn: function() {
				return this.get(HOST).get(BOUNDING_BOX);
			}
		},

		roleName: {
			valueFn: function() {
				var instance = this;
				var host = instance.get(HOST);
				var roleName = _toAriaRole(host.constructor.NAME || EMPTY_STR);

				return (instance.isValidRole(roleName) ? roleName : EMPTY_STR);
			},
			validator: isString
		},

		roleNode: {
			writeOnce: true,
			setter: A.one,
			valueFn: function() {
				return this.get(HOST).get(BOUNDING_BOX);
			}
		},

		validateW3C: {
			value: true,
			validator: isBoolean
		}
	},

	EXTENDS: A.Plugin.Base,

	prototype: {
		initializer: function() {
			var instance = this;

			instance.publish(EV_PROCESS_ATTRIBUTE, {
	            defaultFn: instance._defProcessFn,
	            queuable: false,
	            emitFacade: true,
	            bubbles: true,
	            prefix: ARIA
	        });

			instance._uiSetRoleName(
				instance.get(ROLE_NAME)
			);

			instance.after('roleNameChange', instance._afterRoleNameChange);

			instance._bindHostAttributes();
		},

		isValidAttribute: function(attrName) {
			var instance = this;

			return (instance.get(VALIDATE_W3C) ? A.Plugin.Aria.W3C_ATTRIBUTES[attrName] : true);
		},

		isValidRole: function(roleName) {
			var instance = this;

			return (instance.get(VALIDATE_W3C) ? A.Plugin.Aria.W3C_ROLES[roleName] : true);
		},

		setAttribute: function(attrName, attrValue, node) {
			var instance = this;

			if (instance.isValidAttribute(attrName)) {
				(node || instance.get(ATTRIBUTE_NODE)).set(ARIA_PREFIX+attrName, attrValue);

				return true;
			}

			return false;
		},

		setAttributes: function(attributes) {
			var instance = this;

			A.Array.each(attributes, function(attribute, index, attributes) {
				instance.setAttribute(attribute.name, attribute.value, attribute.node);
			});
		},

		setRole: function(roleName, node) {
			var instance = this;

			if (instance.isValidRole(roleName)) {
				(node || instance.get(ROLE_NODE)).set(ROLE, roleName);

				return true;
			}

			return false;
		},

		setRoles: function(roles) {
			var instance = this;

			A.Array.each(roles, function(role, index, roles) {
				instance.setRole(role.name, role.node);
			});
		},

		_afterHostAttributeChange: function(event) {
			var instance = this;

			instance._handleProcessAttribute(event);
		},

		_afterRoleNameChange: function(event) {
			var instance = this;

			instance._uiSetRoleName(event.newVal);
		},

		_bindHostAttributes: function() {
			var instance = this;
			var attributes = instance.get(ATTRIBUTES);

			A.each(attributes, function(aria, attrName) {
				var ariaAttr = instance._getAriaAttribute(aria, attrName);

				instance._handleProcessAttribute({ aria: ariaAttr });

				instance.afterHostEvent(attrName+CHANGE_PREFIX, function(event) {
					event.aria = ariaAttr;
					instance._afterHostAttributeChange(event);
				});
			});
		},

		_defProcessFn: function(event) {
			var instance = this;

			instance._setAttribute(event.aria);
		},

		_getAriaAttribute: function(aria, attrName) {
			var instance = this;
			var attributeValueFormat = instance.get(ATTRIBUTE_VALUE_FORMAT);
			var prepared = {};

			if (isString(aria)) {
				prepared = A.merge(prepared, {
					ariaName: aria,
					attrName: attrName,
					format: attributeValueFormat,
					node: null
				});
			}
			else if (isObject(aria)) {
				prepared = A.mix(aria, {
					ariaName: EMPTY_STR,
					attrName: attrName,
					format: attributeValueFormat,
					node: null
				});
			}

			return prepared;
		},

		_handleProcessAttribute: function(event) {
			var instance = this;

			instance.fire(EV_PROCESS_ATTRIBUTE, { aria: event.aria });
		},

		_setAttribute: function(ariaAttr) {
			var instance = this;
			var host = instance.get(HOST);
			var attrValue = host.get(ariaAttr.attrName);
			var attrNode = ariaAttr.node;

			if (isFunction(attrNode)) {
				attrNode = attrNode.apply(instance, [ariaAttr]);
			}

			instance.setAttribute(
				ariaAttr.ariaName,
				ariaAttr.format.apply(instance, [attrValue, ariaAttr]),
				attrNode
			);
		},

		_uiSetRoleName: function(val) {
			var instance = this;

			instance.setRole(val);
		}
	}
});

A.Plugin.Aria = Aria;