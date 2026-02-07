function __docs_logger() {
	static log = function() {
		var _message = [];
		for (var i = 0; i < argument_count; i++) {
			array_push(_message, argument[i]);
		}
		show_debug_message(string_join_ext(" ", _message));
	}
	
	static error = function() {
		var _message = ["ERROR:"];
		for (var i = 0; i < argument_count; i++) {
			array_push(_message, argument[i]);
		}
		show_debug_message(string_join_ext(" ", _message));
	}
}