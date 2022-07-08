# Params for modify current user voice state
class_name ModifyCurrentUserVoiceStateParams extends Dataclass

var channel_id = null # [String] The id of the channel the user is currently in
var suppress = null # [bool] Toggles the user's suppress state
var request_to_speak_timestamp = null setget __set_request_to_speak_timestamp # [String] Sets the user's request to speak

var __set_props = {} # @hidden

# @hidden
func _init().("ModifyCurrentUserVoiceStateParams", {include_null_in_dict = false, print_exclude = ["__set_props"]}): return self


func __set_request_to_speak_timestamp(p_request_to_speak_timestamp):
	__set_props.request_to_speak_timestamp = true
	request_to_speak_timestamp = p_request_to_speak_timestamp


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()
	var set_props = __set_props.keys()
	for prop in set_props: dict[prop] = get(prop)
	dict = dict.duplicate(true)
	dict.erase("__set_props")

	return dict
