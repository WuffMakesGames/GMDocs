/// Parses and adds a script to the current group.
/// Scripts with multiple functions will be split into several items.
/// @arg {string,Asset.GMScript,Asset.GMConstructor} name The script or its name as seen in the IDE.
function docs_add_script(_name_or_asset) {
	if (!__docs_init.generating) return;
	var _filename = __docs_asset_path(DOCS_ASSET_TYPE.script, _name_or_asset);
	
	// File doesn't exist
	if (!file_exists(_filename)) {
		return __docs_logger.error($"Failed to add script '{_name_or_asset}'.");
	}
	
	// Add script to docs instance
	var _instance = __docs_get_instance();
	_instance.add(__docs_parse_script(_filename));
	__docs_logger.log("Added script:", _filename);
}