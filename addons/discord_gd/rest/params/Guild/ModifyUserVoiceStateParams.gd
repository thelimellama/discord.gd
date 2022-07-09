# Params for modify user voice state
class_name ModifyUserVoiceStateParams extends DiscordDataclass

var channel_id = null # [String] The id of the channel the user is currently in
var suppress = null # [bool] Toggles the user's suppress state `optional`


# @hidden
func _init().("ModifyUserVoiceStateParams"): return self
