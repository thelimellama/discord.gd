# Represents a Discord thread member
class_name ThreadMember extends DiscordDataclass

var id = null # [String] The id of the thread `optional`
var user_id = null # [String] The id of the user `optional`
var join_timestamp: String # The time the current user last joined the thread
var flags: int # Any user-thread settings, currently only used for notifications

var muted = null # [bool] (Undocumented) `optional`
var mute_config = null # (Undocumented) `optional`

var guild_id = null # [String] Only sent in the `THREAD_MEMBER_UPDATE` event `optional`

# @hidden
func _init().("ThreadMember"): return self
