# Params for edit channel permissions
class_name EditChannelPermissionsParams extends Dataclass

var type: int # [OverwriteTypes] 0 for a role or 1 for a member
var allow = null # [Permissions] The bitwise value of all allowed permissions (default 0)
var deny = null # [Permissions] The bitwise value of all disallowed permissions (default 0)


# @hidden
func _init().("EditChannelPermissionsParams", {include_null_in_dict = false}): return self


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
	var dict = .to_dict().duplicate(true)

	if dict.has("allow"):
		dict.allow = str(dict.allow.bitfield)
	if dict.has("deny"):
		dict.deny = str(dict.deny.bitfield)

	return dict
