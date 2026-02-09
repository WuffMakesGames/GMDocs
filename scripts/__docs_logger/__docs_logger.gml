/// A static class for printing messages to the debug log.
/// Initialized by `__docs_init`.
function __docs_logger() {
	
	/// Prints a message to the debug log.
	static log = function() {
		var _message = [];
		for (var i = 0; i < argument_count; i++) {
			array_push(_message, argument[i]);
		}
		show_debug_message(string_join_ext(" ", _message));
	}
	
	/// Prints an error to the debug log.
	static error = function() {
		var _message = ["ERROR:"];
		for (var i = 0; i < argument_count; i++) {
			array_push(_message, argument[i]);
		}
		show_debug_message(string_join_ext(" ", _message));
	}
}