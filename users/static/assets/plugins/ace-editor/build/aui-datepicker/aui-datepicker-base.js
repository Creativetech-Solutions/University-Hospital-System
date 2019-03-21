AUI.add('aui-datepicker-base', function(A) {
var Lang = A.Lang,
	isBoolean = Lang.isBoolean,
	isFunction = Lang.isFunction,

	CALENDAR = 'calendar',
	CONTENT_BOX = 'contentBox',
	CURRENT_NODE = 'currentNode',
	FORMATTER = 'formatter',
	SELECT_MULTIPLE_DATES = 'selectMultipleDates',
	SET_VALUE = 'setValue',

	DATEPICKER = 'date-picker';

var DatePicker = A.Component.create({
	NAME: DATEPICKER,

	ATTRS: {
		/**
		 * <a href="Calendar.html">Calendar</a> configuration Object.</a>
		 *
		 * @attribute calendar
		 * @default {}
		 * @type Object
		 */
		calendar: {
			setter: '_setCalendar',
			value: {}
		},

		/**
		 * Function to format the array of the selected dates before set the
         * value of the input.
		 *
		 * @attribute formatter
		 * @default function(dates) { return dates.formatted.join(','); }
		 * @type function
		 */
		formatter: {
			value: function(dates) {
				return dates.formatted.join(',');
			},
			validator: isFunction
		},

		/**
		 * If true set the selected date with the correct
		 * <a href="Calendar.html#config_dateFormat">dateFormat</a> to the
		 * value of the input field which is hosting the Calendar.
		 *
		 * @attribute setValue
		 * @default true
		 * @type boolean
		 */
		setValue: {
			value: true,
			validator: isBoolean
		},

		/**
		 * If true is able To Do stacking with another overlays.
		 *
		 * @attribute stack
		 * @default true
		 * @type boolean
		 */
		stack: {
			lazyAdd: false,
			value: true,
			setter: '_setStack',
			validator: isBoolean
		},

		showOn: {
			value: 'mousedown'
		},

		hideOn: {
			value: 'mousedown'
		}
	},

	EXTENDS: A.OverlayContext,

	prototype: {
		/**
		 * Construction logic executed during Datepicker instantiation. Lifecycle.
		 *
		 * @method initializer
		 * @protected
		 */
		initializer: function() {
			var instance = this;

			instance.calendar = new A.Calendar(
				instance.get(CALENDAR)
			);
		},

		/**
		 * Bind the events on the Datepicker UI. Lifecycle.
		 *
		 * @method bindUI
		 * @protected
		 */
		bindUI: function() {
			var instance = this;

			DatePicker.superclass.bindUI.apply(this, arguments);

			instance.on('show', instance._onShowOverlay);
			instance.after('calendar:select', instance._afterSelectDate);

			// Set the value of the trigger with the Calendar current date
			if (instance.get(SET_VALUE)) {
				instance._setTriggerValue(
					instance.calendar._getSelectEventData().date
				);
			}
		},

		/**
		 * Descructor lifecycle implementation for the Datepicker class.
		 * Purges events attached to the node (and all child nodes).
		 *
		 * @method destructor
		 * @protected
		 */
		destructor: function() {
			var instance = this;

			instance.calendar.destroy();
		},

		/**
		 * Fires when a date is selected on the Calendar.
		 *
		 * @method _afterSelectDate
		 * @param {Event} event
		 * @protected
		 */
		_afterSelectDate: function(event) {
			var instance = this;

			if (!instance.calendar.get(SELECT_MULTIPLE_DATES)) {
				instance.hide();
			}

			if (instance.get(SET_VALUE)) {
				instance._setTriggerValue(event.date);
			}
		},

		/**
		* Fires before the DatePicker overlay show. Responsible to invoke the
		* render phase of the Calendar.
		 *
		 * @method _onShowOverlay
		 * @param {Event} event
		 * @protected
		 */
		_onShowOverlay: function(event) {
			var instance = this;

			instance._renderCalendar();
		},

		/**
		 * Render the Calendar used inside the DatePicker.
		 *
		 * @method _renderCalendar
		 * @protected
		 */
		_renderCalendar: function() {
			var instance = this;

			instance.calendar.render(
				instance.get(CONTENT_BOX)
			);
		},

		/**
		 * Setter for the <a href="DatePicker.html#calendar">calendar</a>
	     * attribute.
		 *
		 * @method _setCalendar
		 * @param {String} eventType Event type
		 * @protected
		 * @return {}
		 */
		_setCalendar: function(val) {
			var instance = this;

			A.mix(val, {
				bubbleTargets: instance
			});

			return val;
		},

		/**
		 * Setter for the <a href="Calendar.html#config_stack">stack</a> attribute.
		 *
		 * @method _setStack
		 * @param {boolean} value
		 * @protected
		 * @return {boolean}
		 */
		_setStack: function(value) {
			var instance = this;

			if (value) {
				A.DatepickerManager.register(instance);
			}
			else {
				A.DatepickerManager.remove(instance);
			}

			return value;
		},

		/**
		 * Set the value of the trigger input with the date information.
		 *
		 * @method _setTriggerValue
		 * @param {Object} dateObj Object containing date information
		 * @protected
		 */
		_setTriggerValue: function(dateObj) {
			var instance = this;

			var value = instance.get(FORMATTER).apply(instance, [dateObj]);

			instance.get(CURRENT_NODE).val(value);
		}
	}
});

A.DatePicker = DatePicker;

/**
 * A base class for DatepickerManager:
 *
 * @param config {Object} Object literal specifying widget configuration properties.
 *
 * @class DatepickerManager
 * @constructor
 * @extends OverlayManager
 * @static
 */
A.DatepickerManager = new A.OverlayManager({
	/**
	 * ZIndex default value passed to the
     * <a href="OverlayManager.html#config_zIndexBase">zIndexBase</a> of
     * <a href="OverlayManager.html">OverlayManager</a>.
	 *
	 * @attribute zIndexBase
	 * @default 1000
	 * @type Number
	 */
	zIndexBase: 1000
});

}, '@VERSION@' ,{requires:['aui-calendar','aui-overlay-context'], skinnable:true});
