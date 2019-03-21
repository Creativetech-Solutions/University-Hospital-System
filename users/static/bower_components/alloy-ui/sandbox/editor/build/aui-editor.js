AUI.add('aui-editor-tools-plugin', function(A) {
var Lang = A.Lang,

	JUSTIFY = 'justify',

	BLOCK_TAGS = {
		div: true,
		h1: true,
		h2: true,
		h3: true,
		h4: true,
		h5: true,
		h6: true,
		p: true
	},

	TPL_JUSTIFY = '<div style="text-align: {0};">{1}</div>';

var EditorTools = {};

A.namespace('Plugin');

A.mix(
	A.Plugin.ExecCommand.COMMANDS,
	{
		justify: function(cmd, val) {
			var instance = this;

			var host = instance.get('host'),
				frame = host.getInstance();

			var selection = new frame.Selection(),
				items = selection.getSelected(),
				insertHtml = false;

			if (selection.isCollapsed || !items.size()) {
				var anchorTextNode = selection.anchorTextNode;
				items = [anchorTextNode];

				insertHtml = true;
			}

			A.each(
				items,
				function(node) {
					var tagName = node.get('tagName'),
						parent = node.ancestor(),
						wrapper = null;

					if (tagName) {
						tagName = tagName.toLowerCase();
					}

					if (!node.test('body') && node.getComputedStyle('textAlign') == val) {
						return;
					}

					if (BLOCK_TAGS[tagName] || node.getComputedStyle('display') == 'block') {
						wrapper = node;
					}
					else if (!parent.get('childNodes').item(1)) {
						tagName = parent.get('tagName').toLowerCase();

						if (BLOCK_TAGS[tagName] || parent.getComputedStyle('display') == 'block') {
							wrapper = parent;
						}
					}
					else {
						if (insertHtml) {
							host.execCommand('inserthtml', Lang.sub(TPL_JUSTIFY, [val, frame.Selection.CURSOR]));

							selection.focusCursor(true, true);

							return;
						}
						else {
							wrapper = A.Node.create(Lang.sub(TPL_JUSTIFY, [val, '']));

							parent.insert(wrapper, node);

							wrapper.append(node);
						}
					}

					wrapper.setStyle('textAlign', val);
				}
			);
		},

		justifycenter: function() {
			var instance = this;

			var host = instance.get('host');

			return host.execCommand(JUSTIFY, 'center');
		},

		justifyleft: function() {
			var instance = this;

			var host = instance.get('host');

			return host.execCommand(JUSTIFY, 'left');
		},

		justifyright: function() {
			var instance = this;

			var host = instance.get('host');

			return host.execCommand(JUSTIFY, 'right');
		},

		subscript: function() {
			var instance = this;

			var host = instance.get('host');

			return host.execCommand('wrap', 'sub');
		},

		superscript: function() {
			var instance = this;

			var host = instance.get('host');

			return host.execCommand('wrap', 'sup');
		},

		wraphtml: function(cmd, val) {
			var instance = this;

			var host = instance.get('host'),
				frame = host.getInstance();

			var selection = new frame.Selection(),
				items = selection.getSelected();

			if (!selection.isCollapsed && items.size()) {
				items.each(
					function(node) {
						var parent = node.ancestor();

						var wrapper = A.Node.create(val);

						if (wrapper.html() != '') {
							if (wrapper.html() == '{0}') {
								wrapper.html('');
							}
							else {
								function findInsert(node) {
									var found = null;
									var childNodes = node.get('childNodes');

									childNodes.some(
										function (node) {
											if (node.get('innerHTML') == '{0}') {
												found.html('');

												found = node;

												return true;
											}

											return findInsert(node);
										}
									);

									if (found) {
										wrapper = found;

										return true;
									}

									return false;
								}

								findInsert(wrapper);
							}
						}

						parent.insert(wrapper, node);

						wrapper.append(node);
					}
				);
			}
			else {
				host.execCommand('inserthtml', Lang.sub(val, [frame.Selection.CURSOR]));
	
				if (val.indexOf('{0}') != -1) {
					selection.focusCursor(true, true);
				}
			}
		}
	}
);

A.Plugin.EditorTools = EditorTools;

}, '@VERSION@' ,{requires:['aui-base','editor-base']});

