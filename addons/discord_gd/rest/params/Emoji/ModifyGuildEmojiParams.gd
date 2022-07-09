# Params for modify guild emoji
class_name ModifyGuildEmojiParams extends DiscordDataclass


var name: String # Name of the emoji `optional`
var roles = null setget __set_roles # [Array] of [String] Ids of roles allowed to use this emoji `optional` `nullable`


# @hidden
func _init().("ModifyGuildEmojiParams"): return self


func __set_roles(p_roles):
	__options__.set_props.roles = true
	roles = p_roles
