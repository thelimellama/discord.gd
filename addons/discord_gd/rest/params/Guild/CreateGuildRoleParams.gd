# Params for create guild role
class_name CreateGuildRoleParams extends DiscordDataclass

var name = null # [String] Name of the role (default is "new role") `optional`
var permissions = null # [Permissions] Bitwise value of the enabled/disabled permissions (default is `@everyone` permissions in guild) `optional`
var color = null # [int] RGB color value (default is 0) `optional`
var hoist = null # [bool] Whether the role should be displayed separately in the sidebar (default is false) `optional`
var icon = null setget __set_icon # [String] The role's icon image (if the guild has the `ROLE_ICONS` feature) (Data URI scheme encoded) (default is null) `optional` `nullable
var unicode_emoji = null setget __set_unicode_emoji # [String] The role's unicode emoji as a standard emoji (if the guild has the `ROLE_ICONS` feature) (default is null) `optional` `nullable
var mentionable = null # [bool] Whether the role should be mentionable (default is false) `optional`


# @hidden
func _init().("CreateGuildRoleParams"): return self


func __set_icon(p_icon):
	__options__.set_props.icon = true
	icon = p_icon


func __set_unicode_emoji(p_unicode_emoji):
	__options__.set_props.unicode_emoji = true
	unicode_emoji = p_unicode_emoji


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permissions"):
		permissions = Permissions.new(p_dict.permissions)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_bitfield_to_int(dict, "permissions", true)

	return dict
