# Params for create guild
class_name CreateGuildParams extends Dataclass

var name: String # Name of the guild (2-100 characters)
var icon = null # [String] 128x128 image for the guild icon (Data URI scheme encoded)
var verification_level = null # [GuildVerificationLevel] Verification level
var default_message_notifications = null # [DefaultMessageNotificationLevel] Default message notification level
var explicit_content_filter = null # [ExplicitContentFilterLevel] Explicit content filter level
var roles = null # [Array] of [Role] New guild roles
var channels = null # [Array] of partial [Channel] New guild's channels (name and type of channel)
var afk_channel_id = null # [String] Id for afk channel
var afk_timeout = null # [int] Afk timeout in seconds
var system_channel_id = null # [String] The id of the channel where guild notices such as welcome messages and boost events are posted
var system_channel_flags = null # [SystemChannelFlags] system channel flags


# @hidden
func _init().("CreateGuildParams", {include_null_in_dict = false}): return self


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

	return self

# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("roles") and dict.roles != null:
		for i in dict.roles.size():
			dict.roles[i] = dict.roles[i].to_dict()
	if dict.has("channels") and dict.channels != null:
		for i in dict.channels.size():
			dict.channels[i] = dict.channels[i].to_dict()

	return dict
