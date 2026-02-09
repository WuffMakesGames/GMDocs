/// Returns an array of DocsItems from a script.
/// @arg {string} filename The filepath to the script
/// @arg {string} name The name of the script
/// @return {Array<Struct.__DocsItem>}
function  __docs_parse_script(_filename, _name) {
	show_debug_message("");
	
	// Variables
	var _text = __docs_read_file(_filename);
	var _functions = []; // [ [name, pos], ... ]
	var _output = [];
	
	var _whitespace = [" ", "\t", "\n", "\v", "\f", "\r"];
	
	// Get functions from script
	var _search = "function";
	var _search_size = string_length(_search);
	
	var _pos = string_pos_ext(_search, _text, 0);
	var _name = "";
	
	var _skip, _trimcheck, _char;
	var _checkpos, _checkpos_end;
	var _pos_end;
	
	while (_pos != 0) {
		_pos_end = _pos + _search_size;
		_skip = false;
		
		// Check it's not a mispelling like "functions" or "_function"
		_trimcheck = string_trim(string_copy(_text, max(1, _pos-1), _pos == 1 ? _search_size+1 : _search_size+2));
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
		_checkpos = _pos;
		while (!_skip && _checkpos > 0) {
			if (string_char_at(_text, _checkpos) == "\n") break;
			if (string_copy(_text, _checkpos, 2) == "//") {
				show_debug_message("skipped comment");
				_skip = true;
			}
			_checkpos -= 1;
		}
		
		// Skip this occurance
		if (_skip) {
			_pos = string_pos_ext(_search, _text, _pos+1);
			continue;
		}
		
		// Check for name after function, or search for a method definition
		_name = string_trim(string_copy(_text, _pos_end, string_pos_ext("(", _text, _pos) - _pos_end));
		if (_name == "") {
			// TODO: Get name from methods
			// var name =function();
			
			// Find "=" and skip whitespace
			_char = " ";
			_checkpos = _pos-1;
			while (_checkpos > 0 && (_char == "=" || array_contains(_whitespace, _char))) {
				_char = string_char_at(_text, _checkpos);
				_checkpos -= 1;
			}
			
			// Move till we find starting whitespace
			_checkpos_end = _checkpos + 2;
			_checkpos -= 1;
			while (_checkpos > 0) {
				_char = string_char_at(_text, _checkpos);
				if (array_contains(_whitespace, _char)) break;
				_checkpos -= 1;
			}
			
			_name = string_trim(string_copy(_text, _checkpos, _checkpos_end - _checkpos));
			__docs_logger.log("method:", _name);
			
		} else {
			__docs_logger.log("global:", _name);
		}
		
		// Add function to list
		if (_name != "") {
			array_push(_functions, [_name, _pos]);
		}
		
		// Next
		_pos = string_pos_ext(_search, _text, _pos+1);
	}
	
	// Parse all functions
	for (var i = 0; i < array_length(_functions); i++) {
		
		// Get JSDOCS
		
		// Get arguments
		
	}
	
	return _output;
}