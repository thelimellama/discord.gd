# Represents a modification for [ModifyGuildRolesParams]
class_name GuildRoleModification extends DiscordDataclass

var id: String # Role id
var position = null setget __set_position # [int] Sorting position of the role `optional` `nullable`


# @hidden
func _init().("GuildRoleModification"): return self


func __set_position(p_position):
	__options__.set_props.position = true
	position = p_position
