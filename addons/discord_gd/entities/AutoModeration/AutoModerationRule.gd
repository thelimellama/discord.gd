# Represents a Discord auto moderation rule
class_name AutoModerationRule extends Dataclass

var id: String # The id of this rule
var guild_id: String # The guild which this rule belongs to
var name: String # The rule name
var creator_id: String # The user which first created this rule
var event_type: int # [AutoModerationEventTypes] The rule event type
var trigger_type: int # [AutoModerationTriggerTypes] The rule trigger type
var trigger_metadata: AutoModerationTriggerMetadata # [AutoModerationTriggerMetadata] The rule trigger metadata
var actions: Array # [Array] of [AutoModerationAction] The actions which will execute when the rule is triggered
var enabled: bool # Whether the rule is enabled
var exempt_roles: Array # Array of [String] The role ids that should not be affected by the rule (Maximum of 20)
var exempt_channels: Array # [Array] of [String] The channel ids that should not be affected by the rule (Maximum of 50)

# @hidden
func _init().("AutoModerationRule"): return self


# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	trigger_metadata = AutoModerationTriggerMetadata.new().from_dict(p_dict.trigger_metadata)
	actions = []
	if p_dict.has("actions"):
		for data in p_dict.actions:
			actions.append(AutoModerationAction.new().from_dict(data))
	return self


# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	dict.trigger_metadata = dict.trigger_metadata.to_dict()
	if dict.has("actions") and dict.actions != null:
		for i in dict.actions.size():
			dict.actions[i] = dict.actions[i].to_dict()

	return dict