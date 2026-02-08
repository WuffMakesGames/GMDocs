/// Starts a new group. All assets and files added to your docs after will be added to this group.
/// Finalize a group by calling `docs_end_group`.
/// @arg {string} name The title of the group.
/// @return {boolean} Whether or not the group was created.
function docs_begin_group(_name) {
	if (!__docs_init.generating) return false;
	
	var _instance = __docs_get_instance();
	_instance.begin_group(_name)
	
	return true;
}