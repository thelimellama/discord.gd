# Class managing REST actions of the Discord API.
class_name DiscordRESTClient
extends Node


# Sets the authorization token of the bot
func set_token(token: String) -> void:
	_auth_header = "Authorization: Bot %s" % token


#! ----------
#! AuditLog
#! ----------


# Get the audit logs for the given guild
#
# Requires the `VIEW_AUDIT_LOG` permission
# @returns [AuditLog] | [HTTPResponse] if error
func get_guild_audit_log(p_guild_id: String, p_params = {}) -> AuditLog:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetGuildAuditLogParams.new().from_dict(p_params)
	elif not p_params is GetGuildAuditLogParams:
		DiscordUtils.perror("Discord.gd:get_guild_audit_log:params must be a Dictionary or GetGuildAuditLogParams")

	var endpoint = ENDPOINTS.GUILD_AUDIT_LOGS % p_guild_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string:
		endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AuditLog.new().from_dict(data)


#! ----------
#! AutoModeration
#! ----------


# Get a list of auto moderation rules for the given guild
#
# Requires the `MANAGE_GUILD` permission
# @returns [Array] of [AutoModerationRule] | [HTTPResponse] if error
func get_guild_auto_moderation_rules(p_guild_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULES % p_guild_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(AutoModerationRule.new().from_dict(elm))
	return ret


# Get a single auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func get_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Creates a new auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func create_guild_auto_moderation_rule(p_guild_id: String, p_params = {}) -> AutoModerationRule:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = CreateGuildAutoModerationRuleParams.new().from_dict(p_params)
	elif not p_params is CreateGuildAutoModerationRuleParams:
		DiscordUtils.perror("Discord.gd:create_guild_auto_moderation_rule:params must be a Dictionary or CreateGuildAutoModerationRuleParams")
	var data = yield(_send_post_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULES % p_guild_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Modify an existing auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func modify_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String, p_params = {}) -> AutoModerationRule:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = ModifyGuildAutoModerationRuleParams.new().from_dict(p_params)
	elif not p_params is ModifyGuildAutoModerationRuleParams:
		DiscordUtils.perror("Discord.gd:modify_guild_auto_moderation_rule:params must be a Dictionary or ModifyGuildAutoModerationRuleParams")
	var data = yield(_send_patch_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id], p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Deletes an existing auto moderation rule
#
# Requires the `MANAGE_GUILD` permission
# @returns [bool] | [HTTPResponse] if error
func delete_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false


#! ----------
#! Channel
#! ----------


# Get a channel.
#
# If the channel is a thread, a [ThreadMember] object is included in the returned result.
# @returns [Channel] | [HTTPResponse] if error
func get_channel(p_channel_id: String) -> Channel:
	var data = yield(_send_request(ENDPOINTS.CHANNEL % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Modify a channel's settings
# @returns [Channel] | [HTTPResponse] if error
func modify_channel(p_channel_id: String, p_params = {}) -> Channel:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = ModifyChannelParams.new().from_dict(p_params)
	elif not p_params is ModifyChannelParams:
		DiscordUtils.perror("Discord.gd:modify_channel:params must be a Dictionary or ModifyChannelParams")
	var data = yield(_send_patch_request(ENDPOINTS.CHANNEL % p_channel_id, p_params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Delete a channel, or close a private message
#
# Requires the `MANAGE_CHANNELS` permission for the guild, or `MANAGE_THREADS` if the channel is a thread
# @returns [Channel] | [HTTPResponse] if error
func delete_channel(p_channel_id: String) -> Channel:
	var data = yield(_send_delete_request(ENDPOINTS.CHANNEL % p_channel_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return Channel.new().from_dict(data)


# Get the messages for a channel
#
# If operating on a guild channel, this endpoint requires the `VIEW_CHANNEL` permission to be present on the current user. If the current user is missing the `READ_MESSAGE_HISTORY` permission in the channel then this will return no messages (since they cannot read the message history)
# @returns [Array] of [Message] | [HTTPResponse] if error
func get_channel_messages(p_channel_id: String, p_params = {}) -> Array:
	if typeof(p_params) == TYPE_DICTIONARY:
		p_params = GetChannelMessagesParams.new().from_dict(p_params)
	elif not p_params is GetChannelMessagesParams:
		DiscordUtils.perror("Discord.gd:get_channel_messages:params must be a Dictionary or GetChannelMessagesParams")

	var endpoint = ENDPOINTS.CHANNEL_MESSAGES % p_channel_id
	var query_string = DiscordUtils.query_string_from_dict(p_params.to_dict())
	if query_string:
		endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(Message.new().from_dict(elm))
	return ret


# Get a specifc message in a channel
#
# If operating on a guild channel, this endpoint requires the `READ_MESSAGE_HISTORY` permission to be present on the current user
# @returns [Array] of [Message] | [HTTPResponse] if error
func get_channel_message(p_channel_id: String, p_message_id: String) -> Message:
	var data = yield(_send_request(ENDPOINTS.CHANNEL_MESSAGE % [p_channel_id, p_message_id]), "completed")
	print(JSON.print(data, " ", true), "\n")
	if data is HTTPResponse and data.is_error():
		return data
	return Message.new().from_dict(data)


# @hidden
const ENDPOINTS: Dictionary = {
	# AuditLog
	GUILD_AUDIT_LOGS = "/guilds/%s/audit-logs",

	# AutoModeration
	GUILD_AUTO_MODERATION_RULES = "/guilds/%s/auto-moderation/rules",
	GUILD_AUTO_MODERATION_RULE = "/guilds/%s/auto-moderation/rules/%s",

	# Channel
	CHANNEL = "/channels/%s",
	CHANNEL_MESSAGES = "/channels/%s/messages",
	CHANNEL_MESSAGE = "/channels/%s/messages/%s",
	CHANNEL_MESSAGE_CROSSPOST = "/channels/%s/messages/%s/crosspost",
	CHANNEL_MESSAGES_BULKDELETE = "/channels/%s/messages/bulk-delete",

	REACTIONS = "/channels/%s/messages/%s/reactions",
	REACTIONS_EMOJI = "/channels/%s/messages/%s/reactions/%s",
	REACTIONS_EMOJI_USER = "/channels/%s/messages/%s/reactions/%s/%s",
	REACTIONS_EMOJI_ME = "/channels/%s/messages/%s/reactions/%s/@me",

	CHANNEL_PERMISSION = "/channels/%s/permissions/%s",

	CHANNEL_INVITES = "/channels/%s/invites",

	CHANNEL_FOLLOWERS = "/channels/%s/followers",

	CHANNEL_TYPING = "/channels/%s/typing",

	CHANNEL_PINS = "/channels/%s/pins",
	CHANNEL_PIN = "/channels/%s/pins/%s",

	CHANNEL_RECIPIENT = "/channels/%s/recipients/%s",

	CHANNEL_THREADS = "/channels/%s/threads",
	CHANNEL_MESSAGE_THREADS = "/channels/%s/messages/%s/threads",

	CHANNEL_THREADMEMBERS = "/channels/%s/thread-members",
	CHANNEL_THREADMEMBERS_USER = "/channels/%s/thread-members/%s",
	CHANNEL_THREADMEMBERS_ME = "/channels/%s/thread-members/@me",
	CHANNEL_THREADS_ARCHIVED_PUBLIC = "/channels/%s/threads/archived/public",
	CHANNEL_THREADS_ARCHIVED_PRIVATE = "/channels/%s/threads/archived/private",
	CHANNEL_ME_THREADS_ARCHIVED_PRIVATE = "/channels/%s/users/@me/threads/archived/private",
}

var _base_url: String
var _auth_header = ""
var _headers = [
	"user-agent: DiscordBot (%s %s, Godot:%s)" % [DiscordMetadata.LIBRARY, DiscordMetadata.LIBRARY_URL, Engine.get_version_info()["string"]],
	"accept: application/json"
]


# @hidden
func _init() -> void:
	pause_mode = PAUSE_MODE_PROCESS
	_base_url = DiscordMetadata.REST_URL % DiscordMetadata.REST_VERSION


# @hidden
func get_class():
	return "DiscordRESTClient"


func _to_string() -> String:
	return "[%s:%d]" % [get_class(), get_instance_id()]


# @hidden
func _send_post_request(slug: String, payload = {}):
	return _send_request(slug, payload, HTTPClient.METHOD_POST)


# @hidden
func _send_patch_request(slug: String, payload = {}):
	return _send_request(slug, payload, HTTPClient.METHOD_PATCH)


# @hidden
func _send_delete_request(slug: String, payload = null):
	return _send_request(slug, payload, HTTPClient.METHOD_DELETE)


# @hidden
func _send_request(slug: String, payload = null, method := HTTPClient.METHOD_GET) -> HTTPResponse:
	var headers = _headers.duplicate(true)

	if not _auth_header == "":
		headers.append(_auth_header)

	var http_request = HTTPRequest.new()
	add_child(http_request)

	var request_string = ""
	if payload != null:
		headers.append("content-type: application/json")
		request_string = JSON.print(payload)
	http_request.call_deferred("request", _base_url + slug, headers, true, method, request_string)

	var data = yield(http_request, "request_completed")
	http_request.queue_free()

	# Check for errors
	var res := HTTPResponse.new(data[0], data[1], data[2], data[3])

	if res.is_error() or res.is_no_content():
		# Got some error or 204
		return res

	var json = res.get_json()
	return json
