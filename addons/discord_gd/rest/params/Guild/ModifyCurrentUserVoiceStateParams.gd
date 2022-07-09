# Params for modify current user voice state
class_name ModifyCurrentUserVoiceStateParams extends DiscordDataclass

var channel_id = null # [String] The id of the channel the user is currently in
var suppress = null # [bool] Toggles the user's suppress state `optional`
var request_to_speak_timestamp = null setget __set_request_to_speak_timestamp # [String] Sets the user's request to speak `optional` `nullable`


# @hidden
func _init().("ModifyCurrentUserVoiceStateParams"): return self


func __set_request_to_speak_timestamp(p_request_to_speak_timestamp):
	__options__.set_props.request_to_speak_timestamp = true
	request_to_speak_timestamp = p_request_to_speak_timestamp
