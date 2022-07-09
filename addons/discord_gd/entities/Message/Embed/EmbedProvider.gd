# Represents a Discord embed provider
class_name EmbedProvider extends DiscordDataclass

var name = null # [String] Name of provider `optional`
var url = null # [String] Url of provider `optional`


# @hidden
func _init().("EmbedProvider"): return self
