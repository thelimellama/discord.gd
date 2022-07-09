# Params for create guild auto moderation rule
class_name CreateGuildAutoModerationRuleParams extends DiscordDataclass

var name: String # The rule name
var event_type: int # [AutoModerationEventTypes] The event type
var trigger_type: int # [AutoModerationTriggerTypes] The trigger type
var trigger_metadata = null # [AutoModerationTriggerMetadata] The trigger metadata `optional`
var actions: Array # [Array] of [AutoModerationAction] The actions which will execute when the rule is triggered
var enabled = null # [bool] Whether the rule is enabled (default is false) `optional`
var exempt_roles = null # [Array] of [String] The role ids that should not be affected by the rule (Maximum of 20) `optional`
var exempt_channels = null # [Array] of [String] The channel ids that should not be affected by the rule (Maximum of 50) `optional`


# @hidden
func _init().("CreateGuildAutoModerationRuleParams"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("trigger_metadata"):
		trigger_metadata = AutoModerationTriggerMetadata.new().from_dict(p_dict.trigger_metadata)

	if p_dict.has("actions"):
		actions = []
		for data in p_dict.actions:
			actions.append(AutoModerationAction.new().from_dict(data))

	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "trigger_metadata")
	DiscordUtils.try_array_dataclass_to_dict(dict, "actions")

	return dict
