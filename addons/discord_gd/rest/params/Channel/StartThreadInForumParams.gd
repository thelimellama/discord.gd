# Params for start thread in forum
class_name StartThreadInForumParams extends Dataclass

var name: String # 1-100 character channel name
var auto_archive_duration = null # [int] Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080
var rate_limit_per_user = null # [int] Amount of seconds a user has to wait before sending another message (0-21600)
var message: ForumThreadMessageParams # [ForumThreadMessageParams] Contents of the first message in the forum thread

var __set_props = {} # @hidden


# @hidden
func _init().("StartThreadInForumParams", {include_null_in_dict = false}): return self


func __set_rate_limit_per_user(p_rate_limit_per_user):
	__set_props.rate_limit_per_user = true
	rate_limit_per_user = p_rate_limit_per_user


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("message"):
		message = ForumThreadMessageParams.new().from_dict(p_dict.message)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()
	var set_props = __set_props.keys()
	for prop in set_props: dict[prop] = get(prop)
	dict = dict.duplicate(true)
	dict.erase("__set_props")

	if dict.has("message"):
		dict.message = dict.message.to_dict()

	return dict
