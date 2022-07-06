# Represents a Discord embed thumbnail
class_name EmbedThumbnail extends Dataclass

var url: String # Source url of thumbnail (only supports http(s) and attachments)
var proxy_url = null # [String] A proxied url of the thumbnail
var height = null # [int] Height of thumbnail
var width = null # [int] Width of thumbnail


# @hidden
func _init().("EmbedThumbnail"): return self
