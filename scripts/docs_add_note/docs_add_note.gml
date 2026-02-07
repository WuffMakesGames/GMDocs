function docs_add_note(_name) {
	if (!__docs_init.generating) return;
	var _filename = __docs_asset_path(DOCS_ASSET_TYPE.note, _name);
	
	// File doesn't exist
	if (!file_exists(_filename)) {
		return __docs_logger.error($"Failed to add note '{_name}'. Note might be empty?");
	}
	
	// Add note to docs instance
	var _instance = __docs_get_instance();
	_instance.add_item(_instance.category, _instance.group, __docs_parse_note(_filename));
	__docs_logger.log("Added note:", _filename);
}