/// @return {string}
function __docs_read_file(_filename) {
	var _buffer = buffer_load(_filename);
	var _text = buffer_read(_buffer, buffer_text);
	
	buffer_delete(_buffer);
	return _text;
}