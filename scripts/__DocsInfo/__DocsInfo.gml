/// Generates a struct containing all the documentation items and information.
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
	
	// Methods =====================================
	
	/// Begins a new group.
	/// @arg {string} name
	static begin_group = function(_name) {
		current_group = new __DocsGroup(current_group, _name);
	}
	
	/// Finalizes the current group.
	static end_group = function() {
		var _previous = current_group;
		
		current_group = current_group.parent;
		if (current_group == noone) {
			current_group = root;
		}
		
		add(_previous);
	}
	
	/// Adds a DocsItem to the current group.
	/// @arg {Struct.__DocsItem} item
	static add = function(_item) {
		array_push(current_group.items, _item);
	}
	
}