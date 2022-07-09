# Represents a Discord embed thumbnail
class_name EmbedThumbnail extends DiscordDataclass

var url: String # Source url of thumbnail (only supports http(s) and attachments)
var proxy_url = null # [String] A proxied url of the thumbnail `optional`
var height = null # [int] Height of thumbnail `optional`
var width = null # [int] Width of thumbnail `optional`


# @hidden
func _init().("EmbedThumbnail"): return self
