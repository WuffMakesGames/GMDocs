/// Wrties a string to a file.
/// @arg {string} filename The path to the file
/// @arg {string} text The text to write to the file
function __docs_write_file(_filename, _text) {
	var _file = file_text_open_write(_filename);
	
	if (_file == -1) return;
	
	file_text_write_string(_file, _text);
	file_text_close(_file);
}