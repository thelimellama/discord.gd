# Params for modify stage instance
class_name ModifyStageInstanceParams extends DiscordDataclass


var topic = null # [String] The topic of the Stage instance (1-120 characters) `optional`
var privacy_level = null # [StageInstancePrivacyLevel] The privacy level of the Stage instance (default GUILD_ONLY) `optional`


# @hidden
func _init().("ModifyStageInstanceParams"): return self
