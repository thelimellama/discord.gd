# Represents a Discord voice region
class_name VoiceRegion extends Dataclass

var id: String # Unique Id for the region
var name: String # Name of the region
var optimal: bool # True for a single server that is closest to the current user's client
var deprecated: bool # Whether this is a deprecated voice region (avoid switching to these)
var custom: bool # Whether this is a custom voice region (used for events/etc)

# @hidden
func _init().("VoiceRegion"): return self
