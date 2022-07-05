# Represents a Discord webhook
class_name Webhook extends Dataclass

var id: String # The id of the webhook
var type: int # [WebhookTypes] The type of the webhook
var guild_id = null # [String] The guild id this webhook is for, if any
var channel_id = null # [String] The channel id this webhook is for, if any
var user = null # [User] The user this webhook was created by (not returned when getting a webhook with its token)
var name = null # [String] The default name of the webhook
var avatar = null # [String] The default user avatar hash of the webhook
var token = null # [String] The secure token of the webhook (returned for Incoming Webhooks)
var application_id = null # [String] The bot/OAuth2 application that created this webhook
var source_guild = null # Partial [Guild] The guild of the channel that this webhook is following (returned for Channel Follower Webhooks)
var source_channel = null # Partial [Channel] the channel that this webhook is following (returned for Channel Follower Webhooks)
var url = null # String The url used for executing the webhook (returned by the webhooks OAuth2 flow)

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