# Params for create guild auto moderation rule
class_name CreateGuildAutoModerationRuleParams extends Dataclass

var name: String # The rule name
var event_type: int # [AutoModerationEventTypes] The event type
var trigger_type: int # [AutoModerationTriggerTypes] The trigger type
var trigger_metadata = null # [AutoModerationTriggerMetadata] The trigger metadata
var actions: Array # [Array] of [AutoModerationAction] The actions which will execute when the rule is triggered
var enabled = null # [bool] Whether the rule is enabled (default is false)
var exempt_roles = null # [Array] of [String] The role ids that should not be affected by the rule (Maximum of 20)
var exempt_channels = null # [Array] of [String] The channel ids that should not be affected by the rule (Maximum of 50)


# @hidden
func _init().("CreateGuildAutoModerationRuleParams", {include_null_in_dict = false}): return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	if dict.has("trigger_metadata"):
		dict.trigger_metadata = dict.trigger_metadat.to_dict()

	for i in dict.actions.size():
		dict.actions[i] = dict.actions[i].to_dict()

	return dict
