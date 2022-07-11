# Represents a Discord auto moderation rule action execution event
#
# - `message_id` will not exist if message was blocked by automod or content was not part of any message
# - `alert_system_message_id` will not exist if this event does not correspond to an action with type `SEND_ALERT_MESSAGE`
# - `MESSAGE_CONTENT` gateway intent is required to receive non-empty values for the content and `matched_content` fields
class_name AutoModerationActionExecutionEvent extends Dataclass


var guild_id: String # The id of the guild in which action was executed
var action: AutoModerationAction # [AutoModerationAction] The action which was executed
var rule_id: String # The id of the rule which action belongs to
var rule_trigger_type: int # [AutoModerationTriggerTypes] The trigger type of rule which was triggered
var user_id: String # The id of the user which generated the content which triggered the rule
var channel_id = null # [String] The id of the channel in which user content was posted `optional`
var message_id = null # [String] The id of any user message which content belongs to `optional`
var alert_system_message_id = null # [String] The id of any system auto moderation messages posted as a result of this action `optional`
var content: String # The user generated text content
var matched_keyword = null # [String] The word or phrase configured in the rule that triggered the rule `nullable`
var matched_content = null # [String] The substring in content that triggered the rule `nullable`


# @hidden
func _init().("AutoModerationActionExecutionEvent"): return self

# @hidden
func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if p_dict.has("action"):
		action = AutoModerationAction.new().from_dict(p_dict.action)

	return self

# @hidden
func to_dict() -> Dictionary:
	var dict = .to_dict()

	DiscordUtils.try_dataclass_to_dict(dict, "action")

	return dict
