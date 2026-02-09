function __DocsItem(_name, _origin=0) constructor {
	
	/// The name of the item.
	name = _name;
	
	/// Starting character for the item as found in the file it was parsed from.
	origin = 0;
	
	/// Raw text to fill the item.
	body = "";
	
	/// JSDoc flags (arg, desc, etc).
	/// @arg {Array<String>} jsdocs
	jsdocs = [];
	
	/// Submethods of the item.
	/// @arg {Array<Struct.__DocsItem>} jsdocs
	methods = [];
	
}