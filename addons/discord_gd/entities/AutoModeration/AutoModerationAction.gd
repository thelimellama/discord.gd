# Represents a Discord auto moderation action
class_name AutoModerationAction extends Dataclass

var type: int # [AutoModerationActionTypes] The type of action
var metadata = null # [AutoModerationActionMetadata] Additional metadata needed during execution for this specific action type


# @hidden
func _init().("AutoModerationAction"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("metadata"):
		metadata = AutoModerationActionMetadata.new().from_dict(p_dict.metadata)

	return self
