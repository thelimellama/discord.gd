# Class managing REST actions of the Discord API.
class_name DiscordRESTClient
extends Node

# Sets the authorization token of the bot
func set_token(token: String) -> void:
	_auth_header = "Authorization: Bot %s" % token

# Returns an [AuditLog] for the guild. Requires the `VIEW_AUDIT_LOG` permission.
func get_guild_audit_log(p_guild_id: String, params: GetGuildAuditLogParams) -> AuditLog:
	var data = yield(_send_request(ENDPOINTS.GUILD_AUDIT_LOGS % p_guild_id), "completed")
	if data is HTTPResponse and data.is_error():
		return data
	return AuditLog.new().from_dict(data)


# @hidden
const ENDPOINTS: Dictionary = {
	# Audit Log
	GUILD_AUDIT_LOGS = "/guilds/%s/audit-logs",
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
func _send_post_request(slug: String, payload: Dictionary):
	return _send_request(slug, payload, HTTPClient.METHOD_POST)


# @hidden
func _send_patch_request(slug: String, payload: Dictionary):
	return _send_request(slug, payload, HTTPClient.METHOD_PATCH)


# @hidden
func _send_delete_request(slug: String, payload: Dictionary):
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
