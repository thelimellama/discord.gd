# Params for start thread with message
class_name StartThreadWithMessageParams extends DiscordDataclass

var name: String # 1-100 character channel name
var auto_archive_duration = null # [int] Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080 `optional`
var rate_limit_per_user = null setget __set_rate_limit_per_user # [int] Amount of seconds a user has to wait before sending another message (0-21600) `optional` `nullable`


# @hidden
func _init().("StartThreadWithMessageParams"): return self


func __set_rate_limit_per_user(p_rate_limit_per_user):
	__options__.set_props.rate_limit_per_user = true
	rate_limit_per_user = p_rate_limit_per_user
