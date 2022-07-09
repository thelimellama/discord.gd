# Represents a Discord auto moderation action metadata
#
# Additional data used when an action is executed.
class_name AutoModerationActionMetadata extends DiscordDataclass

var channel_id: String # Channel to which user content should be logged
var duration_seconds: int # Timeout duration in seconds


# @hidden
func _init().("AutoModerationActionMetadata"): return self
