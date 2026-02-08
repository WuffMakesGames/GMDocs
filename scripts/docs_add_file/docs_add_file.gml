/// Parses and adds a file to the current group.
/// Files can be formatted with markdown.
/// @arg {string} filename The path to the file. Can be relative or absolute.
function docs_add_file(_filename) {
	if (!__docs_init.generating) return;
	
	// File doesn't exist
	if (!file_exists(_filename)) {
		return __docs_logger.error($"Failed to add file '{_filename}'. Check the path is correct?");
	}
	
	// Add file to docs instance
	var _instance = __docs_get_instance();
	_instance.add(__docs_parse_file(_filename));
	__docs_logger.log("Added file:", _filename);
}