function docs_add_script(_name) {
	if (!__docs_init.generating) return;
	var _filename = __docs_asset_path(DOCS_ASSET_TYPE.script, _name);
	
	// File doesn't exist
	if (!file_exists(_filename)) {
		return __docs_logger.error($"Failed to add script '{_name}'.");
	}
	
	// Add script to docs instance
	var _instance = __docs_get_instance();
	_instance.add_item(_instance.category, _instance.group, __docs_parse_script(_filename));
	__docs_logger.log("Added script:", _filename);
}