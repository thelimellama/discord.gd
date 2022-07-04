class_name DiscordRESTClient
extends Node

# Sets the authorization token of the bot
func set_token(token: String) -> void:
	_auth_header = "Authorization: Bot %s" % token

# @hidden
const ENDPOINTS: Dictionary = {
	# Clubs
	CLUBS = "/clubs/",
}

var _base_url: String
var _auth_header = ""
var _headers = [
	"User-Agent: DiscordBot (https://github.com/3ddelano/discord.gd Godot:%s)" % Engine.get_version_info()["string"]
]


func _init() -> void:
	pause_mode = PAUSE_MODE_PROCESS


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
func _send_request(slug: String, payload := {}, method := HTTPClient.METHOD_GET) -> HTTPResponse:
	var headers = _headers.duplicate(true)

	if not _auth_header == "":
		headers.append(_auth_header)

	if not payload.empty():
		headers.append("Content-Type: application/json; charset=UTF-8")

	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.call_deferred("request", _base_url + slug, headers, true, method, JSON.print(payload))

	var data = yield(http_request, "request_completed")
	http_request.queue_free()

	# Check for errors
	var res := HTTPResponse.new(data[0], data[1], data[2], data[3])

	if res.is_error() or res.is_no_content():
		# Got some error or 204
		return res

	var json = res.get_json()
	return json
