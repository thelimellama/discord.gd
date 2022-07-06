# Represents a Discord embed image
class_name EmbedImage extends Dataclass

var url: String # Source url of image (only supports http(s) and attachments)
var proxy_url = null # [String]	A proxied url of the image
var height = null # [int] Height of image
var width = null # [int] Width of image


# @hidden
func _init().("EmbedImage"): return self
