# Represents a Discord embed provider
class_name EmbedProvider extends Dataclass

var name = null # [String] Name of provider
var url = null # [String] Url of provider


# @hidden
func _init().("EmbedProvider"): return self
