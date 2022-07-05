# Represents a Discord auto moderation trigger metadata
#
# Additional data used to determine whether a rule should be triggered.
class_name AutoModerationTriggerMetadata extends Dataclass

var keyword_lists: Array # [Array] of [String] (Undocumented)
var allow_list: Array # [Array] of [String] (Undocumented)
var keyword_filter: Array # [Array] of [String] Substrings which will be searched for in content
var presets: Array # [Array] of [AutoModerationKeywordPresetTypes] The internally pre-defined wordsets which will be searched for in content


# @hidden
func _init().("AutoModerationTriggerMetadata"): return self
