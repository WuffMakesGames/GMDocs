/// Returns an array of DocsItems from a script.
/// @return {Array<Struct.__DocsItem>}
function  __docs_parse_script(_filename) {
	var _text = __docs_read_file(_filename);
	var _functions = []; // [ [name, pos], ... ]
	var _output = [];
	
	show_debug_message("");
	
	// Get functions from script
	var _search = "function";
	var _search_size = string_length(_search);
	
	var _pos = string_pos_ext(_search, _text, 0);
	var _pos_end = _pos + _search_size;
	var _name = "";
	
	while (_pos != 0) {
		var _skip = false;
		
		// Check it's not a mispelling like "functions" or "_function"
		var _trimcheck = string_trim(string_copy(_text, max(1, _pos-1), _pos == 1 ? _search_size+1 : _search_size+2));
		if (_trimcheck != _search) {
			
			// Double check that it's not just followed by "(" or being defined with "="
			if (string_starts_with(_trimcheck, _search + "(")) {
			} else if (string_starts_with(_trimcheck, "=" + _search) && (string_ends_with(_trimcheck, _search) || string_ends_with(_trimcheck, "("))) {
			} else {
				show_debug_message("skipped misspelling");
				_skip = true;
			}
		}
		
		// Make sure it's not a comment by moving backwards until we reach a newline or a comment
		var _check = _pos;
		while (!_skip && _check > 0) {
			if (string_char_at(_text, _check) == "\n") break;
			if (string_copy(_text, _check, 2) == "//") {
				show_debug_message("skipped comment");
				_skip = true;
			}
			_check -= 1;
		}
		
		// Skip this occurance
		if (_skip) {
			_pos = string_pos_ext(_search, _text, _pos+1);
			_pos_end = _pos + _search_size;
			continue;
		}
		
		// Check for name after function, or search for a method definition
		_name = string_trim(string_copy(_text, _pos_end, string_pos_ext("(", _text, _pos) - _pos_end));
		if (_name == "") {
			show_debug_message("method: " + _name);
			
		} else {
			show_debug_message("global: " + _name);
		}
		
		// Add function to list
		array_push(_functions, [_name, _pos]);
		
		// Next
		_pos = string_pos_ext(_search, _text, _pos+1);
		_pos_end = _pos + _search_size;
	}
	
	// Parse all functions
	for (var i = 0; i < array_length(_functions); i++) {
		
		// Get JSDOCS
		
	}
	
	return _output;
}