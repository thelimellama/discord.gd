# Params for modify user voice state
class_name ModifyUserVoiceStateParams extends Dataclass

var channel_id = null # [String] The id of the channel the user is currently in
var suppress = null # [bool] Toggles the user's suppress state


# @hidden
func _init().("ModifyUserVoiceStateParams", {include_null_in_dict = false}): return self
