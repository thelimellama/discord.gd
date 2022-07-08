# Represents a modification for [ModifyGuildRolesParams]
class_name GuildRoleModification extends Dataclass

var id: String # Role id
var position = null # [int] Sorting position of the role


# @hidden
func _init().("GuildRoleModification", {include_null_in_dict = false}): return self
