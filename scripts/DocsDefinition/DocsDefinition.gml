// Your documentation goes here
// ==========================================================

// System
docs_style(DOCS_STYLE.accent, "#bd45de");
docs_config(
	"GMDocs", 
	"Create documentation with ease."
);

// Home
docs_category("");
	docs_set_homepage("docsHomepage");

// Getting started
docs_category("Getting Started");
	docs_group("Setup Docs")
	docs_add_note("docsSetup")
	
	docs_group("Setup Page")
	docs_add_note("docsSetupPage")

// API
docs_category("API Reference");
	docs_group("Documentation");
	docs_add_script(docs_set_homepage);
	docs_add_script(docs_category);
	docs_add_script(docs_group);
	docs_add_script(docs_add_script);
	docs_add_script(docs_add_note);
	docs_add_script(docs_add_file);
	
	docs_group("System");
	docs_add_script(docs_style);
	docs_add_script(docs_config);

// Guides
docs_category("Guides");
	docs_group("Styling");
