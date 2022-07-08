extends Control

# Testing new stuff (Nothing much here)
var rest: DiscordRESTClient

onready var logs = $VB/MC/Logs


func _ready() -> void:
	_on_rerun_btn_pressed()
	$VB/RerunBtn.connect("pressed", self, "_on_rerun_btn_pressed")


func Print(var1, var2 = null, var3 = null):
	var s = str(var1)
	if var2 != null: s += str(var2)
	if var3 != null: s += str(var3)
	logs.text += s + "\n"
	print(s)


func _on_rerun_btn_pressed() -> void:
	Print("\n---------------\nRunning\n---------------\n")
	rest = DiscordRESTClient.new()
	add_child(rest)
	rest.set_token(Env.get_var("TOKEN"))

#	var params_get_auditlog = GetGuildAuditLogParams.new()
#	params_get_auditlog.user_id = "321233875776962560"
#	params_get_auditlog.before = "993759739852886046"
#	params_get_auditlog.limit = 2
#	Print(yield(rest.get_guild_audit_log("369422519129604096", params_get_auditlog), "completed"))



#	Print(yield(rest.get_guild_auto_moderation_rules("330264450148073474"), "completed"))
#	Print(yield(rest.get_guild_auto_moderation_rule("330264450148073474", "987209742638268477"), "completed"))

#	# Missing Access
#	var params_create_automod = CreateGuildAutoModerationRuleParams.new()
#	params_create_automod.name = "Test Rule 01"
#	params_create_automod.trigger_type = AutoModerationTriggerTypes.SPAM
#	params_create_automod.actions = [AutoModerationAction.new().from_dict({type = AutoModerationActionTypes.BLOCK_MESSAGE})]
#	Print(params_create_automod.to_dict())
#	Print(yield(rest.create_guild_auto_moderation_rule("330264450148073474", params_create_automod), "completed"))

#	var params_modify_automod = ModifyGuildAutoModerationRuleParams.new()
#	params_modify_automod.name = "Custom Keyword Rule"
#	Print(yield(rest.modify_guild_auto_moderation_rule("330264450148073474", "993799349773541427", params_modify_automod), "completed"))

#	Print(yield(rest.delete_guild_auto_moderation_rule("330264450148073474", "993834186785968240"), "completed"))



#	Print(yield(rest.get_channel("330264450148073474"), "completed")) # GUILD_TEXT
#	Print(yield(rest.get_channel("787562894509211659"), "completed")) # GUILD_CATEGORY
#	Print(yield(rest.get_channel("330264450148073475"), "completed")) # GUILD_VOICE
#	Print(yield(rest.get_channel("870140096307933215"), "completed")) # GUILD_PUBLIC_THREAD
#	Print(yield(rest.get_channel("528466374104842270"), "completed")) # GUILD_NEWS
#	Print(yield(rest.get_channel("993847090595766292"), "completed")) # GUILD_STAGE_VOICE

#	var params_modify_channel = ModifyChannelParams.new()
#	params_modify_channel.position = 3
#	params_modify_channel.name = "edited channel name"
#	Print(yield(rest.modify_channel("993851377652609065", params_modify_channel), "completed"))

#	Print(yield(rest.delete_channel("993851377652609065"), "completed"))

#	Print(yield(rest.get_channel_messages("330264450148073474", {limit = 5}), "completed"))
#	Print(yield(rest.get_channel_message("373108000900251650", "994289865455829102"), "completed")) # With components
#	Print(yield(rest.get_channel_message("453816730284851201", "994295386657259621"), "completed")) # With stickers
#	var params_create_message = CreateMessageParams.new()
#	params_create_message.content = "hey @here"
#	var embed = Embed.new().from_dict({title = "Embed Title", description = "Embed Description"})
#	embed.fields = [EmbedField.new().from_dict({ name = "Field 1", value = "Value 1"}),
#					EmbedField.new().from_dict({ name = "Field 2", value = "Value 2", inline = true}),
#					EmbedField.new().from_dict({ name = "Field 3", value = "Value 3", inline = true})]
#	params_create_message.embeds = [embed]
#	Print(yield(rest.create_message("369423865618628608", params_create_message), "completed"))

