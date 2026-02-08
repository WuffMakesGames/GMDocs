/// Updates the style for your documentation.
/// Can set values like the background color, text color, accent colors, etc.
/// @arg {Enum.DOCS_STYLE} key The style key. (i.e. DOCS_STYLE.accent)
/// @arg {any} value The value to set the key too. 
function docs_style(_key, _value) {
	if (!__docs_init.generating) return;
	
	var _instance = __docs_get_instance();
	_instance.style[_key] = _value;
}