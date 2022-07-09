# Represents a Discord auto moderation action
class_name AutoModerationAction extends DiscordDataclass

var type: int # [AutoModerationActionTypes] The type of action
var metadata = null # [AutoModerationActionMetadata] Additional metadata needed during execution for this specific action type `optional`


# @hidden
func _init().("AutoModerationAction"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("metadata"):
		metadata = AutoModerationActionMetadata.new().from_dict(p_dict.metadata)

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "metadata")

	return dict
