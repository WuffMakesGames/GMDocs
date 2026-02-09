// Your documentation goes here
// ==========================================================

docs_add_script(__DocsInfo);
docs_add_script(__docs_logger);
return;

// System =======================================
docs_set_homepage("docsHomepage");

docs_style(DOCS_STYLE.accent, "#bd45de");
docs_config(
	"docs/",
	"GMDocs", 
	"Create documentation with ease."
);

// Getting started ==============================
if (docs_begin_group("Getting Started")) {
	docs_add_note("docsSetup");
	docs_add_note("docsSetupPage");
	docs_end_group();
}

// API ==========================================
if (docs_begin_group("API Reference")) {
	if (docs_begin_group("Documentation")) {
		docs_add_script(docs_set_homepage);
		docs_add_script(docs_begin_group);
		docs_add_script(docs_end_group);
		docs_add_script(docs_add_script);
		docs_add_script(docs_add_note);
		docs_add_script(docs_add_file);
		docs_end_group();
	}
	
	if (docs_begin_group("System")) {
		docs_add_script(docs_style);
		docs_add_script(docs_config);
		docs_end_group();
	}
	
	if (docs_begin_group("Internal API")) {
		if (docs_begin_group("Constructors")) {
			docs_add_script(__DocsInfo);
			docs_add_script(__DocsGroup);
			docs_add_script(__DocsItem);
			docs_end_group();
		}
		
		if (docs_begin_group("Main")) {
			docs_add_script(__docs_build);
			docs_add_script(__docs_init);
			docs_end_group();
		}
		
		if (docs_begin_group("Misc")) {
			docs_add_script(__docs_asset_path);
			docs_add_script(__docs_get_instance);
			docs_add_script(__docs_logger);
			docs_add_script(__docs_read_file);
			docs_add_script(__docs_write_file);
			docs_end_group();
		}
		
		if (docs_begin_group("Parsing")) {
			docs_add_script(__docs_parse_file);
			docs_add_script(__docs_parse_note);
			docs_add_script(__docs_parse_script);
			docs_end_group();
		}
		
	}
	
	docs_end_group();
}

// Guides =======================================
if (docs_begin_group("Guides")) {
	docs_begin_group("Styling");
	docs_end_group();
}
