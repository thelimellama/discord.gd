# Params for start thread
class_name StartThreadParams extends DiscordDataclass

var name: String # 1-100 character channel name
var auto_archive_duration = null # [int] Duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080 `optional`
var type = null # [ChannelTypes] The type of thread to create (default is `GUILD_PRIVATE_THREAD`) `optional`
var invitable = null # [bool] Whether non-moderators can add other non-moderators to a thread; only available when creating a private thread `optional`
var rate_limit_per_user = null setget __set_rate_limit_per_user # [int] Amount of seconds a user has to wait before sending another message (0-21600) `optional` `nullable`


# @hidden
func _init().("StartThreadParams"): return self


func __set_rate_limit_per_user(p_rate_limit_per_user):
	__options__.set_props.rate_limit_per_user = true
	rate_limit_per_user = p_rate_limit_per_user
