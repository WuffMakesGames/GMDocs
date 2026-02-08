/// Sets the homepage for your documentation website.
/// Should be formatted using markdown.
/// @arg {string} note_or_file The name of a note in the ide or the path to a file.
function docs_set_homepage(_note_or_file) {
	if (!__docs_init.generating) return;
	__docs_logger.log("Setting homepage:", _note_or_file);

}