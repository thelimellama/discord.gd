# Params for create stage instance
class_name CreateStageInstanceParams extends DiscordDataclass


var channel_id: String # The id of the Stage channel
var topic: String # The topic of the Stage instance (1-120 characters)
var privacy_level = null # [StageInstancePrivacyLevel] The privacy level of the Stage instance (default GUILD_ONLY) `optional`
var send_start_notification = null # [bool] Notify `@everyone` that a Stage instance has started (stage moderator must have `MENTION_EVERYONE` permission) `optional`


# @hidden
func _init().("CreateStageInstanceParams"): return self
