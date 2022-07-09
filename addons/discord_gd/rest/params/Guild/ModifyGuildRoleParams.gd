# Params for modify guild role
class_name ModifyGuildRoleParams extends DiscordDataclass

var name = null setget __set_name # [String] Name of the role `optional` `nullable`
var permissions = null setget __set_permissions # [Permissions] Bitwise value of the enabled/disabled permissions `optional` `nullable`
var color = null setget __set_color # [int] RGB color value `optional` `nullable`
var hoist = null setget __set_hoist # [bool] Whether the role should be displayed separately in the sidebar `optional` `nullable`
var icon = null setget __set_icon # [String] The role's icon image (if the guild has the `ROLE_ICONS` feature) (Data URI scheme encoded) `optional` `nullable`
var unicode_emoji = null setget __set_unicode_emoji # [String] The role's unicode emoji as a standard emoji (if the guild has the `ROLE_ICONS` feature) `optional` `nullable`
var mentionable = null setget __set_mentionable # [bool] Whether the role should be mentionable `optional` `nullable`


# @hidden
func _init().("ModifyGuildRoleParams"): return self


func __set_name(p_name):
	__options__.set_props.name = true
	name = p_name


func __set_permissions(p_permissions):
	__options__.set_props.permissions = true
	permissions = p_permissions


func __set_color(p_color):
	__options__.set_props.color = true
	color = p_color


func __set_hoist(p_hoist):
	__options__.set_props.hoist = true
	hoist = p_hoist


func __set_icon(p_icon):
	__options__.set_props.icon = true
	icon = p_icon


func __set_unicode_emoji(p_unicode_emoji):
	__options__.set_props.unicode_emoji = true
	unicode_emoji = p_unicode_emoji


func __set_mentionable(p_mentionable):
	__options__.set_props.mentionable = true
	mentionable = p_mentionable

# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("permissions") and p_dict.permissions != null:
		permissions = Permissions.new(p_dict.permissions)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_bitfield_to_int(dict, "permissions", true)

	return dict
