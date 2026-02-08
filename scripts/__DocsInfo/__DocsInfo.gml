function __DocsInfo() constructor {
	style = [];
	
	// Configuration
	output = "";
	title = "";
	description = "";
	
	// Default style
	style[DOCS_STYLE.accent] = #019e5c;
	
	// Items
	root = new __DocsGroup(noone, "");
	current_group = root;
	
	// Methods
	static begin_group = function(_name) {
		current_group = new __DocsGroup(current_group, _name);
	}
	
	static end_group = function() {
		var _previous = current_group;
		
		current_group = current_group.parent;
		if (current_group == noone) {
			current_group = root;
		}
		
		add(_previous);
	}
	
	static add = function(_item) {
		array_push(current_group.items, _item);
	}
	
}