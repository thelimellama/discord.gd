# Represents a modification for [ModifyGuildChannelsParams]
class_name GuildChannelModification extends Dataclass

var id: String # Channel id
var position = null # [int] Sorting position of the channel
var lock_permissions = null # [bool] Syncs the permission overwrites with the new parent, if moving to a new category
var parent_id = null # [String] New parent Id for the channel that is moved


# @hidden
func _init().("CreateGuildChannelParams", {include_null_in_dict = false}): return self
