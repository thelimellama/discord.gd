# Params for get invite
class_name GetInviteParams extends Dataclass


var with_counts = null # [bool] Whether the invite should contain approximate member counts
var with_expiration = null # [bool] Whether the invite should contain the expiration date
var guild_scheduled_event_id = null # [String] The guild scheduled event to include with the invite


# @hidden
func _init().("GetInviteParams", {include_null_in_dict = false}): return self
