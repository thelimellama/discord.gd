# Params for create stage instance
class_name CreateStageInstanceParams extends Dataclass


var channel_id: String # The id of the Stage channel
var topic: String # The topic of the Stage instance (1-120 characters)
var privacy_level = null # [StageInstancePrivacyLevel] The privacy level of the Stage instance (default GUILD_ONLY)
var send_start_notification = null # [bool] Notify `@everyone` that a Stage instance has started


# @hidden
func _init().("CreateStageInstanceParams", {include_null_in_dict = false}): return self
