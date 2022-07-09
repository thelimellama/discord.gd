# Represents a modification for [ModifyGuildChannelsParams]
class_name GuildChannelModification extends DiscordDataclass

var id: String # Channel id
var position = null setget __set_position # [int] Sorting position of the channel `nullable`
var lock_permissions = null setget __set_lock_permissions # [bool] Syncs the permission overwrites with the new parent, if moving to a new category `nullable`
var parent_id = null setget __set_parent_id # [String] New parent id for the channel that is moved `nullable`


# @hidden
func _init().("CreateGuildChannelParams"): return self


func __set_position(p_position):
	__options__.set_props.position = true
	position = p_position


func __set_lock_permissions(p_lock_permissions):
	__options__.set_props.lock_permissions = true
	lock_permissions = p_lock_permissions


func __set_parent_id(p_parent_id):
	__options__.set_props.parent_id = true
	parent_id = p_parent_id