#	Print(yield(rest.crosspost_message("994518610028548127", "994519585246162984"), "completed"))
#	Print(yield(rest.edit_message("369423865618628608", "994547930046418954", {
#		content = null, # Removes the message content
#		embeds = [Embed.new().from_dict({title = "title", description = "he desc"}).to_dict()]
#	}), "completed"))
#	Print(yield(rest.delete_message("369423865618628608", "994552474205687858"), "completed"))
#	Print(yield(rest.delete_messages("369423865618628608", ["994556339059707945", "994556341026828338", "994556343023304704"]), "completed"))

#	Print(yield(rest.edit_channel_permissions("994558391118745681", "734040758373318708", {
#		type = 1,#OverwriteTypes.MEMBER,
#		allow = Permissions.new().add(Permissions.FLAGS.SEND_MESSAGES)
#	}), "completed"))

#	Print(yield(rest.get_channel_invites("994558391118745681"), "completed"))
#	Print(yield(rest.create_channel_invite("994558391118745681"), "completed"))
#	Print(yield(rest.create_channel_invite("994558391118745681", {max_age = 5}), "completed"))

#	Print(yield(rest.create_reaction("453816730284851201", "994521176061792306", "BrokeBack:514070728119681046"), "completed"))
#	Print(yield(rest.delete_own_reaction("453816730284851201", "994521176061792306", "BrokeBack:514070728119681046"), "completed"))
#	Print(yield(rest.delete_user_reaction("453816730284851201", "994521176061792306", "BrokeBack:514070728119681046", "321233875776962560"), "completed"))
#	Print(yield(rest.get_reactions("453816730284851201", "994521176061792306", "BrokeBack:514070728119681046"), "completed"))
#	Print(yield(rest.get_reactions("453816730284851201", "994521176061792306", "BrokeBack:514070728119681046", {limit = 1}), "completed"))
#	Print(yield(rest.delete_reactions("453816730284851201", "994295386657259621"), "completed"))
#	Print(yield(rest.delete_reactions("453816730284851201", "994521176061792306", "BrokeBack:514070728119681046"), "completed"))

#	Print(yield(rest.follow_news_channel("994518610028548127", "994558391118745681"), "completed"))

#	Print(yield(rest.trigger_typing("994558391118745681"), "completed"))

#	Print(yield(rest.get_pinned_messages("369423865618628608"), "completed"))
#	Print(yield(rest.pin_message("369423865618628608", "994547930046418954"), "completed"))
#	Print(yield(rest.unpin_message("369423865618628608", "994547930046418954"), "completed"))

	# TODO: test add/remove group dm recipient
#	Print(yield(rest.group_dm_add_recipient("", "", {}), "completed"))
#	Print(yield(rest.group_dm_remove_recipient("", ""), "completed"))

#	Print(yield(rest.start_thread_from_message("369423865618628608", "994612045121081414", {name = "Test Thread From Message"}), "completed"))
#	Print(yield(rest.start_thread("369423865618628608", {name = "Test Thread", auto_archive_duration = 1440, invitable = true, type = ChannelTypes.GUILD_PUBLIC_THREAD}), "completed"))
#	Print(yield(rest.start_thread_in_forum("369423865618628608", {name = "My thread", message = {content = "Message content"}}), "completed")) # TODO: test this when forums release to public

#	Print(yield(rest.get_thread_members("994824485058400259"), "completed"))
#	Print(yield(rest.get_thread_member("994824485058400259", "321233875776962560"), "completed"))
#	Print(yield(rest.add_thread_member("994824485058400259", "369422213394464770"), "completed"))
#	Print(yield(rest.remove_thread_member("994824485058400259", "369422213394464770"), "completed"))
#	Print(yield(rest.join_thread("994824485058400259"), "completed"))
#	Print(yield(rest.leave_thread("994824485058400259"), "completed"))
#	Print(yield(rest.get_public_archived_threads("369423865618628608", {limit = 2}), "completed"))
#	Print(yield(rest.get_private_archived_threads("369423865618628608", {limit = 2}), "completed"))
#	Print(yield(rest.get_joined_private_archived_threads("369423865618628608"), "completed"))




