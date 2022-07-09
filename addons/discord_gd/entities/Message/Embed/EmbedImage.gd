# Represents a Discord embed image
class_name EmbedImage extends DiscordDataclass

var url: String # Source url of image (only supports http(s) and attachments)
var proxy_url = null # [String]	A proxied url of the image `optional`
var height = null # [int] Height of image `optional`
var width = null # [int] Width of image `optional`


# @hidden
func _init().("EmbedImage"): return self
