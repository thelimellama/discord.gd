# Class managing REST actions of the Discord API.
class_name DiscordRESTClient
extends Node


# Sets the authorization token of the bot
func set_token(token: String) -> void:
	_auth_header = "Authorization: Bot %s" % token


#! ----------
#! AuditLog
#! ----------


# Get the audit logs for the given guild. Requires the `VIEW_AUDIT_LOG` permission
# @returns [AuditLog] | [HTTPResponse] if error
func get_guild_audit_log(p_guild_id: String, params: GetGuildAuditLogParams) -> AuditLog:
	var endpoint = ENDPOINTS.GUILD_AUDIT_LOGS % p_guild_id
	var query_string = DiscordUtils.query_string_from_dict(params.to_dict())
	if query_string:
		endpoint += "?" + query_string

	var data = yield(_send_request(endpoint), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AuditLog.new().from_dict(data)


#! ----------
#! AutoModeration
#! ----------


# Get a list of auto moderation rules for the given guild. Requires the `MANAGE_GUILD` permission
# @returns [Array] of [AutoModerationRule] | [HTTPResponse] if error
func get_guild_auto_moderation_rules(p_guild_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULES % p_guild_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	var ret = []
	for elm in data:
		ret.append(AutoModerationRule.new().from_dict(elm))
	return ret


# Get a single auto moderation rule. Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func get_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String) -> Array:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id]), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Creates a new auto moderation rule. Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func create_guild_auto_moderation_rule(p_guild_id: String, params: CreateGuildAutoModerationRuleParams) -> AutoModerationRule:
	var data = yield(_send_post_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULES % p_guild_id, params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Modify an existing auto moderation rule. Requires the `MANAGE_GUILD` permission
# @returns [AutoModerationRule] | [HTTPResponse] if error
func modify_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String, params: ModifyGuildAutoModerationRuleParams) -> AutoModerationRule:
	var data = yield(_send_patch_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id], params.to_dict()), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AutoModerationRule.new().from_dict(data)


# Deletes an existing auto moderation rule. Requires the `MANAGE_GUILD` permission
# @returns bool | [HTTPResponse] if error
func delete_guild_auto_moderation_rule(p_guild_id: String, p_rule_id: String) -> bool:
	var data = yield(_send_delete_request(ENDPOINTS.GUILD_AUTO_MODERATION_RULE % [p_guild_id, p_rule_id]), "completed")
	if data is HTTPResponse:
		if data.is_error():
			return data
		return data.is_no_content()
	return false



# @hidden
const ENDPOINTS: Dictionary = {
	# AuditLog
	GUILD_AUDIT_LOGS = "/guilds/%s/audit-logs",

	# AutoModeration
	GUILD_AUTO_MODERATION_RULES = "/guilds/%s/auto-moderation/rules",
	GUILD_AUTO_MODERATION_RULE = "/guilds/%s/auto-moderation/rules/%s",
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
	if payload != null and not payload.empty():
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
