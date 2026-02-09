/// Parses and adds a script to the current group.
/// Scripts with multiple functions will be split into several items.
/// @arg {string, Asset.GMScript} name_or_asset The script or its name as seen in the IDE.
function docs_add_script(_name_or_asset) {
	if (!__docs_init.generating) return;
	
	var _name = is_string(_name_or_asset) ? _name : script_get_name(_name_or_asset);
	var _filename = __docs_asset_path(DOCS_ASSET_TYPE.script, _name);
	
	// File doesn't exist
	if (!file_exists(_filename)) {
		return __docs_logger.error($"Failed to add script '{_name}'.");
	}
	
	// Add script to docs instance
	var _instance = __docs_get_instance();
	var _items = __docs_parse_script(_filename);
	for (var i = 0; i < array_length(_items); i++) {
		_instance.add(_items[i]);
	}
	__docs_logger.log("Added script:", _filename);
	
	//// Assume it's a classic script layout
	//if (array_length(_items) == 0) {
		//var _item = new __DocsItem(_name);
		//_item.jsdocs = __docs_parse_jsdocs(__docs_read_file(_filename));
		//_instance.add(__docs_parse_jsdocs());
		//
	//// Modern script layout
	//} else {
		//for (var i = 0; i < array_length(_items); i++) _instance.add(_items[i]);
		//__docs_logger.log("Added functions from script:", _filename);
	//}
	
}