extends Control

# Testing new stuff (Nothing much here)
var rest: DiscordRESTClient
func _ready() -> void:
	rest = DiscordRESTClient.new()
	add_child(rest)

	rest.set_token(Env.get_var("TOKEN"))
	var params = GetGuildAuditLogParams.new()
	params.user_id = "321233875776962560"
	var audit_log = yield(rest.get_guild_audit_log("369422519129604096", params), "completed")


	print(audit_log.to_dict())
	print("\n\n")
	print(audit_log)
	print("\n\n")
	print(audit_log.users[0].flags.to_array())
