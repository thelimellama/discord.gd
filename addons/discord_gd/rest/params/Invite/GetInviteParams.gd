# Params for get invite
class_name GetInviteParams extends DiscordDataclass


var with_counts = null # [bool] Whether the invite should contain approximate member counts `optional`
var with_expiration = null # [bool] Whether the invite should contain the expiration date `optional`
var guild_scheduled_event_id = null # [String] The guild scheduled event to include with the invite `optional`


# @hidden
func _init().("GetInviteParams"): return self