AUI.add('aui-editor-menu-plugin', function(A) {
var Lang = A.Lang,
	isString = Lang.isString,

	getClassName = A.getClassName,

	NAME = 'editormenu',
	NAME_PLUGIN = 'editormenuplugin',
	EDITORMENU_PLUGIN = 'menu',

	CONTENT = 'content',

	CSS_MENU_CONTENT_LIST = getClassName(NAME, CONTENT, 'list'),
	CSS_MENU_CONTENT_TEXT = getClassName(NAME, CONTENT, 'text'),
	CSS_MENU_CONTENT_ITEM = getClassName(NAME, CONTENT, 'item'),

	TPL_TAG_EMPTY = '<{1}{2}>{0}</{1}>',
	TPL_MENU_CONTENT_LIST = '<ul class="' + CSS_MENU_CONTENT_LIST + '"></ul>',
	TPL_MENU_CONTENT_TEXT = '<li class="' + CSS_MENU_CONTENT_TEXT + '"><span>{0}</span></li>',
	TPL_MENU_CONTENT_ITEM = '<li class="' + CSS_MENU_CONTENT_ITEM + '">' + TPL_TAG_EMPTY + '</li>';

	function generateTagAttr(config) {
		var output = '';

		if (config.attributes) {
			for (var i in config.attributes) {
				output += ' ' + i + '="' + config.attributes[i] + '"';
			}
		}

		if (config.styles) {
			output += ' style="';

			for (var i in config.styles) {
				output += i + ': ' + config.styles[i] + ';';
			}

			output += '"';
		}

		return output;
	}

var EditorMenu = A.Component.create(
		{
			NAME: NAME,

			EXTENDS: A.OverlayContext,

			ATTRS: {
				host: {
					value: false
				},
				items: {
					value: null
				}
			},

			prototype: {
				renderUI: function() {
					var instance = this;

					EditorMenu.superclass.renderUI.apply(instance, arguments);

					var host = instance.get('host');

					var	contentBox = instance.get('contentBox'),
						items = instance.get('items');

					var menuList = A.Node.create(TPL_MENU_CONTENT_LIST);

					A.each(
						items,
						function(config) {
							var output = '';

							if (isString(config)) {
								output += Lang.sub(TPL_MENU_CONTENT_TEXT, [config]);
							}
							else {
								var attr = generateTagAttr(config);

								output += Lang.sub(TPL_MENU_CONTENT_ITEM, [config.label, config.tag, attr]);
							}

							var item = A.Node.create(output);
							item.setData(NAME, config);

							menuList.append(item);
						}
					);

					contentBox.append(menuList);

					instance._menuList = menuList;
				},

				bindUI: function() {
					var instance = this;

					EditorMenu.superclass.bindUI.apply(instance, arguments);

					var host = instance.get('host');

					var menuList = instance._menuList;

					menuList.delegate(
						'click',
						function(event) {
							var instance = this;

							var item = event.currentTarget,
								config = item.getData(NAME);

							var attr = generateTagAttr(config),
								output = Lang.sub(TPL_TAG_EMPTY, ['{0}', config.tag, attr]);

							host.execCommand('wraphtml', output);
							host.focus();

							instance.hide();
						},
						'.' + CSS_MENU_CONTENT_ITEM,
						instance
					);
				}
			}
		}
	);

var EditorMenuPlugin = A.Component.create(
		{
			NAME: NAME_PLUGIN,

			NS: EDITORMENU_PLUGIN,

			EXTENDS: A.Plugin.Base,

			ATTRS: {
				host: {
					value: false
				}
			},

			prototype: {
				add: function(config) {
					var instance = this;

					var host = instance.get('host');

					return new EditorMenu(
						A.mix(
							{
								host: host
							},
							config
						)
					).render();
				}
			}
		}
	);

A.namespace('Plugin').EditorMenuPlugin = EditorMenuPlugin;

}, '@VERSION@' ,{requires:['aui-base','editor-base','aui-overlay-context','aui-editor-tools-plugin']});

