# Params for edit channel permissions
class_name EditChannelPermissionsParams extends DiscordDataclass

var type: int # [OverwriteTypes] 0 for a role or 1 for a member
var allow = null # [Permissions] The bitwise value of all allowed permissions (default 0) `optional`
var deny = null # [Permissions] The bitwise value of all disallowed permissions (default 0) `optional`


# @hidden
func _init().("EditChannelPermissionsParams"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("allow"):
		allow = Permissions.new(p_dict.allow)
	if p_dict.has("deny"):
		deny = Permissions.new(p_dict.deny)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_bitfield_to_int(dict, "allow", true)
	DiscordUtils.try_bitfield_to_int(dict, "deny", true)

	return dict
