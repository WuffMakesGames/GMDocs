/// @return {Struct.__DocsInfo}
function __docs_get_instance() {
	if (__docs_init.generating) return __docs_init.INSTANCE;
}