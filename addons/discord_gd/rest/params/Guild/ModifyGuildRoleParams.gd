# Params for modify guild role
class_name ModifyGuildRoleParams extends Dataclass

var name = null # [String] Name of the role
var permissions = null # [Permissions] Bitwise value of the enabled/disabled permissions
var color = null # [int] RGB color value
var hoist = null # [bool] Whether the role should be displayed separately in the sidebar
var icon = null # [String] The role's icon image (if the guild has the `ROLE_ICONS` feature) (Data URI scheme encoded)
var unicode_emoji = null # [String] The role's unicode emoji as a standard emoji (if the guild has the `ROLE_ICONS` feature)
var mentionable = null # [bool] Whether the role should be mentionable


# @hidden
func _init().("ModifyGuildRoleParams", {include_null_in_dict = true}): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permissions") and p_dict.permissions != null:
		permissions = Permissions.new(p_dict.permissions)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("permissions") and dict.permissions != null:
		dict.permissions = str(dict.permissions.bitfield)

	return dict
