function __docs_asset_path(_asset_type, _name) {
	var _root = filename_path(GM_project_filename);
	var _folder = "";
	var _extension = "";
	
	switch (_asset_type) {
		case DOCS_ASSET_TYPE.script: {
			if (script_exists(_name)) _name = script_get_name(_name);
			_folder = "scripts";
			_extension = "gml";
			break;
		}
		case DOCS_ASSET_TYPE.note: {
			_folder = "notes";
			_extension = "txt";
			break;
		}
	}
	
	return $"{_root}{_folder}/{_name}/{_name}.{_extension}";
}