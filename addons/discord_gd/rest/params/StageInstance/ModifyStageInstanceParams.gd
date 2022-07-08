# Params for modify stage instance
class_name ModifyStageInstanceParams extends Dataclass


var topic = null # [String] The topic of the Stage instance (1-120 characters)
var privacy_level = null # [StageInstancePrivacyLevel] The privacy level of the Stage instance (default GUILD_ONLY)


# @hidden
func _init().("ModifyStageInstanceParams", {include_null_in_dict = false}): return self
