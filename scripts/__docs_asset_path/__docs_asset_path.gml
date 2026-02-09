/// @arg {Enum.DOCS_ASSET_TYPE} asset_type The type of asset to find the path for
/// @arg {string} name The name of the asset
/// @return {string} The filepath to the asset
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