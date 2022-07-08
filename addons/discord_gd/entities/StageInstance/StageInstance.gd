# Represents a Discord stage instance
class_name StageInstance extends Dataclass

var id: String # The id of this Stage instance
var guild_id: String # The guild id of the associated Stage channel
var channel_id: String # The id of the associated Stage channel
var topic: String # The topic of the Stage instance (1-120 characters)
var privacy_level: int # [StagePrivacyLevel] The privacy level of the Stage instance
var discoverable_disabled: bool # Whether or not Stage Discovery is disabled (deprecated)
var guild_scheduled_event_id = null # [String] The id of the scheduled event for this Stage instance

var invite_code = null # [String] (Undocumented)

# @hidden
func _init().("StageInstance"): return self
