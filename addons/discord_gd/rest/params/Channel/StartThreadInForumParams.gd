# Params for start thread in forum
class_name StartThreadInForumParams extends DiscordDataclass

var name: String # 1-100 character channel name
var message: ForumThreadMessageParams # [ForumThreadMessageParams] Contents of the first message in the forum thread
var auto_archive_duration = null # [int] Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080 `optional`
var rate_limit_per_user = null setget __set_rate_limit_per_user # [int] Amount of seconds a user has to wait before sending another message (0-21600) `optional`


# @hidden
func _init().("StartThreadInForumParams"): return self


func __set_rate_limit_per_user(p_rate_limit_per_user):
	__options__.set_props.rate_limit_per_user = true
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

	DiscordUtils.try_dataclass_to_dict(dict, "message")

	return dict
