# Represents a Discord voice state
class_name VoiceState extends DiscordDataclass

var guild_id = null # [String] The guild id this voice state is for `optional`
var channel_id = null # [String] The channel id this user is connected to `nullable`
var user_id: String # The user id this voice state is for
var member = null # [GuildMember] The guild member this voice state is for `optional`
var session_id: String # The session id for this voice state
var deaf: bool # Whether this user is deafened by the server
var mute: bool # Whether this user is muted by the server
var self_deaf: bool # Whether this user is locally deafened
var self_mute: bool # Whether this user is locally muted
var self_stream = null # [bool] Whether this user is streaming using "Go Live" `optional`
var self_video: bool # Whether this user's camera is enabled
var suppress: bool # Whether this user is muted by the current user
var request_to_speak_timestamp = null # [String] The time at which the user requested to speak `nullable`

# @hidden
func _init().("VoiceState"): return self

# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("member"):
		member = GuildMember.new().from_dict(p_dict.member)

	return self


# @hidden
func to_dict() ->Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "member")

	return dict
