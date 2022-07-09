# Represents a Discord webhook
class_name Webhook extends DiscordDataclass

var id: String # The id of the webhook
var type: int # [WebhookTypes] The type of the webhook
var guild_id = null # [String] The guild id this webhook is for, if any `optional` `nullable`
var channel_id = null # [String] The channel id this webhook is for, if any `nullable`
var user = null # [User] The user this webhook was created by (not returned when getting a webhook with its token) `optional`
var name = null # [String] The default name of the webhook `nullable`
var avatar = null # [String] The default user avatar hash of the webhook `nullable`
var token = null # [String] The secure token of the webhook (returned for Incoming Webhooks) `optional`
var application_id = null # [String] The bot/OAuth2 application that created this webhook `nullable`
var source_guild = null # Partial [Guild] The guild of the channel that this webhook is following (returned for Channel Follower Webhooks) `optional`
var source_channel = null # Partial [Channel] the channel that this webhook is following (returned for Channel Follower Webhooks) `optional`
var url = null # String The url used for executing the webhook (returned by the webhooks OAuth2 flow) `optional`

# @hidden
func _init().("Webhook"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("user"):
		user = User.new().from_dict(p_dict.user)
	if p_dict.has("source_guild"):
		source_guild = Guild.new().from_dict(p_dict.source_guild)
	if p_dict.has("source_channel"):
		source_channel = Channel.new().from_dict(p_dict.source_channel)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "user")
	DiscordUtils.try_dataclass_to_dict(dict, "source_guild")
	DiscordUtils.try_dataclass_to_dict(dict, "source_channel")

	return dict