AUI.add('aui-editor-toolbar-plugin', function(A) {
var Lang = A.Lang,
	isFunction = Lang.isFunction,

	getClassName = A.getClassName,

	NAME = 'editortoolbar',
	TOOLBAR_PLUGIN = 'toolbar',

	ALIGNMENT = 'alignment',
	CONTENT = 'content',
	FONT = 'font',
	INDENT = 'indent',
	INPUT = 'input',
	INSERT = 'insert',
	INSERTIMAGE = 'insertimage',
	LIST = 'list',
	MOUSEOUT = 'mouseout',
	SELECT = 'select',
	SOURCE = 'source',
	STYLES = 'styles',
	SUBSCRIPT = 'subscript',
	TEXT = 'text',

	CMD_IGNORE = {
		insertimage: true,
		source: true,
		styles: true
	},

	CSS_BUTTON_HOLDER = getClassName('button', 'holder'),
	CSS_FIELD_LABEL = getClassName('field', 'label'),
	CSS_FIELD_LABEL_SECONDARY = getClassName('field', 'label', 'secondary'),
	CSS_FIELD_INPUT = getClassName('field', INPUT),
	CSS_FIELD_INPUT_TEXT = getClassName('field', INPUT, 'text'),
	CSS_FIELD_INPUT_NUMERIC = getClassName('field', INPUT, 'numeric'),
	CSS_SELECT_FONTNAME = getClassName(NAME, SELECT, 'fontname'),
	CSS_SELECT_FONTSIZE = getClassName(NAME, SELECT, 'fontsize'),
	CSS_SOURCE_TEXTAREA = getClassName(NAME, SOURCE, 'textarea'),
	CSS_STATE_ACTIVE = getClassName('state', 'active'),
	CSS_TOOLBAR = getClassName(NAME),
	CSS_TOOLBAR_CONTENT = getClassName(NAME, CONTENT),
	CSS_INSERTIMAGE_CONTENT = getClassName(NAME, INSERTIMAGE, CONTENT),
	CSS_INSERTIMAGE_CONTENT_TARGET = getClassName(NAME, INSERTIMAGE, CONTENT, 'target'),
	CSS_INSERTIMAGE_CONTENT_ALIGN = getClassName(NAME, INSERTIMAGE, CONTENT, 'align'),

	TPL_INSERTIMAGE_BORDER = '<select>' +
								 '<option value="">none</option>' +
								 '<option value="1px solid">1px</option>' +
								 '<option value="2px solid">2px</option>' +
								 '<option value="3px solid">3px</option>' +
								 '<option value="4px solid">4px</option>' +
								 '<option value="5px solid">5px</option>' +
							 '</select>',
	TPL_INSERTIMAGE_HREF = '<a></a>',
	TPL_INSERTIMAGE_IMG = '<img />',

	TPL_SOURCE_TEXTAREA = '<textarea class="' + CSS_SOURCE_TEXTAREA + '"></textarea>',
	TPL_TOOLBAR = '<div class="' + CSS_TOOLBAR + '"><div class="' + CSS_TOOLBAR_CONTENT + '"></div></div>',
	TPL_TOOLBAR_FONTNAME = '<select class="' + CSS_SELECT_FONTNAME + '">{0}</select>',
	TPL_TOOLBAR_FONTNAME_OPTION =	'<option selected="selected"></option>' +
									'<option>Arial</option>' +
									'<option>Arial Black</option>' +
									'<option>Comic Sans MS</option>' +
									'<option>Courier New</option>' +
									'<option>Lucida Console</option>' +
									'<option>Tahoma</option>' +
									'<option>Times New Roman</option>' +
									'<option>Trebuchet MS</option>' +
									'<option>Verdana</option>',
	TPL_TOOLBAR_FONTSIZE = '<select class="' + CSS_SELECT_FONTSIZE + '">{0}</select>',
	TPL_TOOLBAR_FONTSIZE_OPTION =	'<option selected="selected"></option>' +
									'<option value="1">10</option>' +
									'<option value="2">13</option>' +
									'<option value="3">16</option>' +
									'<option value="4">18</option>' +
									'<option value="5">24</option>' +
									'<option value="6">32</option>' +
									'<option value="7">48</option>';

	function generateInput(title) {
		return generateLabel(title) + '<input type="text" class="' + CSS_FIELD_INPUT + ' ' + CSS_FIELD_INPUT_TEXT + '" />';
	}

	function generateInputNumeric() {
		return '<input type="text" class="' + CSS_FIELD_INPUT + ' ' + CSS_FIELD_INPUT_TEXT + ' ' + CSS_FIELD_INPUT_NUMERIC + '" />';
	}

	function generateLabel(title, css) {
		return '<label class="' + CSS_FIELD_LABEL + (css ? ' ' + css : '') + '">' + title + '</label>';
	}

	GROUPS = [];

	GROUPS[ALIGNMENT] = {
		children: [
			{ icon: 'justifyleft' },
			{ icon: 'justifycenter' },
			{ icon: 'justifyright' }
		]
	};
	GROUPS[FONT] = {
		children: [
			{ icon: 'fontname', select: true },
			{ icon: 'fontsize', select: true }
		],
		generate: {
			init: function(editor, attrs) {
				var instance = this;

				var contentBox = attrs.contentBox;

				A.delegate(
					'change',
					function(event) {
						var instance = this;

						var target = event.currentTarget,
							css = target.get('className'),
							cmd = css.substring(css.lastIndexOf('-') + 1),
							val = target.get('value');

						editor.execCommand(cmd, val);
						editor.focus();
					},
					contentBox,
					'select'
				);

				editor.after(
					'nodeChange',
					function(event) {
						var instance = this;

						switch (event.changedType) {
							case 'keyup':
							case 'mousedown':
								instance._updateToolbar(event, attrs);
								break;
						}
					},
					instance
				);
			},

			fontname: function(editor, attrs, config) {
				var instance = this;

				var contentBox = attrs.contentBox;

				var tpl = null;

				if (config && config.optionHtml) {
					tpl = Lang.sub(TPL_TOOLBAR_FONTNAME, [config.optionHtml]);
				}
				else {
					tpl = Lang.sub(TPL_TOOLBAR_FONTNAME, [TPL_TOOLBAR_FONTNAME_OPTION]);
				}

				contentBox.append(tpl);

				var options = contentBox.all('.' + CSS_SELECT_FONTNAME + ' option');

				attrs._fontNameOptions = options;
			},

			fontsize: function(editor, attrs, config) {
				var instance = this;

				var contentBox = attrs.contentBox;

				var tpl = null;

				if (config && config.optionHtml) {
					tpl = Lang.sub(TPL_TOOLBAR_FONTSIZE, [config.optionHtml]);
				}
				else {
					tpl = Lang.sub(TPL_TOOLBAR_FONTSIZE, [TPL_TOOLBAR_FONTSIZE_OPTION]);
				}

				contentBox.append(tpl);

				var options = contentBox.all('.' + CSS_SELECT_FONTSIZE + ' option');

				attrs._fontSizeOptions = options;
			}
		}
	};
	GROUPS[INDENT] = {
		children: [
			{ icon: 'indent' },
			{ icon: 'outdent' }
		]
	};
	GROUPS[INSERT] = {
		children: [
			{ icon: 'insertimage' },
			{ icon: 'createlink' }
		],
		generate: {
			insertimage: function(editor, attrs, config) {
				var instance = this;

				var button = attrs.button,
				boundingBox = button.get('boundingBox');

				var overlay = new A.OverlayContext(
					A.merge(
						{
							trigger: boundingBox,
							showOn: 'click',
							hideOn: 'click',
							align: {
								node: boundingBox,
								points: [ 'tl', 'bl' ]
							}
						},
						config
					)
				).render();

				var contextBox = overlay.get('contentBox');

				if (config && config.databrowser) {
					config.databrowser.render(contextBox);
				}
				else {
					var frame = editor.getInstance(),
						iframe = editor.frame._iframe,
						selection = null;

					var imageForm = A.Node.create(TPL_INSERTIMAGE);

					contextBox.append(imageForm);

					var hrefTarget = imageForm.one('.' + CSS_INSERTIMAGE_CONTENT_TARGET + ' input');

					var toolbar = new A.Toolbar(
						{
							children: [
								{
									icon: 'circle-close',
									label: EditorToolbarPlugin.STRINGS.CANCEL
								},
								{
									icon: 'circle-check',
									label: EditorToolbarPlugin.STRINGS.INSERT
								}
							]
						}
					);

					toolbar.item(0).on(
						'click',
						function(event) {
							var instance = this;

							overlay.hide();
						},
						instance
					);

					toolbar.item(1).on(
						'click',
						function(event) {
							var instance = this;

							var href = A.Node.create(TPL_INSERTIMAGE_HREF);
							var img = A.Node.create(TPL_INSERTIMAGE_IMG);

							var url = null;

							imageForm.all('input').each(
								function(node, index) {
									switch(index) {
										case 0:
											img.attr('src', node.val());

											break;

										case 1:
											var width = parseInt(node.val());

											if (!isNaN(width)) {
												img.attr('width', width);
											}

											break;

										case 2:
											var height = parseInt(node.val());

											if (!isNaN(height)) {
												img.attr('height', height);
											}

											break;

										case 3:
											var padding = parseInt(node.val());

											if (!isNaN(padding)) {
												img.setStyle('padding', padding + 'px');
											}

											break;

										case 4:
											img.attr('title', node.val());
											img.attr('alt', node.val());

											break;

										case 5:
											url = node.val();

											break;
									}
								}
							);

							imageForm.all('select').each(
								function(node, index) {
									switch(index) {
										case 0:
											img.setStyle('border', node.val());

											break;
									}
								}
							);

							toolbarAlign.some(
								function(node, index) {
									var instance = this;

									var active = node.StateInteraction.get('active');

									if (active) {
										img.setStyle('display', '');

										switch(index) {
											case 0:
												img.attr('align', 'left');

												break;
	
											case 1:
												img.attr('align', '');

												break;
	
											case 2:
												img.attr('align', 'center');
												img.setStyle('display', 'block');

												break;
	
											case 3:
												img.attr('align', 'right');

												break;
										}

										return true;
									}
								}
							);

							if (url != null) {
								href.attr('href', url);

								if (hrefTarget.attr('checked')) {
									href.attr('target', '_blank');
								}

								href.append(img);

								img = href;
							}

							if (selection && selection.anchorNode) {
								selection.anchorNode.append(img)
							}

							overlay.hide();
						},
						instance
					);

					toolbar.render(imageForm.one('.' + CSS_BUTTON_HOLDER));

					var toolbarAlign = new A.Toolbar(
							{
								activeState: true,
								children: [
									{
										icon: 'align-left',
										title: EditorToolbarPlugin.STRINGS.ALIGN_LEFT
									},
									{
										icon: 'align-inline',
										title: EditorToolbarPlugin.STRINGS.ALIGN_INLINE
									},
									{
										icon: 'align-block',
										title: EditorToolbarPlugin.STRINGS.ALIGN_BLOCK
									},
									{
										icon: 'align-right',
										title: EditorToolbarPlugin.STRINGS.ALIGN_RIGHT
									}
								]
							}
						);

					toolbarAlign.on(
						'buttonitem:click',
						function(event) {
							var instance = this;

							var button = event.target;

							instance.each(
								function(node) {
									var instance = this;

									if (node != button) {
										node.StateInteraction.set('active', false);
									}
								}
							);
						}
					);

					toolbarAlign.render(imageForm.one('.' + CSS_INSERTIMAGE_CONTENT_ALIGN));

					overlay.on(
						'hide',
						function(event) {
							var instance = this;

							instance.all('input').each(
								function(node) {
									node.val('');
								}
							);

							instance.all('select').each(
								function(node) {
									node.attr('selectedIndex', 0);
								}
							);

							toolbarAlign.each(
								function(node) {
									var instance = this;

									node.StateInteraction.set('active', false);
								}
							);

							hrefTarget.attr('checked', false);
						},
						imageForm
					);

					iframe.on(
						MOUSEOUT,
						function(event) {
							var instance = this;

							var frame = instance.getInstance();

							selection = new frame.Selection();
						},
						editor
					);
				}
			},

			createlink: function(editor, attrs, config) {
				var instance = this;

				editor.plug(A.Plugin.CreateLinkBase);
			}
		}
	};
	GROUPS[LIST] = {
		children: [
			{ icon: 'insertunorderedlist' },
			{ icon: 'insertorderedlist' }
		],
		generate: {
			init: function(editor) {
				var instance = this;

				editor.plug(A.Plugin.EditorLists);
			}
		}
	};
	GROUPS[SOURCE] = {
		children: [
			{ icon: 'source' }
		],
		generate: {
			source: function(editor, attrs, config) {
				var instance = this;

				var frame = editor.frame,
					container = frame.get('container'),
					contentBox = attrs.contentBox;

				var textarea = A.Node.create(TPL_SOURCE_TEXTAREA);

				textarea.hide();

				container.append(textarea);

				var button = attrs.button;

				button._visible = false;

				button.on(
					'click',
					function(event) {
						var instance = this;

						if (button._visible) {
							editor.set('content', textarea.val());

							textarea.hide();
							textarea.val('');

							frame.show();
						}
						else {
							var iframe = frame._iframe;

							textarea.val(editor.getContent());

							var offsetHeight = (
									iframe.get('offsetHeight') -
									parseInt(textarea.getComputedStyle('paddingTop')) -
									parseInt(textarea.getComputedStyle('paddingBottom'))
								);

							textarea.setStyle('height', offsetHeight + 'px');

							frame.hide();

							textarea.show();
						}

						button._visible = !button._visible;

						contentBox.all('select').attr('disabled', button._visible);
						contentBox.all('button').attr('disabled', button._visible);

						button.get('contentBox').attr('disabled', false);
					},
					editor
				)
			}
		}
	},
	GROUPS[STYLES] = {
		children: [
			{ icon: 'styles' }
		],
		generate: {
			styles: function(editor, attrs, config) {
				var instance = this;

				var button = attrs.button
					boundingBox = button.get('boundingBox');

				editor.plug(A.Plugin.EditorMenuPlugin);

				editor.menu.add(
					A.merge(
						{
							trigger: boundingBox,
							showOn: 'click',
							hideOn: 'click',
							align: {
								node: boundingBox,
								points: [ 'tl', 'bl' ]
							}
						},
						config
					)
				);
			}
		}
	};
	GROUPS[SUBSCRIPT] = {
		children: [
			{ icon: 'subscript' },
			{ icon: 'superscript' }
		]
	};
	GROUPS[TEXT] = {
		children: [
			{ icon: 'bold' },
			{ icon: 'italic' },
			{ icon: 'underline' },
			{ icon: 'strikethrough' }
		]
	};

var EditorToolbarPlugin = A.Component.create(
		{
			NAME: NAME,

			NS: TOOLBAR_PLUGIN,

			EXTENDS: A.Plugin.Base,

			ATTRS: {
				groups: {
					value: [
						{ type: TEXT },
						{ type: ALIGNMENT },
						{ type: INDENT },
						{ type: LIST }
					]
				}
			},

			prototype: {
				initializer: function() {
					var instance = this;

					var host = instance.get('host'),
						container = host.frame.get('container'),
						groups = instance.get('groups');

					var boundingBox = A.Node.create(TPL_TOOLBAR),
						contentBox = boundingBox.one('.' + CSS_TOOLBAR_CONTENT);

					container.placeBefore(boundingBox);

					var attrs = {
						boundingBox: boundingBox,
						contentBox: contentBox
					};

					var toolbars = [];

					for (var i = 0; i < groups.length; i++) {
						var group = groups[i],
							groupType = GROUPS[group.type];

						var children = [];

						for (var j = 0; j < groupType.children.length; j++) {
							if (!groupType.children[j].select) {
								children.push(groupType.children[j]);
							}
						}

						if (children.length > 0) {
							var toolbar = new A.Toolbar(
								A.merge(
									{
										activeState: true
									},
									group.toolbar,
									{
										children: children
									}
								)
							).render(contentBox);

							toolbar.on(
								'buttonitem:click',
								function(event) {
									var instance = this;

									var cmds = event.target.get('icon').split('-');

									if (!CMD_IGNORE[cmds[0]]) {
										instance.execCommand(cmds[0], (cmds[1] ? cmds[1] : ''));
										instance.focus();
									}
								},
								host
							);

							toolbars.push(toolbar);
						}

						var generate = groupType.generate;

						if (generate && isFunction(generate.init)) {
							generate.init.call(instance, host, attrs);
						}

						for (var j = 0; j < groupType.children.length; j++) {
							var icon = groupType.children[j].icon;

							if (generate && isFunction(generate[icon])) {
								var config = (group.config ? group.config[icon] : null);

								attrs.button = (generate[icon].select ? null : toolbar.item(j));

								generate[icon].call(instance, host, attrs, config);
							}
						}
					}

					attrs.toolbars = toolbars;
				},

				_updateToolbar: function(event, attrs) {
					var instance = this;

					if (event.changedNode) {
						var cmds = event.commands,
							toolbars = attrs.toolbars;

						if (toolbars) {
							for (var i = 0; i < toolbars.length; i++) {
								toolbars[i].each(
									function(node) {
										var state = false;

										if (cmds[node.get('icon')]) {
											state = true;
										}

										node.StateInteraction.set('active', state);
									}
								);
							}
						}

						var fontName = event.fontFamily,
							fontNameOptions = attrs._fontNameOptions,
							fontSize = event.fontSize,
							fontSizeOptions = attrs._fontSizeOptions;

						if (fontNameOptions) {
							fontNameOptions.item(0).set('selected', true);

							fontNameOptions.each(
								function(node) {
									var val = node.get('value').toLowerCase();

									if (val === fontName.toLowerCase()) {
										node.set('selected', true);
									}
								}
							);
						}

						if (fontSizeOptions) {
							fontSize = fontSize.replace('px', '');

							fontSizeOptions.item(0).set('selected', true);

							fontSizeOptions.each(
								function(node) {
									var val = node.get('value').toLowerCase(),
										txt = node.get('text');

									if (txt === fontSize) {
										node.set('selected', true);
									}
								}
							);
						}
					}
				}
			}
		}
	);

EditorToolbarPlugin.STRINGS = {
	ALIGN: 'Align',
	ALIGN_BLOCK: 'Block',
	ALIGN_LEFT: 'Left',
	ALIGN_INLINE: 'Inline',
	ALIGN_RIGHT: 'Right', 
	BORDER: 'Border',
	CANCEL: 'Cancel',
	DESCRIPTION: 'Description',
	IMAGE_URL: 'Image URL',
	INSERT: 'Insert',
	LINK_URL: 'Link URL',
	OPEN_IN_NEW_WINDOW: 'Open in new window',
	PADDING: 'Padding',
	SIZE: 'Size'
};

var	TPL_INSERTIMAGE = 	'<div class="' + CSS_INSERTIMAGE_CONTENT + '">' +
							'<ul>' +
								'<li>' + generateInput(EditorToolbarPlugin.STRINGS.IMAGE_URL) + '</li>' +
								'<li>' + generateLabel(EditorToolbarPlugin.STRINGS.SIZE) + generateInputNumeric() + '<span>x</span>' + generateInputNumeric() + '</li>' +
								'<li>' +
									generateLabel(EditorToolbarPlugin.STRINGS.PADDING) + generateInputNumeric() +
									generateLabel(EditorToolbarPlugin.STRINGS.BORDER, CSS_FIELD_LABEL_SECONDARY) + TPL_INSERTIMAGE_BORDER +
								'</li>' +
								'<li>' +
									generateLabel(EditorToolbarPlugin.STRINGS.ALIGN) +
									'<div class="' + CSS_INSERTIMAGE_CONTENT_ALIGN + '"></div>' +
								'</li>' +
								'<li>' + generateInput(EditorToolbarPlugin.STRINGS.DESCRIPTION) + '</li>' +
								'<li>' + generateInput(EditorToolbarPlugin.STRINGS.LINK_URL) + '</li>' +
							'</ul>' +
							'<span class="' + CSS_INSERTIMAGE_CONTENT_TARGET + '"><input type="checkbox" /><label>' + EditorToolbarPlugin.STRINGS.OPEN_IN_NEW_WINDOW + '</label></span>' +
							'<div class="' + CSS_BUTTON_HOLDER + '"></div>' +
						'</div>';

A.namespace('Plugin').EditorToolbarPlugin = EditorToolbarPlugin;

}, '@VERSION@' ,{requires:['aui-base','editor-base','aui-toolbar','aui-overlay-context','aui-editor-menu-plugin','aui-editor-tools-plugin','aui-button-item','createlink-base','editor-lists','plugin']});



AUI.add('aui-editor', function(A){}, '@VERSION@' ,{skinnable:true, use:['aui-editor-tools-plugin','aui-editor-menu-plugin','aui-editor-toolbar-plugin']});

