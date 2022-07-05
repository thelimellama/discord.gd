extends Control

# Testing new stuff (Nothing much here)
var rest: DiscordRESTClient
func _ready() -> void:
	rest = DiscordRESTClient.new()
	add_child(rest)

	rest.set_token(Env.get_var("TOKEN"))
	var params = GetGuildAuditLogParams.new()
	params.user_id = "321233875776962560"
	print(params.to_dict())
	print(yield(rest.get_guild_audit_log("369422519129604096", params), "completed"))

#	var req = HTTPRequest.new()
#	add_child(req)
#
#	req.request("https://discord.com/api/v10/guilds/369422519129604096/audit-logs", [
#	"user-agent: DiscordBot (%s %s, Godot:%s)" % [DiscordMetadata.LIBRARY, DiscordMetadata.LIBRARY_URL, Engine.get_version_info()["string"]],
#	"accept: application/json"
#], true, HTTPClient.METHOD_GET)
#	var data = yield(req, "request_completed")
#	req.queue_free()
#
#	print(data)
