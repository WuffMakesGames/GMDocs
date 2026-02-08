/// Sets several configuration values for GMDocs.
/// @arg {string} output The path GMDocs will output your documentation to.
/// @arg {string} name The title for your documentation.
/// @arg {string} description A short description for your documentation.
function docs_config(_output, _name, _description) {
	if (!__docs_init.generating) return;
	
	var _instance = __docs_get_instance();
	_instance.output = _output;
	_instance.title = _name;
	_instance.description = _description;
	
}