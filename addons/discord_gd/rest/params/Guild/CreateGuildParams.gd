# Params for create guild
class_name CreateGuildParams extends DiscordDataclass

var name: String # Name of the guild (2-100 characters)
var icon = null # [String] 128x128 image for the guild icon (Data URI scheme encoded) `optional`
var verification_level = null # [GuildVerificationLevel] Verification level `optional`
var default_message_notifications = null # [DefaultMessageNotificationLevel] Default message notification level `optional`
var explicit_content_filter = null # [ExplicitContentFilterLevel] Explicit content filter level `optional`
var roles = null # [Array] of [Role] New guild roles `optional`
var channels = null # [Array] of partial [Channel] New guild's channels (name and type of channel) `optional`
var afk_channel_id = null # [String] Id for afk channel `optional`
var afk_timeout = null # [int] Afk timeout in seconds `optional`
var system_channel_id = null # [String] The id of the channel where guild notices such as welcome messages and boost events are posted `optional`
var system_channel_flags = null # [SystemChannelFlags] system channel flags `optional`


# @hidden
func _init().("CreateGuildParams"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("roles"):
		roles = []
		for data in p_dict.roles:
			roles.append(Role.new().from_dict(data))
	if p_dict.has("channels"):
		channels = []
		for data in p_dict.channels:
			channels.append(Channel.new().from_dict(data))
	if p_dict.has("system_channel_flags"):
		system_channel_flags = SystemChannelFlags.new(p_dict.system_channel_flags)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_array_dataclass_to_dict(dict, "roles")
	DiscordUtils.try_array_dataclass_to_dict(dict, "channels")
	DiscordUtils.try_bitfield_to_int(dict, "system_channel_flags")

	return dict
