# Represents a Discord client status
class_name ClientStatus extends Dataclass

var desktop = null # [String] The user's status set for an active desktop (Windows, Linux, Mac) application session
var mobile = null # [String] The user's status set for an active mobile (iOS, Android) application session
var web = null # [String] The user's status set for an active web (browser, bot account) application session

# @hidden
func _init().("ClientStatus"): return self
