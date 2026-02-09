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
	var _func_name = "";
	var _func_type = "function";
	
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
		
		// Check for name after function
		_func_name = string_trim(string_copy(_text, _pos_end, string_pos_ext("(", _text, _pos) - _pos_end));
		_func_type = "function";
		
		// Search for a method definition
		if (_func_name == "") {
			_func_type = "method";
			
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
			
			// Get name
			_func_name = string_trim(string_copy(_text, _checkpos, _checkpos_end - _checkpos));
		}
		
		// Add function to list
		if (_func_name != "") {
			array_push(_functions, {
				name: _func_name,
				type: _func_type,
				origin: _pos,
			});
		}
		
		// Next
		_pos = string_pos_ext(_search, _text, _pos+1);
	}
	
	// Parse all functions
	var _current_item = undefined;
	var _current_function;
	var _current_method;
	
	for (var i = 0; i < array_length(_functions); i++) {
		_current_function = _functions[i];
		_current_method = undefined;
		
		switch (_current_function.type) {
			case "function": {
				if (_current_item != undefined) array_push(_output, _current_item);
				_current_item = new __DocsItem(_current_function.name, _current_function.origin);
				
				break;
			}
			case "method": {
				_
				break;
			}
		}
		
		// Get JSDOCS
		
		// Get arguments
		
	}
	
	// No functions found, use old script definition
	if (array_length(_output) == 0) {
		_current_item = new __DocsItem(_name, 0);
		_current_item.jsdocs = __docs_parse_jsdocs(_text);
		array_push(_output, _current_item);
	}
	
	return _output;
}