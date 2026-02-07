__docs_init();

function __docs_init() {
	static generating = false;
	static INSTANCE = new __DocsInfo();
	
	if (GM_is_sandboxed) {
		show_debug_message("GMDocs Error! Cannot generate documentation in sandboxed mode!")
		return;
	}
	
	if (GM_build_type == "run") {
		generating = true;
		
		__docs_logger();
		
		__docs_logger.log("============================================");
		script_execute(DocsDefinition);
		__docs_logger.log("============================================");
		
		__docs_build();
		
		generating = false;
	}
}
