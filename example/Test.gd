extends Control

# Testing new stuff (Nothing much here)
var rest: DiscordRESTClient


func _ready() -> void:
	_on_rerun_btn_pressed()
	$RerunBtn.connect("pressed", self, "_on_rerun_btn_pressed")


func _on_rerun_btn_pressed() -> void:
	rest = DiscordRESTClient.new()
	add_child(rest)
	rest.set_token(Env.get_var("TOKEN"))

#	var params_get_auditlog = GetGuildAuditLogParams.new()
#	params_get_auditlog.user_id = "321233875776962560"
#	params_get_auditlog.before = "993759739852886046"
#	params_get_auditlog.limit = 2
#	print(yield(rest.get_guild_audit_log("369422519129604096", params_get_auditlog), "completed"))



#	print(yield(rest.get_guild_auto_moderation_rules("330264450148073474"), "completed"))
#	print(yield(rest.get_guild_auto_moderation_rule("330264450148073474", "987209742638268477"), "completed"))

#	# Missing Access
#	var params_create_automod = CreateGuildAutoModerationRuleParams.new()
#	params_create_automod.name = "Test Rule 01"
#	params_create_automod.trigger_type = AutoModerationTriggerTypes.SPAM
#	params_create_automod.actions = [AutoModerationAction.new().from_dict({type = AutoModerationActionTypes.BLOCK_MESSAGE})]
#	print(params_create_automod.to_dict())
#	print(yield(rest.create_guild_auto_moderation_rule("330264450148073474", params_create_automod), "completed"))

#	var params_modify_automod = ModifyGuildAutoModerationRuleParams.new()
#	params_modify_automod.name = "Custom Keyword Rule"
#	print(yield(rest.modify_guild_auto_moderation_rule("330264450148073474", "993799349773541427", params_modify_automod), "completed"))

#	print(yield(rest.delete_guild_auto_moderation_rule("330264450148073474", "993834186785968240"), "completed"))



#	print(yield(rest.get_channel("330264450148073474"), "completed")) # GUILD_TEXT
#	print(yield(rest.get_channel("787562894509211659"), "completed")) # GUILD_CATEGORY
#	print(yield(rest.get_channel("330264450148073475"), "completed")) # GUILD_VOICE
#	print(yield(rest.get_channel("870140096307933215"), "completed")) # GUILD_PUBLIC_THREAD
#	print(yield(rest.get_channel("528466374104842270"), "completed")) # GUILD_NEWS
#	print(yield(rest.get_channel("993847090595766292"), "completed")) # GUILD_STAGE_VOICE

#	var params_modify_channel = ModifyChannelParams.new()
#	params_modify_channel.position = 3
#	params_modify_channel.name = "edited channel name"
#	print(yield(rest.modify_channel("993851377652609065", params_modify_channel), "completed"))

#	print(yield(rest.delete_channel("993851377652609065"), "completed"))

#	print(yield(rest.get_channel_messages("330264450148073474", {limit = 5}), "completed"))
#	print(yield(rest.get_channel_message("373108000900251650", "994289865455829102"), "completed")) # With components
	print(yield(rest.get_channel_message("453816730284851201", "994295386657259621"), "completed")) # With stickers
