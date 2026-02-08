/// Finalizes a group once you've finished adding items to it.
function docs_end_group() {
	if (!__docs_init.generating) return;
	
	var _instance = __docs_get_instance();
	_instance.end_group()
	
}