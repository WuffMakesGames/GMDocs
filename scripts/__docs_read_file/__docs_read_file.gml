/// Returns an empty string if no file exists.
/// @arg {string} filename The path to the file
/// @return {string} The text content of the file
function __docs_read_file(_filename) {
	if (!file_exists(_filename)) return ""
	
	var _buffer = buffer_load(_filename);
	var _text = buffer_read(_buffer, buffer_text);
	
	buffer_delete(_buffer);
	return _text;
}